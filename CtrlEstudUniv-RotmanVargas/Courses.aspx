<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-12">
            <h1>Administración de Cursos</h1>
        </div>
         <div class="col-12">
            <h2>Agregar Cursos</h2>
        </div>
        <div class="col-12">
            
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSourceCourses" DefaultMode="Insert" Height="50px" Width="253px">
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="NombreEscuela" HeaderText="NombreEscuela" SortExpression="NombreEscuela" />
                    <asp:BoundField DataField="NombreCurso" HeaderText="NombreCurso" SortExpression="NombreCurso" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSourceCourses" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Courses] WHERE [Id] = @original_Id AND [NombreEscuela] = @original_NombreEscuela AND [NombreCurso] = @original_NombreCurso AND [Descripcion] = @original_Descripcion AND [Precio] = @original_Precio" InsertCommand="INSERT INTO [Courses] ([NombreEscuela], [NombreCurso], [Descripcion], [Precio]) VALUES (@NombreEscuela, @NombreCurso, @Descripcion, @Precio)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [NombreEscuela] = @NombreEscuela, [NombreCurso] = @NombreCurso, [Descripcion] = @Descripcion, [Precio] = @Precio WHERE [Id] = @original_Id AND [NombreEscuela] = @original_NombreEscuela AND [NombreCurso] = @original_NombreCurso AND [Descripcion] = @original_Descripcion AND [Precio] = @original_Precio">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_NombreEscuela" Type="String" />
                    <asp:Parameter Name="original_NombreCurso" Type="String" />
                    <asp:Parameter Name="original_Descripcion" Type="String" />
                    <asp:Parameter Name="original_Precio" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NombreEscuela" Type="String" />
                    <asp:Parameter Name="NombreCurso" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Precio" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NombreEscuela" Type="String" />
                    <asp:Parameter Name="NombreCurso" Type="String" />
                    <asp:Parameter Name="Descripcion" Type="String" />
                    <asp:Parameter Name="Precio" Type="Decimal" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_NombreEscuela" Type="String" />
                    <asp:Parameter Name="original_NombreCurso" Type="String" />
                    <asp:Parameter Name="original_Descripcion" Type="String" />
                    <asp:Parameter Name="original_Precio" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
    </div>
     <div class="row">
         <div class="col-12">
            <h2>Lista de Cursos</h2>
        </div>
        <div class="col-12">
            
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceCourses" Width="988px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id curso" SortExpression="Id" />
                    <asp:BoundField DataField="NombreEscuela" HeaderText="Nombre de Escuela" SortExpression="NombreEscuela" />
                    <asp:BoundField DataField="NombreCurso" HeaderText="Nombre de Curso" SortExpression="NombreCurso" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                </Columns>
            </asp:GridView>
            
        </div>
    </div>
 
    <div class="row">
         <div class="col-12">
            <h2>Consultar Cursos por carrera</h2>
        </div>
         <div class="col-6">
             <asp:Label ID="Label4" runat="server" style="margin-bottom:10px" Text="Carreras: "></asp:Label>
             <asp:DropDownList style="margin-right:10px" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="NombreCarrera" DataValueField="Id" AutoPostBack="True">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Career]"></asp:SqlDataSource>
             
             <asp:Label ID="Label5" runat="server" Text="Cursos: "></asp:Label>
             <asp:DropDownList ID="DropDownList4" runat="server"  DataTextField="NombreCurso" DataValueField="Id" AutoPostBack="True" >
             </asp:DropDownList>

             
             <asp:Button ID="Button3" runat="server" OnClick="RegistrarCursoClick" Text="Registrar Curso" Width="256px" />

         </div>
        <div class="col-6" style="margin-top:15px">
            <asp:Button ID="Button2" runat="server" Text="Consultar o Recargar" onClick="Consultar_CursosPorCarrera" Width="258px"/>
            <asp:Button ID="Button4" style="margin-left:15px" runat="server" Text="Actualizar cursos" Width="255px" OnClick="CargarCursosClick" />
        </div>
        <div class="col-12" style="margin-top:15px">
            <asp:Label ID="Label2" runat="server" Text="Carrera Consultada:"></asp:Label>
            <asp:TextBox ID="CarreraResponse" style="margin-bottom:10px" runat="server"></asp:TextBox>
            <asp:GridView ID="GridView3" runat="server"></asp:GridView>
        </div>
    </div>
</asp:Content>