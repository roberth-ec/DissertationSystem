<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemCategory.aspx.cs" Inherits="testApp.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6">
            <div>
                <h1>Generate new item Categories <i class="fas fa-plus"></i></h1>
            </div>
            <hr />
        </div>
        <div class="col-md-6">
            <div>
                <h1>Manage existing item categories <i class="fas fa-edit"></i></h1>
            </div>
            <hr />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <p id="formHelp" class="form-text text-danger">Please complete the form in order to create new item categories</p>
                <br />
                <label for="Role ID">Enter item category name</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="ItemCategoryName"></asp:TextBox>
            </div>
            <div style="text-align: left">
                <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" Text="Generate item category" OnClick="btn1_Click" />
                <asp:Button ID="Btn2" runat="server" CssClass="btn btn-danger btn-lg" Text="Clear Data" OnClick="Btn2_Click" />
            </div>
        </div>
        <div class="”table-responsive”">
            <div class="col-md-6">
                <p id="gridhelp" class="form-text text-danger">From the table below you can edit and delete existing item categories</p>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ItemCategoryID" DataSourceID="ItemCategoryDataSource" GridLines="Vertical" CssClass="table table-striped">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ItemCategoryID" HeaderText="Item Category ID" InsertVisible="False" ReadOnly="True" SortExpression="ItemCategoryID" />
                        <asp:BoundField DataField="ItemCategoryName" HeaderText="Item Category Name" SortExpression="ItemCategoryName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="ItemCategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [ItemCategory] WHERE [ItemCategoryID] = @ItemCategoryID" InsertCommand="INSERT INTO [ItemCategory] ([ItemCategoryName]) VALUES (@ItemCategoryName)" SelectCommand="SELECT * FROM [ItemCategory]" UpdateCommand="UPDATE [ItemCategory] SET [ItemCategoryName] = @ItemCategoryName WHERE [ItemCategoryID] = @ItemCategoryID">
                    <DeleteParameters>
                        <asp:Parameter Name="ItemCategoryID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ItemCategoryName" Name="ItemCategoryName" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ItemCategoryName" Type="String" />
                        <asp:Parameter Name="ItemCategoryID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </div>
        </div>
</asp:Content>
