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

public partial class Enrollment : System.Web.UI.Page
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
}