<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRoles.aspx.cs" Inherits="testApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h1>Add new roles</h1> 
    <br />
        <div class ="form-group" >
            <small ID="formHelp" class="form-text text-muted">Please complete the form in order to create new roles. All the fields are mandatory.</small><br /><br />
            <label for ="Role ID">Enter Role ID</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="RoleID"></asp:TextBox>
            <label for ="Role ID">Enter Role Name</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="RoleName"></asp:TextBox>
        </div>

        <div style="text-align: center">
        <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" OnClick="btn1_Click" Text="Generate Role"/>
        <asp:Button ID="Btn2" runat="server" CssClass="btn btn-danger btn-lg" OnClick="btn2_Click" Text="Clear Data"/>
        </div>

    <br />
    <div class=”table-responsive”>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="RolesDataSource" ForeColor="#333333" GridLines="None" HorizontalAlign="Justify" CssClass="table table-striped" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="RolesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [AspNetRoles] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AspNetRoles] ([Id], [Name]) VALUES (@Id, @Name)" SelectCommand="SELECT * FROM [AspNetRoles]" UpdateCommand="UPDATE [AspNetRoles] SET [Name] = @Name WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="RoleID" Name="Id" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="RoleName" Name="Name" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Id" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
