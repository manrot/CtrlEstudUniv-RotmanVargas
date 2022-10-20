<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Courses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script runat="server">
        private void Button1_Click (object source, EventArgs e) {
            SqlDataSourcePrueba.Insert();

        }
   


</script>

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
            <h2>Cursos por carrera</h2>
        </div>
         <div class="col-6">
             <asp:Label ID="Label1" runat="server" Text="Carreras: "></asp:Label>
             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceCareers" DataTextField="NombreCarrera" DataValueField="Id" AutoPostBack="True">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSourceCareers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Career]"></asp:SqlDataSource>
        </div>
           <div class="col-6">
             <asp:Label ID="Label3" runat="server" Text="Cursos: "></asp:Label>
             <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceCoursesRCareers" DataTextField="NombreCurso" DataValueField="Id" AutoPostBack="True">
             </asp:DropDownList>
               <asp:SqlDataSource ID="SqlDataSourceCoursesRCareers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Courses]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Courses] WHERE [Id] = @original_Id AND [NombreEscuela] = @original_NombreEscuela AND [NombreCurso] = @original_NombreCurso AND [Descripcion] = @original_Descripcion AND [Precio] = @original_Precio" InsertCommand="INSERT INTO [Courses] ([NombreEscuela], [NombreCurso], [Descripcion], [Precio]) VALUES (@NombreEscuela, @NombreCurso, @Descripcion, @Precio)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Courses] SET [NombreEscuela] = @NombreEscuela, [NombreCurso] = @NombreCurso, [Descripcion] = @Descripcion, [Precio] = @Precio WHERE [Id] = @original_Id AND [NombreEscuela] = @original_NombreEscuela AND [NombreCurso] = @original_NombreCurso AND [Descripcion] = @original_Descripcion AND [Precio] = @original_Precio">
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
               
               <asp:sqldatasource
        id="SqlDataSourcePrueba"
        runat="server"
        connectionstring="<%$ ConnectionStrings:ConnectionString %>"
        selectcommand=""
        insertcommand="INSERT INTO CoursesRelationCareer (IdCourse,IdCareer) VALUES (@Course,@Career)">
          <insertparameters>
            <asp:ControlParameter ControlID="DropDownList2" DefaultValue="0" PropertyName="SelectedValue" name="Course"  />
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" PropertyName="SelectedValue" name="Career"   />
          </insertparameters>
      </asp:sqldatasource>

               <asp:Button ID="Button1" runat="server" Text="Agregar Curso a Carrera" OnClick="Button1_Click"/>
           </div>
        <div class="col-12">
            <asp:Label ID="Label2" runat="server" Text="Cursos de la carrera"></asp:Label>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRelationCareersCourses">
                <Columns>
                    <asp:BoundField DataField="NombreEscuela" HeaderText="NombreEscuela" SortExpression="NombreEscuela" />
                    <asp:BoundField DataField="NombreCurso" HeaderText="NombreCurso" SortExpression="NombreCurso" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceRelationCareersCourses" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
               SelectCommand="SELECT Courses.NombreEscuela, Courses.NombreCurso, Courses.Descripcion, Courses.Precio FROM Career INNER JOIN CoursesRelationCareer ON Career.Id = CoursesRelationCareer.IdCareer INNER JOIN Courses ON CoursesRelationCareer.IdCourse = Courses.Id WHERE (Career.Id = @IdCareer)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" DefaultValue="0" Name="IdCareer" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            </div>
    </div>
   

</asp:Content>