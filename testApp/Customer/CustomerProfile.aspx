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
            <label for="ProfilePhotoUpload">Upload your profile picture if desired</label>
            <asp:FileUpload ID="ProfilePhotoUpload" runat="server" />

        </div>
        </div>        
    <div class="col-md-6">
        <div class ="form-group" >
         <em ID="GridHelp" class="form-text text-muted">View your profile details below. Need to update them? Use the form on the left hand side to make new changes.</em>
           <br />
            <br />        
            <asp:GridView runat="server" CssClass="table table-striped" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID" DataSourceID="CustomerRegisterDataSource" ForeColor="#333333" GridLines="None" ID="UserGridView" Visible="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                    <asp:BoundField DataField="UserFName" HeaderText="UserFName" SortExpression="UserFName" />
                    <asp:BoundField DataField="UserLName" HeaderText="UserLName" SortExpression="UserLName" />
                    <asp:BoundField DataField="UserEmail" HeaderText="UserEmail" SortExpression="UserEmail" />
                    <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image runat="server" ID="UserImage" Height="100px" Width="100px"
                                ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("UserImage")) %>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
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

         <asp:SqlDataSource ID="CustomerRegisterDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [UserTbl] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [UserTbl] ([UserFName], [UserLName], [UserEmail], [UserPassword],[UserImage]) VALUES (@UserFName, @UserLName, @UserEmail, @UserPassword,@UserImage)" SelectCommand="SELECT * FROM [UserTbl] where UserEmail=@x" UpdateCommand="UPDATE [UserTbl] SET [UserFName] = @UserFName, [UserLName] = @UserLName, [UserEmail] = @UserEmail, [UserPassword] = @UserPassword, [UserImage]=@UserImage WHERE  UserEmail=@x">
             <DeleteParameters>
                 <asp:Parameter Name="UserID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:ControlParameter ControlID="UserFName" Name="UserFName" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserSName" Name="UserLName" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserEmail" Name="UserEmail" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserPassword" Name="UserPassword" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="ProfilePhotoUpload" Name="UserImage" PropertyName="FileBytes" />
             </InsertParameters>
             <SelectParameters>
                 <asp:SessionParameter Name="x" SessionField="Email" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:ControlParameter ControlID="UserFName" Name="UserFName" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserSName" Name="UserLName" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserEmail" Name="UserEmail" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="UserPassword" Name="UserPassword" PropertyName="Text" Type="String" />
                 <asp:SessionParameter Name="x" SessionField="Email" />
                 <asp:ControlParameter ControlID="ProfilePhotoUpload" Name="UserImage" PropertyName="FileBytes" />
             </UpdateParameters>
         </asp:SqlDataSource>
        </div>
        </div> 
        <div class="col-md-6">
        <asp:Repeater ID="CustomerRptr" runat="server" DataSourceID="CustomerRegisterDataSource">
        <ItemTemplate>
            <div class="col-md-8">
                <div class="thumbnail" style="background-color: rgba(255, 255, 255, 0.00)">
                   <p style="font-weight: bold; text-align: center"><span><%#Eval("UserFName")%></span> <span><%#Eval("UserLName")%></span></p>
                   <p style="text-align: center; font-style: oblique; font-weight: bolder; ">Welcome to your profile!</p>
                    <image src ='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("UserImage")) %>' >
                    </image>
                    <div class="caption"> 
                        <p style="font-weight: bold; font-style: italic; text-align: center;">Your registered email:</p>
                        <p style="text-align: center; font-family: 'Comic Sans MS'"><%#Eval("UserEmail")%></p>
                        <p style="font-weight: bold; font-style: italic; text-align: center;">Your Current Password:</p>
                        <p style="text-align: center; font-family: 'Comic Sans MS'"><%#Eval("UserPassword")%></p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
        </div>
        <br />
        </div>
     <br />
    <div class="row">
    <div style="text-align: left">
        <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" Text="Generate Profile " OnClick="btn1_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true'; this.value='Generating profile...';"   />      
        <asp:Button ID="btn2" runat="server" CssClass="btn btn-danger btn-lg" Text="Clear Data" OnClick="btn2_Click" />
         <asp:Button ID="btn3" runat="server" CssClass="btn btn-warning btn-lg" Text="Update your profile" OnClick="btn3_Click"/>
    </div>
    </div>
</asp:Content>
