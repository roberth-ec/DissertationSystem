<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageReports.aspx.cs" Inherits="testApp.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="page-header">
    <h1>Welcome to manage my reports</h1></div>
    <p>Below you will find all the reports created by you!</p>
   </div>
    <div class="container">
    <div class=table-responsive>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  ForeColor="#333333"  CellPadding="3" DataKeyNames="ReportID" DataSourceID="ReportDataSource"  GridLines="None"  OnRowDataBound="GridView1_RowDataBound" CssClass="table table-striped responsive lg" AllowPaging="True" PageSize="2">
            <AlternatingRowStyle  BackColor="White" ForeColor="#284775"  />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ReportID" HeaderText="Report ID" InsertVisible="False" ReadOnly="True" SortExpression="Report ID" />
                <asp:TemplateField HeaderText="Image">
                        <ItemTemplate >
                            <asp:Image runat="server" ID="UserImage" Height="100px" Width="100px"
                                ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("ItemPicture")) %>'></asp:Image>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:BoundField DataField="" HeaderText="Report Status" SortExpression="Report Status" />
                <asp:BoundField DataField="ItemCategory" HeaderText="Item Category" SortExpression="Item Category" />               
                <asp:BoundField DataField="ItemBrand" HeaderText="Item Brand" SortExpression="Item Brand" />
                <asp:BoundField DataField="ItemColour" HeaderText="Item Colour" SortExpression="Item Colour" />
                <asp:BoundField DataField="ItemDescription" HeaderText="Item Description" SortExpression="Item Description" />
                <asp:BoundField DataField="ItemSerialNumber" HeaderText="Item Serial No" SortExpression="Item Serial No" />
                <asp:BoundField DataField="ReportCreatedOn" HeaderText="Report Created On" SortExpression="Report Created On" />
                <asp:BoundField DataField="LocationDescription" HeaderText="Location Description" SortExpression="Location Description" />
                <asp:BoundField DataField="" HeaderText="Location" SortExpression="">
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="ReportDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [Report] WHERE [ReportID] = @ReportID" InsertCommand="INSERT INTO [Report] ([ReportStatus], [UserID], [ReportType], [ItemCategory], [FirstLineAddress], [SecondLineAddress], [PostCode], [Town], [LocationDescription], [ItemColour], [ItemBrand], [ItemSerialNumber], [ItemDescription], [ItemPicture], [ReportCreatedOn], [ReportCreatedBy]) VALUES (@ReportStatus, @UserID, @ReportType, @ItemCategory, @FirstLineAddress, @SecondLineAddress, @PostCode, @Town, @LocationDescription, @ItemColour, @ItemBrand, @ItemSerialNumber, @ItemDescription, @ItemPicture, @ReportCreatedOn, @ReportCreatedBy)" SelectCommand="SELECT * FROM [Report] WHERE ([ReportCreatedBy] = @ReportCreatedBy)" UpdateCommand="UPDATE [Report] SET [ItemCategory] = @ItemCategory, [LocationDescription] = @LocationDescription, [ItemColour] = @ItemColour, [ItemBrand] = @ItemBrand, [ItemSerialNumber] = @ItemSerialNumber, [ItemDescription] = @ItemDescription,[ReportCreatedOn] = @ReportCreatedOn WHERE [ReportID] = @ReportID">
            <DeleteParameters>
                <asp:Parameter Name="ReportID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ReportStatus" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="ReportType" Type="String" />
                <asp:Parameter Name="ItemCategory" Type="String" />
                <asp:Parameter Name="FirstLineAddress" Type="String" />
                <asp:Parameter Name="SecondLineAddress" Type="String" />
                <asp:Parameter Name="PostCode" Type="String" />
                <asp:Parameter Name="Town" Type="String" />
                <asp:Parameter Name="LocationDescription" Type="String" />
                <asp:Parameter Name="ItemColour" Type="String" />
                <asp:Parameter Name="ItemBrand" Type="String" />
                <asp:Parameter Name="ItemSerialNumber" Type="String" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="ItemPicture" Type="Object" />
                <asp:Parameter Name="ReportCreatedOn" Type="DateTime" />
                <asp:Parameter Name="ReportCreatedBy" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="ReportCreatedBy" SessionField="Email" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ItemCategory" Type="String" />
                <asp:Parameter Name="LocationDescription" Type="String" />
                <asp:Parameter Name="ItemColour" Type="String" />
                <asp:Parameter Name="ItemBrand" Type="String" />
                <asp:Parameter Name="ItemSerialNumber" Type="String" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="ReportCreatedOn" Type="DateTime" />
                <asp:Parameter Name="ReportID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
   </div>

</asp:Content>
