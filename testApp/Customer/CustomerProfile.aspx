<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="testApp.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
    <div class="col-md-6">
    <div><h1>Customer Details <i class="far fa-user"></i></h1></div>
    <hr />
    </div>
    <div class="col-md-6">
    <div><h1>Already registered?</h1></div>
    <hr />
    </div>
    </div>
    <div class="row">
        <div class="col-md-6">
        <div class ="form-group" id="RegisterUserForm" >
            <em ID="formHelp" class="form-text text-muted">Please complete the form in order to register your customer details.</em>
            <br />
            <br />
            <label for ="UserFName">Enter your name</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="UserFName"></asp:TextBox>
            <label for ="UserSName">Enter your Surname</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="UserSName"></asp:TextBox>
            <label for ="UserEmail">Enter Email</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="UserEmail"></asp:TextBox>
            <label for ="UserPassword">Enter your Password</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="UserPassword"></asp:TextBox>
        </div>
        </div>        
    <div class="col-md-6">
        <div class ="form-group" >
         <em ID="GridHelp" class="form-text text-muted">Please complete the form in order to register your customer details.</em>
           <br />
            <br />        
            <asp:GridView runat="server" CssClass="table table-striped" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID" DataSourceID="CustomerRegisterDataSource" ForeColor="#333333" GridLines="None" ID="UserGridView">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="UserFName" HeaderText="UserFName" SortExpression="UserFName" />
                <asp:BoundField DataField="UserLName" HeaderText="UserLName" SortExpression="UserLName" />
                <asp:BoundField DataField="UserEmail" HeaderText="UserEmail" SortExpression="UserEmail" />
                <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" />
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

         <asp:SqlDataSource ID="CustomerRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [UserTbl] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [UserTbl] ([UserFName], [UserLName], [UserEmail], [UserPassword]) VALUES (@UserFName, @UserLName, @UserEmail, @UserPassword)" SelectCommand="SELECT * FROM [UserTbl] where UserEmail=@x" UpdateCommand="UPDATE [UserTbl] SET [UserFName] = @UserFName, [UserLName] = @UserLName, [UserEmail] = @UserEmail, [UserPassword] = @UserPassword WHERE [UserID] = @UserID">
             <DeleteParameters>
                 <asp:Parameter Name="UserID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:ControlParameter ControlID="UserFName" Name="UserFName" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserSName" Name="UserLName" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserEmail" Name="UserEmail" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserPassword" Name="UserPassword" PropertyName="Text" Type="String" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="x" SessionField="Email" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="UserFName" Type="String" />
                 <asp:Parameter Name="UserLName" Type="String" />
                 <asp:Parameter Name="UserEmail" Type="String" />
                 <asp:Parameter Name="UserPassword" Type="String" />
                 <asp:Parameter Name="UserID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
        </div>
        </div>        
        <br />
        </div>
     <br />
    <div class="row">
    <div style="text-align: left">
        <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" Text="Submit" OnClick="btn1_Click" />
        
        <asp:Button ID="btn2" runat="server" CssClass="btn btn-danger btn-lg" Text="Clear Data" OnClick="btn2_Click" />
    </div>
    </div>
</asp:Content>
