using Antlr.Runtime.Misc;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Configuration;
using System.Drawing;

public partial class Courses : System.Web.UI.Page
{
    string conf = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conection;
    SqlCommand command;
    SqlDataAdapter adapter;
    DataTable dataTable;


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CargarCursos() {
        using (conection = new SqlConnection(conf))
        {
            conection.Open();
            command = new SqlCommand("SELECT * FROM [Courses]", conection);
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataSet dt = new DataSet();
            da.Fill(dt);

            this.DropDownList4.DataSource = dt;
            this.DropDownList4.DataTextField = "NombreCurso";
            this.DropDownList4.DataValueField = "Id";

            DropDownList4.DataBind();
            conection.Close();
         
        }
    }
    protected void Consultar_CursosPorCarreraF() {
        if (DropDownList3.SelectedValue != "")
        {
            using (conection = new SqlConnection(conf))
            {
                conection.Open();
                command = new SqlCommand("SELECT Courses.Id,Courses.NombreEscuela, Courses.NombreCurso, Courses.Descripcion, Courses.Precio FROM Career INNER JOIN CoursesRelationCareer ON Career.Id = CoursesRelationCareer.IdCareer INNER JOIN Courses ON CoursesRelationCareer.IdCourse = Courses.Id WHERE (Career.Id = @IdCareerCon)", conection);
                command.Parameters.AddWithValue("@IdCareerCon", DropDownList3.SelectedValue);
                adapter = new SqlDataAdapter(command);
                dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView3.DataSource = dataTable;
                GridView3.DataBind();
                conection.Close();
                CarreraResponse.Text = DropDownList3.Items[DropDownList3.SelectedIndex].Text;

            }
        }
    }

    protected void Consultar_CursosPorCarrera(object sender, EventArgs e)
    {
        Consultar_CursosPorCarreraF();
    }

    protected void RegistrarCursoClick(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedValue != "" && DropDownList4.SelectedValue!="")
        {
            using (conection = new SqlConnection(conf))
            {
                conection.Open();
                command = new SqlCommand("INSERT INTO CoursesRelationCareer (IdCourse,IdCareer) VALUES (@Course,@Career)", conection);
                command.Parameters.AddWithValue("@Course", DropDownList4.SelectedValue);
                command.Parameters.AddWithValue("@Career", DropDownList3.SelectedValue);
                command.ExecuteNonQuery();
                conection.Close();
                Consultar_CursosPorCarreraF();
            }
        }
    }

    protected void CargarCursosClick(object sender, EventArgs e)
    {
        CargarCursos();
    }
}
       