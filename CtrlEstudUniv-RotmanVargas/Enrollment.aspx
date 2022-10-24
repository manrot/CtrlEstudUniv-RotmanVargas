<%@ Page Title="Enrollment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Enrollment.aspx.cs" Inherits="Enrollment" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-12">
           <h1>Matricula de estudiantes</h1> 
        </div>
        <div class="col-12" style="margin-top:15px">
            <h2>Buscar estudiante</h2>
        </div>
        <div class="col-12" style="margin-top:15px">
            <asp:Label ID="Label1" runat="server" Text="Identificación: "></asp:Label>
            <asp:TextBox ID="IdentificationSearch" runat="server" style="margin-right:15px"></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="Buscar Estudiante" OnClick="ButtonSearch_Click" Width="216px" />
        </div>
        <div class="col-12" style="margin-top:10px">
            <asp:Label ID="ErrorLoad" runat="server" Style="color:crimson" Text=""></asp:Label>
        </div>
        <div class="col-12" style="margin-top:20px; border-bottom:1px solid #808080">
        </div>
    </div>
    <div class="row" style="margin-top:15px">
        <div class="col-12">
            <h2>Formulario de matricula</h2>
        </div>
        <div class="col-12" style="margin-top:15px">
            <asp:Label ID="Label2" runat="server" Text="Id estudiante: "></asp:Label>
            <asp:TextBox ID="Id_StudentInput" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
       
        
            <asp:Label ID="Label3" style="margin-left:15px" runat="server" Text="Identificación: "></asp:Label>
            <asp:TextBox ID="IdentificacionStudent" runat="server" ReadOnly="True" Width="139px" Enabled="False"></asp:TextBox>
       
        
            <asp:Label ID="Label4" style="margin-left:15px" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="Name_Student" runat="server" ReadOnly="True" Width="289px" Enabled="False"></asp:TextBox>
        </div>
        <div class="col-12" style="margin-top:15px">
            <asp:Label ID="Label5"  runat="server" Text="Seleccione un curso para matricular: "></asp:Label>
            <asp:DropDownList ID="DropDownListCourses" style="margin-left:15px" runat="server" Enabled="False" Height="30px" Width="234px"></asp:DropDownList>
            <asp:Label ID="Label7"  runat="server" style="margin-left:10px" Text="Seleccione el cuatrimestre: "></asp:Label>
            <asp:DropDownList ID="Cuatrimestres" style="margin-left:10px" runat="server" Height="30px" Width="153px">
                <asp:ListItem Value="Primer Cuatrimestre">Primer Cuatrimestre</asp:ListItem>
                <asp:ListItem Value="Segundo Cuatrimestre">Segundo Cuatrimestre</asp:ListItem>
                <asp:ListItem Value="Tercer Cuatrimestre">Tercer Cuatrimestre</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="AgregarCursoMatri" runat="server" Text="Agregar a la matricula" OnClick="AgregarCursoMatri_Click" Enabled="False" />
        </div>
         <div class="col-12" style="margin-top:15px">
            <h4>Cursos que se matricularan</h4>
             <asp:GridView ID="GridView1" runat="server" Visible="False" Width="698px">
             </asp:GridView>
        </div>
        <div class="col-12" style="margin-top:15px">
            <asp:Label ID="Label6" runat="server" Text="Total a pagar: " Visible="False"></asp:Label>
            <asp:TextBox ID="MontoTotal" runat="server" style="margin-right:15px" Enabled="False" Visible="False"></asp:TextBox>
            <asp:Button ID="Matricular" runat="server" Text="Matricular Cursos" Height="29px" OnClick="Matricular_Click" Width="215px" Visible="False" />
        </div>
        <div class="col-12" style="margin-top:15px">

        </div>
        <div class="col-12" style="margin-top:15px">
            <asp:GridView ID="GridView2" runat="server"></asp:GridView>
        </div>

    </div>
   </div>
</asp:Content>
