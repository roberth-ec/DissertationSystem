<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterWalletBalance.aspx.cs" Inherits="testApp.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Master balance management page
            </h1>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Please enter the ammount of money to be assigned to the wallets initial balance
                </div>
                <div class="panel panel-body">
                    <p>
                        <asp:Label ID="Label1" runat="server" Text="Label">Enter the ammount in numbers only</asp:Label><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox></p>
                    <asp:Button ID="Button1" runat="server" Text="Insert" CssClass="btn btn-success" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Text="Update" CssClass="btn btn-warning" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="Clear" CssClass="btn btn-danger" OnClick="Button3_Click" />
                </div>
                <div class="panel panel-footer">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped responsive-sm" GridLines="None" AutoGenerateColumns="False" DataKeyNames="MasterBalanceID" DataSourceID="MasterBalanceDataSource" CellPadding="4" ForeColor="#333333">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="MasterBalanceID" HeaderText="Master Balance ID" InsertVisible="False" ReadOnly="True" SortExpression="Master Balance ID" />
                                <asp:BoundField DataField="MasterAmmount" HeaderText="Master Balance Ammount" SortExpression="Master Balance Ammount" DataFormatString="{0:0.00}" />
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
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="MasterBalanceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [MasterBalance] WHERE [MasterBalanceID] = @MasterBalanceID" InsertCommand="INSERT INTO [MasterBalance] ([MasterAmmount]) VALUES (@MasterAmmount)" SelectCommand="SELECT * FROM [MasterBalance]" UpdateCommand="UPDATE [MasterBalance] SET [MasterAmmount] = @MasterAmmount ">
                <DeleteParameters>
                    <asp:Parameter Name="MasterBalanceID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="MasterAmmount" PropertyName="Text" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="MasterAmmount" PropertyName="Text" Type="Decimal" />

                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
