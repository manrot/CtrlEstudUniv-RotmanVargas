using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Configuration;

public partial class Reports : System.Web.UI.Page
{
    string conf = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    SqlConnection conection;
    SqlCommand command;
    SqlDataAdapter adapter;
    DataTable dataTable;
    SqlDataReader dataReader;

   
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void ChargeCourses_Click(object sender, EventArgs e)
    {
        string IdCourse = Cursos.SelectedValue;
        using (conection = new SqlConnection(conf))
        {
            conection.Open();
            command = new SqlCommand("SELECT Courses.Id, Courses.NombreCurso, Students.Identificacion, Students.Nombre, Students.Apellido1, Students.Apellido2 FROM Students INNER JOIN Enrollment ON Students.Id = Enrollment.Id_Student INNER JOIN DetailsEnrollment ON Enrollment.Id = DetailsEnrollment.Id_Enrollment INNER JOIN Courses ON DetailsEnrollment.IdCourse = Courses.Id WHERE (Courses.Id = @CourseSelected)", conection);
            command.Parameters.AddWithValue("@CourseSelected", IdCourse);

            adapter = new SqlDataAdapter(command);
            dataTable = new DataTable();
            adapter.Fill(dataTable);
            GridView1.DataSource = dataTable;

            GridView1.DataBind();
            conection.Close();
            
        }
    }

    protected void CargarTotal_Click(object sender, EventArgs e)
    {
        using (conection = new SqlConnection(conf))
        {
            conection.Open();
            command = new SqlCommand("select sum(Total) from Enrollment", conection);

            String EnrollmentInserted = Convert.ToString(command.ExecuteScalar());
            TotalMatriculas.Text = EnrollmentInserted;

            conection.Close();
        }
    }

    protected void CargarTotalCuatri_Click(object sender, EventArgs e)
    {
        using (conection = new SqlConnection(conf))
        {
            conection.Open();

            command = new SqlCommand("select sum(Total) from Enrollment where Cuatrimestre=@Cuatri", conection);
            command.Parameters.AddWithValue("@Cuatri", Cuatrimestres.SelectedValue);
            String TotalMatriculasCuatrivar = Convert.ToString(command.ExecuteScalar());
            TotalMatriculasCuatri.Text = TotalMatriculasCuatrivar;

            conection.Close();
        }
    }
}