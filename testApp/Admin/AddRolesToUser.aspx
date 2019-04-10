<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRolesToUser.aspx.cs" Inherits="testApp.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <br />
    <h1>Assign roles to Users </h1> 
        <div class ="form-group" >
            <small ID="formHelp" class="form-text text-muted">Please complete the form below in order to asign existing roles to users. All the fields are mandatory.</small><br /><br />
            <label for ="User Name">Select an existing user from the dropdown list</label>
           <asp:DropDownList runat="server" CssClass="form-control" ID="User" DataTextField="UserName" DataValueField="Id" AppendDataBoundItems="True" DataSourceID="DropDownDataSource1">
               <asp:ListItem>Select User Name</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="DropDownDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Id], [UserName] FROM [AspNetUsers]"></asp:SqlDataSource>
            <label for ="Role ID">Select the role you wish to assign to the user</label>
           <asp:DropDownList runat="server" CssClass="form-control" ID="role"  DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True" DataSourceID="DropDownDataSource2">
               <asp:ListItem>Select Role</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="DropDownDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AspNetRoles]"></asp:SqlDataSource>
        </div>
        <div style="text-align: right">
        <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" Text="Generate Role" OnClick="btn1_Click"/>
        <asp:Button ID="Btn2" runat="server" CssClass="btn btn-danger btn-lg" Text="Clear Data" OnClick="Btn2_Click"/>
        </div>
    <div class=”table-responsive”>
    <small ID="GridViewHelp" class="form-text text-muted">Below you can see,edit and delete the existing roles assigned to users</small>
    <asp:GridView runat="server" ID="GridView1" CssClass="table table-striped" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserId,RoleId" DataSourceID="GridViewDataSource" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
            <asp:BoundField DataField="RoleId" HeaderText="RoleId" ReadOnly="True" SortExpression="RoleId" />
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


        <asp:SqlDataSource ID="GridViewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [AspNetUserRoles] WHERE [UserId] = @UserId AND [RoleId] = @RoleId" InsertCommand="INSERT INTO [AspNetUserRoles] ([UserId], [RoleId]) VALUES (@UserId, @RoleId)" SelectCommand="SELECT * FROM [AspNetUserRoles]">
            <DeleteParameters>
                <asp:Parameter Name="UserId" Type="String" />
                <asp:Parameter Name="RoleId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="User" Name="UserId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="role" Name="RoleId" PropertyName="SelectedValue" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>


    </div>
</asp:Content>
