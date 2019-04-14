<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportStatus.aspx.cs" Inherits="testApp.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div class="row">
    <div class="col-md-6">
    <div><h1>Generate new report status <i class="fas fa-plus"></i></h1></div>
    <hr />
    </div>
    <div class="col-md-6">
    <div><h1>Manage existing report status <i class="fas fa-edit"></i></h1></div>
    <hr />
    </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <p id="formHelp" class="form-text text-danger">Please complete the form in order to create new types of report status</p><br />
                <label for="Role ID">Enter report status name</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="ReportStatusName"></asp:TextBox>
            </div>
            <div style="text-align: left">
                <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" Text="Generate report status" OnClick="btn1_Click" />
                <asp:Button ID="Btn2" runat="server" CssClass="btn btn-danger btn-lg" Text="Clear Data" OnClick="Btn2_Click" />
            </div>
            </div>
        <div class=”table-responsive”>
        <div class="col-md-6">
        <p id="gridhelp" class="form-text text-danger">From the table below you can edit and delete existing report status</p><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ReportStatusID" DataSourceID="ReportStatusDataSource" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="table table-striped" AllowPaging="True" PageSize="3">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ReportStatusID" HeaderText="Report Status ID" InsertVisible="False" ReadOnly="True" SortExpression="ReportStatusID" />
                <asp:BoundField DataField="ReportStatusName" HeaderText="Report Status Name" SortExpression="ReportStatusName" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#efefef" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="ReportStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [ReportStatus] WHERE [ReportStatusID] = @ReportStatusID" InsertCommand="INSERT INTO [ReportStatus] ([ReportStatusName]) VALUES (@ReportStatusName)" SelectCommand="SELECT * FROM [ReportStatus]" UpdateCommand="UPDATE [ReportStatus] SET [ReportStatusName] = @ReportStatusName WHERE [ReportStatusID] = @ReportStatusID">
                <DeleteParameters>
                    <asp:Parameter Name="ReportStatusID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="ReportStatusName" Name="ReportStatusName" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ReportStatusName" Type="String" />
                    <asp:Parameter Name="ReportStatusID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        </div>
        </div>
</asp:Content>
