<%@ Page Title="Students" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-12">
            <h1>Administración de estudiantes</h1>
        </div>
         <div class="col-12">
            <h2>Agregar Estudiantes</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-12 m-b-m">

            <asp:DetailsView ID="DetailsView1" runat="server" Height="65px" Width="198px" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSourceUni" DefaultMode="Insert" OnPageIndexChanging="DetailsView1_PageIndexChanging" >
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido1" HeaderText="Apellido1" SortExpression="Apellido1" />
                    <asp:BoundField DataField="Apellido2" HeaderText="Apellido2" SortExpression="Apellido2" />
                    <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento" ApplyFormatInEditMode="True" />
                    <asp:BoundField DataField="FechaIngreso" HeaderText="FechaIngreso"  ApplyFormatInEditMode="true" />         
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSourceUni" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Students] WHERE [Id] = @original_Id AND [Identificacion] = @original_Identificacion AND [Nombre] = @original_Nombre AND [Apellido1] = @original_Apellido1 AND (([Apellido2] = @original_Apellido2) OR ([Apellido2] IS NULL AND @original_Apellido2 IS NULL)) AND [FechaNacimiento] = @original_FechaNacimiento AND [FechaIngreso] = @original_FechaIngreso" InsertCommand="INSERT INTO [Students] ([Identificacion], [Nombre], [Apellido1], [Apellido2], [FechaNacimiento], [FechaIngreso]) VALUES (@Identificacion, @Nombre, @Apellido1, @Apellido2, @FechaNacimiento, @FechaIngreso)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Students]" UpdateCommand="UPDATE [Students] SET [Identificacion] = @Identificacion, [Nombre] = @Nombre, [Apellido1] = @Apellido1, [Apellido2] = @Apellido2, [FechaNacimiento] = @FechaNacimiento, [FechaIngreso] = @FechaIngreso WHERE [Id] = @original_Id AND [Identificacion] = @original_Identificacion AND [Nombre] = @original_Nombre AND [Apellido1] = @original_Apellido1 AND (([Apellido2] = @original_Apellido2) OR ([Apellido2] IS NULL AND @original_Apellido2 IS NULL)) AND [FechaNacimiento] = @original_FechaNacimiento AND [FechaIngreso] = @original_FechaIngreso">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Identificacion" Type="String" />
                    <asp:Parameter Name="original_Nombre" Type="String" />
                    <asp:Parameter Name="original_Apellido1" Type="String" />
                    <asp:Parameter Name="original_Apellido2" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_FechaNacimiento" />
                    <asp:Parameter DbType="Date" Name="original_FechaIngreso"  />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Identificacion" Type="String" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Apellido1" Type="String" />
                    <asp:Parameter Name="Apellido2" Type="String" />
                    <asp:Parameter DbType="Date" Name="FechaNacimiento" />
                    <asp:Parameter DbType="Date" Name="FechaIngreso" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Identificacion" Type="String" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Apellido1" Type="String" />
                    <asp:Parameter Name="Apellido2" Type="String" />
                    <asp:Parameter DbType="Date" Name="FechaNacimiento" />
                    <asp:Parameter DbType="Date" Name="FechaIngreso" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Identificacion" Type="String" />
                    <asp:Parameter Name="original_Nombre" Type="String" />
                    <asp:Parameter Name="original_Apellido1" Type="String" />
                    <asp:Parameter Name="original_Apellido2" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_FechaNacimiento"/>
                    <asp:Parameter DbType="Date" Name="original_FechaIngreso" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
        <div class="col-12">
            <h2>Lista de Estudiantes
            </h2>
        </div>
         <div class="col-12">
            
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceUni" Width="1101px">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" />
                     <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                     <asp:BoundField DataField="Apellido1" HeaderText="Apellido1" SortExpression="Apellido1" />
                     <asp:BoundField DataField="Apellido2" HeaderText="Apellido2" SortExpression="Apellido2" />
                     <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento" />
                     <asp:BoundField DataField="FechaIngreso" HeaderText="FechaIngreso" SortExpression="FechaIngreso" />
                 </Columns>
             </asp:GridView>
            
        </div>
    </div>
</asp:Content>
