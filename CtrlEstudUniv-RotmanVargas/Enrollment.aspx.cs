using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Reflection;
using System.Activities.Expressions;

public partial class Enrollment : System.Web.UI.Page
{
    string conf = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conection;
    SqlCommand command;
    SqlDataAdapter adapter;
    DataTable dataTable;
    SqlDataReader dataReader;
    string arrayCourseSelected = "";

    DataTable tabla = new DataTable();
    // Variables para las columnas y las filas
    DataColumn column;
    DataRow row;
    protected void Page_Load(object sender, EventArgs e)
    {

      

        column = new DataColumn();
        column.DataType = System.Type.GetType("System.Int32");
        column.ColumnName = "IdCurso";
        tabla.Columns.Add(column);

        column = new DataColumn();
        column.DataType = Type.GetType("System.String");
        column.ColumnName = "NombreCurso";
        tabla.Columns.Add(column);

        column = new DataColumn();
        column.DataType = Type.GetType("System.String");
        column.ColumnName = "Descripcion";
        tabla.Columns.Add(column);

        column = new DataColumn();
        column.DataType = Type.GetType("System.String");
        column.ColumnName = "Precio";
        tabla.Columns.Add(column);


    }
    protected void CargarCursosFilter()
    {
        using (conection = new SqlConnection(conf))
        {

            conection.Open();
            command = new SqlCommand("SELECT * FROM [Courses]", conection);
  
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataSet dt = new DataSet();
            da.Fill(dt);

            this.DropDownListCourses.DataSource = dt;
            this.DropDownListCourses.DataTextField = "NombreCurso";
            this.DropDownListCourses.DataValueField = "Id";

            DropDownListCourses.DataBind();
            conection.Close();
            ErrorLoad.Text = arrayCourseSelected;
        }
    }
    protected void CargarEstudiante()
    {
        if (IdentificationSearch.Text != "")
        {
            using (conection = new SqlConnection(conf))
            {
                conection.Open();
                command = new SqlCommand("SELECT * FROM [Students] WHERE (Students.Identificacion = @Identify)", conection);
                command.Parameters.AddWithValue("@Identify", IdentificationSearch.Text);
                dataReader = command.ExecuteReader();
                if (dataReader.HasRows) {
                    dataReader.Read();
                    Id_StudentInput.Text = dataReader["Id"].ToString();
                    IdentificacionStudent.Text = dataReader["Identificacion"].ToString();
                    Name_Student.Text = dataReader["Nombre"].ToString() +" " + dataReader["Apellido1"].ToString() + " " + dataReader["Apellido2"].ToString();
                    DropDownListCourses.Enabled = true;
                    CargarCursosFilter();
                    AgregarCursoMatri.Enabled = true;
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                }
                else {
                    ErrorLoad.Text = "No se encontró el estudiante";
                }

                conection.Close();
            }
        }
        else {
            ErrorLoad.Text = "No hay una identificación para buscar";
            IdentificationSearch.Text = "";
        }
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        CargarEstudiante();
    }

    protected void AgregarCursoMatri_Click(object sender, EventArgs e)
    {
        double precioTotal = 0.00;
        string IdCourseCharge = DropDownListCourses.SelectedValue;
        using (conection = new SqlConnection(conf))
        {
            conection.Open();
            command = new SqlCommand("SELECT * FROM [Courses] WHERE Id = @CourseSelected", conection);
            command.Parameters.AddWithValue("@CourseSelected", IdCourseCharge);

            SqlDataReader leer = command.ExecuteReader();
            ListItem itemToRemove = DropDownListCourses.Items.FindByValue(IdCourseCharge);
            if (itemToRemove != null)
            {
                DropDownListCourses.Items.Remove(itemToRemove);
            }

            if (GridView1.Rows.Count>0)
            {
                for (int fila = 0; fila < GridView1.Rows.Count; fila++)
                {       
                    DataRow dr = tabla.NewRow();
                    dr["IdCurso"] = GridView1.Rows[fila].Cells[0].Text.ToString();
                    dr["NombreCurso"] = Server.HtmlDecode(GridView1.Rows[fila].Cells[1].Text);
                    dr["Descripcion"] = Server.HtmlDecode(GridView1.Rows[fila].Cells[2].Text);
                    dr["Precio"] = GridView1.Rows[fila].Cells[3].Text;
                    precioTotal = precioTotal + Convert.ToDouble(GridView1.Rows[fila].Cells[3].Text);
                    tabla.Rows.Add(dr);
                }
            }

            if (leer.Read()) {
                row = tabla.NewRow();
                row["IdCurso"] = leer.GetInt32(0);
                row["NombreCurso"] = leer.GetString(2);
                row["Descripcion"] = leer.GetString(3);
                row["Precio"] = leer.GetString(4);
                precioTotal = precioTotal + Convert.ToDouble(leer.GetString(4));
                tabla.Rows.Add(row);
            }
            GridView1.DataSource = tabla;

            GridView1.DataBind();
            conection.Close();
            Matricular.Visible = true;
            Label6.Visible = true;
            MontoTotal.Visible = true;
            MontoTotal.Text = precioTotal.ToString();

        }
    }
    protected void Matricular_Click(object sender, EventArgs e)
    {
        using (conection = new SqlConnection(conf))
        {
            conection.Open();
            command = new SqlCommand("INSERT INTO Enrollment (Id_Student,Fecha, Total) OUTPUT INSERTED.Id VALUES (@IdStudent,@FechaEnroll, @Total)", conection);
            command.Parameters.AddWithValue("@IdStudent", Id_StudentInput.Text);
            command.Parameters.AddWithValue("@Total", Convert.ToDouble(MontoTotal.Text));
            command.Parameters.AddWithValue("@FechaEnroll", DateTime.UtcNow.ToString("MM-dd-yyyy"));




            String EnrollmentInserted = Convert.ToString(command.ExecuteScalar());
            for (int fila = 0; fila < GridView1.Rows.Count; fila++)
            {
                command = new SqlCommand("INSERT INTO DetailsEnrollment (IdNumRegister,Id_Enrollment,IdCourse,Precio) VALUES (@IdNumRegister,@IdEnrollment,@IdCurso,@PrecioCurso)", conection);
                command.Parameters.AddWithValue("@IdNumRegister", fila+1);
                command.Parameters.AddWithValue("@IdEnrollment", EnrollmentInserted);
                command.Parameters.AddWithValue("@IdCurso", Convert.ToInt32(GridView1.Rows[fila].Cells[0].Text.ToString()));
                command.Parameters.AddWithValue("@PrecioCurso", GridView1.Rows[fila].Cells[3].Text);
                command.ExecuteNonQuery();
            }

            conection.Close();
            Matricular.Visible = false;
            GridView1.DataSource = null;
            GridView1.DataBind();
            Id_StudentInput.Text = "";
            IdentificacionStudent.Text = "";
            Name_Student.Text = "";
            DropDownListCourses.Items.Clear();
            DropDownListCourses.DataSource = null;
            DropDownListCourses.DataBind();
            DropDownListCourses.Enabled = false;
            AgregarCursoMatri.Enabled = false;
            Label6.Visible = false;
            MontoTotal.Visible = false;
            MontoTotal.Text = "";

        }
    }
}