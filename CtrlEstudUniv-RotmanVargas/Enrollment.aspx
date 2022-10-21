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
            <asp:Label ID="Label2" runat="server" Text="Id estudiante: "></asp:Label>
            <asp:TextBox ID="Id_StudentInput" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
       
        
            <asp:Label ID="Label3" style="margin-left:15px" runat="server" Text="Identificación: "></asp:Label>
            <asp:TextBox ID="IdentificacionStudent" runat="server" ReadOnly="True" Width="139px" Enabled="False"></asp:TextBox>
       
        
            <asp:Label ID="Label4" style="margin-left:15px" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="Name_Student" runat="server" ReadOnly="True" Width="289px" Enabled="False"></asp:TextBox>
        </div>

    </div>
   </div>
</asp:Content>
