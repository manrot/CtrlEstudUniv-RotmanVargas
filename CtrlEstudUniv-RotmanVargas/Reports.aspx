
<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-12" style="margin-bottom:15px; margin-top: 20px" >
        <asp:Label ID="Label1" runat="server" Text="Seleccione un curso:" style="margin-right:10px"></asp:Label>
        <asp:DropDownList ID="Cursos" style="margin-right:10px" runat="server" Height="26px" Width="239px" DataSourceID="SqlDataSource1" DataTextField="NombreCurso" DataValueField="Id"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Courses]"></asp:SqlDataSource>
        <asp:Button ID="ChargeCourses" runat="server" Text="Cargar estudiantes matriculados" OnClick="ChargeCourses_Click" />
    </div>
    <div class="col-12" style="margin-bottom:15px" >
        <asp:GridView ID="GridView1" runat="server" Width="733px"></asp:GridView>
    </div>
    <div class="col-12" style="margin-bottom:15px">
        <asp:Label ID="Label2" runat="server" Text="Matriculas"></asp:Label>
    </div>
    <div class="col-12" style="margin-bottom:15px">
        <asp:GridView ID="GridView2" runat="server" Width="921px" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id Matricula" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Cuatrimestre" HeaderText="Cuatrimestre" SortExpression="Cuatrimestre" />
                <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Enrollment.Id, Enrollment.Cuatrimestre, Students.Identificacion, Students.Nombre, Enrollment.Fecha, Enrollment.Total FROM Enrollment INNER JOIN Students ON Enrollment.Id_Student = Students.Id"></asp:SqlDataSource>
    </div>
    <div class="col-12" style="margin-bottom:15px">
        <asp:Label ID="Label3" runat="server" Text="Monto total de matriculas:" style="margin-right:10px"></asp:Label>
        <asp:TextBox ID="TotalMatriculas" runat="server" Width="199px"></asp:TextBox>
        <asp:Button ID="CargarTotal" runat="server" Text="Cargar total" style="margin-right:10px" OnClick="CargarTotal_Click" Width="141px" />
    </div>
    <div class="col-12" style="margin-bottom:15px">
        <asp:Label ID="Label5" runat="server" Text="Seleccione un cuatrimestre:" style="margin-right:10px"></asp:Label>
        <asp:DropDownList ID="Cuatrimestres" style="margin-right:10px" runat="server" Height="30px" Width="153px">
                <asp:ListItem Value="Primer Cuatrimestre">Primer Cuatrimestre</asp:ListItem>
                <asp:ListItem Value="Segundo Cuatrimestre">Segundo Cuatrimestre</asp:ListItem>
                <asp:ListItem Value="Tercer Cuatrimestre">Tercer Cuatrimestre</asp:ListItem>
            </asp:DropDownList>
         <asp:Label ID="Label6" runat="server" Text="Monto total por cuatrimestre:" style="margin-right:10px"></asp:Label>
        <asp:TextBox ID="TotalMatriculasCuatri" runat="server" Width="199px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Cargar total por cuatrimestre" style="margin-right:10px" OnClick="CargarTotalCuatri_Click" Width="278px" />
    </div>
    <div class="col-12" style="margin-bottom:15px">
        <asp:Label ID="Label4" runat="server" Text="Porcentaje de cursos matriculados"></asp:Label>
    </div>
      <div class="col-12" style="margin-bottom:15px">
          <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="801px">
              <Columns>
                  <asp:BoundField DataField="IdCourse" HeaderText="IdCourse" SortExpression="IdCourse" />
                  <asp:BoundField DataField="CantidadCourses" HeaderText="CantidadCourses" ReadOnly="True" SortExpression="CantidadCourses" />
                  <asp:BoundField DataField="TotalMatriculados" HeaderText="TotalMatriculados" ReadOnly="True" SortExpression="TotalMatriculados" />
                  <asp:BoundField DataField="Porcentaje" HeaderText="Porcentaje" ReadOnly="True" SortExpression="Porcentaje" />
              </Columns>
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select distinct IdCourse, COUNT(IdCourse) as CantidadCourses, (select count(IdCourse) from DetailsEnrollment) as TotalMatriculados  , CONVERT(FLOAT,COUNT(IdCourse)*100)/(select count(IdCourse) from DetailsEnrollment) as Porcentaje from DetailsEnrollment group by IdCourse
"></asp:SqlDataSource>
    </div>
</asp:Content>