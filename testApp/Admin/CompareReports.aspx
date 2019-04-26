<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompareReports.aspx.cs" Inherits="testApp.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Compare and match customer reports</h1>
        </div>
        <div class="panel panel-default">
        <div class="panel-heading"><p class="text-danger">Read the instructions below carefully</p></div>
        <div class="panel-body">
        <p>1. The first table shows all the lost reports submitted by owners. Use the filter option below to find report similarities in the second table.</p>
        <p>2. If a report similarity is found take note of the owner and finder user id to make a transaction</p>
        <p>3. Make sure you change the report status of both report matches</p>
        <p>4. Proceed to make the transaction by accessing the transfer page!</p>
        </div>
        <div class="panel-footer">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped responsive-lg" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ReportID" DataSourceID="LostReportsDataSource" ForeColor="#333333" GridLines="None" AllowCustomPaging="False" AllowPaging="True" PageSize="2">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ReportID" HeaderText="ReportID" InsertVisible="False" ReadOnly="True" SortExpression="ReportID" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                        <asp:TemplateField HeaderText="Image">
                        <ItemTemplate >
                            <asp:Image runat="server" ID="UserImage" Height="100px" Width="100px"
                                ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("ItemPicture")) %>'></asp:Image>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ReportStatus" SortExpression="ReportStatus">
                            <EditItemTemplate>
                                 <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ReportStatusChangedNewDataSource" DataTextField="ReportStatusName" DataValueField="ReportStatusName" SelectedValue='<%# Bind("ReportStatus") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ReportStatusChangedNewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [ReportStatus]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReportStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ItemCategory" HeaderText="ItemCategory" SortExpression="ItemCategory" />
                        <asp:BoundField DataField="ItemBrand" HeaderText="ItemBrand" SortExpression="ItemBrand" />
                        <asp:BoundField DataField="ItemColour" HeaderText="ItemColour" SortExpression="ItemColour" />
                        <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
                        <asp:BoundField DataField="ItemSerialNumber" HeaderText="ItemSerialNumber" SortExpression="ItemSerialNumber" />
                        <asp:BoundField DataField="LocationDescription" HeaderText="LocationDescription" SortExpression="LocationDescription" />
                        <asp:BoundField DataField="FirstLineAddress" HeaderText="FirstLineAddress" SortExpression="FirstLineAddress" />
                        <asp:BoundField DataField="SecondLineAddress" HeaderText="SecondLineAddress" SortExpression="SecondLineAddress" />
                        <asp:BoundField DataField="PostCode" HeaderText="PostCode" SortExpression="PostCode" />
                        <asp:BoundField DataField="Town" HeaderText="Town" SortExpression="Town" />
                        <asp:BoundField DataField="ReportCreatedOn" HeaderText="ReportCreatedOn" SortExpression="ReportCreatedOn" />
                        <asp:BoundField DataField="ReportCreatedBy" HeaderText="ReportCreatedBy" SortExpression="ReportCreatedBy" />
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
                </div></div>
                <asp:SqlDataSource ID="LostReportsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [Report] WHERE ([ReportType] = @ReportType)" DeleteCommand="DELETE FROM [Report] WHERE [ReportID] = @ReportID" InsertCommand="INSERT INTO [Report] ([ReportStatus], [UserID], [ReportType], [ItemCategory], [FirstLineAddress], [SecondLineAddress], [PostCode], [Town], [LocationDescription], [ItemColour], [ItemBrand], [ItemSerialNumber], [ItemDescription], [ItemPicture], [ReportCreatedOn], [ReportCreatedBy]) VALUES (@ReportStatus, @UserID, @ReportType, @ItemCategory, @FirstLineAddress, @SecondLineAddress, @PostCode, @Town, @LocationDescription, @ItemColour, @ItemBrand, @ItemSerialNumber, @ItemDescription, @ItemPicture, @ReportCreatedOn, @ReportCreatedBy)" UpdateCommand="UPDATE [Report] SET [ReportStatus] = @ReportStatus, [UserID] = @UserID,[ItemCategory] = @ItemCategory, [FirstLineAddress] = @FirstLineAddress, [SecondLineAddress] = @SecondLineAddress, [PostCode] = @PostCode, [Town] = @Town, [LocationDescription] = @LocationDescription, [ItemColour] = @ItemColour, [ItemBrand] = @ItemBrand, [ItemSerialNumber] = @ItemSerialNumber, [ItemDescription] = @ItemDescription,[ReportCreatedOn] = @ReportCreatedOn, [ReportCreatedBy] = @ReportCreatedBy WHERE [ReportID] = @ReportID">
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
                        <asp:Parameter DefaultValue="Lost" Name="ReportType" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ReportStatus" Type="String" />
                        <asp:Parameter Name="UserID" Type="Int32" />
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
                        <asp:Parameter Name="ReportCreatedOn" Type="DateTime" />
                        <asp:Parameter Name="ReportCreatedBy" Type="String" />
                        <asp:Parameter Name="ReportID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <br />
                <div class="panel panel-default">
                    <div class="panel-heading">
                     <p style="text-align:center"><asp:Label ID="Label2" runat="server" Text="Label">Enter the key word to search from the lost reports database </asp:Label><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn-default" OnClick="Button1_Click" /></p>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                        <asp:GridView ID="GridView2" runat="server" CssClass="table table-striped responsive-lg" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ReportID" DataSourceID="FoundReportDataSource" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="2">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ReportID" HeaderText="ReportID" InsertVisible="False" ReadOnly="True" SortExpression="ReportID" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                        <asp:TemplateField HeaderText="Image">
                        <ItemTemplate >
                            <asp:Image runat="server" ID="UserImage" Height="100px" Width="100px"
                                ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("ItemPicture")) %>'></asp:Image>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ReportStatus" SortExpression="ReportStatus">
                            <EditItemTemplate>
                                 <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ReportStatusChangedNewDataSource" DataTextField="ReportStatusName" DataValueField="ReportStatusName" SelectedValue='<%# Bind("ReportStatus") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ReportStatusChangedNewDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [ReportStatus]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReportStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ItemCategory" HeaderText="ItemCategory" SortExpression="ItemCategory" />
                        <asp:BoundField DataField="ItemBrand" HeaderText="ItemBrand" SortExpression="ItemBrand" />
                        <asp:BoundField DataField="ItemColour" HeaderText="ItemColour" SortExpression="ItemColour" />
                        <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
                        <asp:BoundField DataField="ItemSerialNumber" HeaderText="ItemSerialNumber" SortExpression="ItemSerialNumber" />
                        <asp:BoundField DataField="LocationDescription" HeaderText="LocationDescription" SortExpression="LocationDescription" />
                        <asp:BoundField DataField="FirstLineAddress" HeaderText="FirstLineAddress" SortExpression="FirstLineAddress" />
                        <asp:BoundField DataField="SecondLineAddress" HeaderText="SecondLineAddress" SortExpression="SecondLineAddress" />
                        <asp:BoundField DataField="PostCode" HeaderText="PostCode" SortExpression="PostCode" />
                        <asp:BoundField DataField="Town" HeaderText="Town" SortExpression="Town" />
                        <asp:BoundField DataField="ReportCreatedOn" HeaderText="ReportCreatedOn" SortExpression="ReportCreatedOn" />
                        <asp:BoundField DataField="ReportCreatedBy" HeaderText="ReportCreatedBy" SortExpression="ReportCreatedBy" />
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
                            <asp:SqlDataSource ID="FoundReportDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [Report] WHERE [ReportID]" InsertCommand="INSERT INTO [Report] ([ReportStatus], [UserID], [ReportType], [ItemCategory], [FirstLineAddress], [SecondLineAddress], [PostCode], [Town], [LocationDescription], [ItemColour], [ItemBrand], [ItemSerialNumber], [ItemDescription], [ItemPicture], [ReportCreatedOn], [ReportCreatedBy]) VALUES (@ReportStatus, @UserID, @ReportType, @ItemCategory, @FirstLineAddress, @SecondLineAddress, @PostCode, @Town, @LocationDescription, @ItemColour, @ItemBrand, @ItemSerialNumber, @ItemDescription, @ItemPicture, @ReportCreatedOn, @ReportCreatedBy)" SelectCommand="Select * from [dbo].[Report] where ReportType like '%'+@ReportType+'%' OR ItemCategory like '%'+@ItemCategory+'%' OR ItemBrand like '%'+@ItemBrand+'%' OR ItemSerialNumber like '%'+@ItemSerialNumber+'%' OR ItemDescription like '%'+@ItemDescription+'%' AND ReportType = 'Found'" UpdateCommand="UPDATE [Report] SET [ReportStatus] = @ReportStatus, [UserID] = @UserID,[ItemCategory] = @ItemCategory, [FirstLineAddress] = @FirstLineAddress, [SecondLineAddress] = @SecondLineAddress, [PostCode] = @PostCode, [Town] = @Town, [LocationDescription] = @LocationDescription, [ItemColour] = @ItemColour, [ItemBrand] = @ItemBrand, [ItemSerialNumber] = @ItemSerialNumber, [ItemDescription] = @ItemDescription,[ReportCreatedOn] = @ReportCreatedOn, [ReportCreatedBy] = @ReportCreatedBy WHERE [ReportID] = @ReportID">
                                <InsertParameters>
                                    <asp:Parameter Name="ReportStatus" />
                                    <asp:Parameter Name="UserID" />
                                    <asp:Parameter Name="ReportType" />
                                    <asp:Parameter Name="ItemCategory" />
                                    <asp:Parameter Name="FirstLineAddress" />
                                    <asp:Parameter Name="SecondLineAddress" />
                                    <asp:Parameter Name="PostCode" />
                                    <asp:Parameter Name="Town" />
                                    <asp:Parameter Name="LocationDescription" />
                                    <asp:Parameter Name="ItemColour" />
                                    <asp:Parameter Name="ItemBrand" />
                                    <asp:Parameter Name="ItemSerialNumber" />
                                    <asp:Parameter Name="ItemDescription" />
                                    <asp:Parameter Name="ItemPicture" />
                                    <asp:Parameter Name="ReportCreatedOn" />
                                    <asp:Parameter Name="ReportCreatedBy" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ReportType" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TextBox1" Name="ItemCategory" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TextBox1" Name="ItemBrand" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TextBox1" Name="ItemSerialNumber" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="TextBox1" Name="ItemDescription" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ReportStatus" Type="String" />
                        <asp:Parameter Name="UserID" Type="Int32" />
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
                        <asp:Parameter Name="ReportCreatedOn" Type="DateTime" />
                        <asp:Parameter Name="ReportCreatedBy" Type="String" />
                        <asp:Parameter Name="ReportID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
    </div>
</asp:Content>
