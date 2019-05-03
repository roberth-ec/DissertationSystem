<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransactionPage.aspx.cs" Inherits="testApp.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="page-header">
            <h1>Lost & Found Co. - Transaction System</h1>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <p>Make use of the system below to make a transaction beteween two users</p>
                    </div>
                    <div class="panel-body">
                        <p style="text-align: center">---Each transaction processes 1 credit in total---</p>
                        <p>1. Select the user email of the wallet from which an ammout will be deducted.</p>
                        <p>2. Select the user email for the wallet to be rewarded</p>
                        <p>3. Press begin transfer to start the trasaccion and wait for confirmation message</p>
                    </div>
                    <div class="panel-footer">
                        <label for="SourceWalletID">Select source walletID</label><br />
                        <asp:DropDownList ID="SourceWalletID" runat="server" CssClass="Form-control" DataSourceID="SourceWalletDataSource" DataTextField="UserEmail" DataValueField="WalletID" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True">-Select the source account-</asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:SqlDataSource ID="SourceWalletDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [Wallet]"></asp:SqlDataSource>
                        <label for="DestinationWalletID">Select the DestinationWalletID</label><br />
                        <asp:DropDownList ID="DestinationWalletID" runat="server" CssClass="Form-control" DataSourceID="DestinationWalletDataSource" DataTextField="UserEmail" DataValueField="WalletID" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True">-Select Destination Account-</asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:SqlDataSource ID="DestinationWalletDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [Wallet]"></asp:SqlDataSource>
                       <hr />
                        <asp:Button ID="BeginTransfer" runat="server" Text="Begin Transaction" OnClick="BeginTransfer_Click" CssClass="btn btn-success" />
                        <asp:Button ID="ResetData" runat="server" Text="Reset transaction Data" CssClass="btn btn-danger" OnClick="ResetData_Click" /><br />
                        <hr />
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Manage User wallets
                    </div>
                    <div class="panel-body">
                        <label for="DropDownList1">Select the name of the user to assign a wallet</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="UserWalletDataSource" DataTextField="UserFName" DataValueField="UserID" AppendDataBoundItems="True">
                            <asp:ListItem Selected="True">-Select User Name-</asp:ListItem>
                        </asp:DropDownList><br />
                        <label for="DropDownList2">Confirm the user email address </label>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="UserEmailWalletDataSource" DataTextField="UserEmail" DataValueField="UserEmail" AppendDataBoundItems="True">
                            <asp:ListItem Selected="True">-Confirm user email address-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="UserEmailWalletDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [UserTbl]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="UserWalletDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [UserTbl]"></asp:SqlDataSource>
                        <p>
                            <label for="InitialBalance">IF wallet is assigned for the first time assign the initial balance</label></p>
                        <p>
                            <asp:TextBox ID="MasterBalance" runat="server" CssClass="form-control"></asp:TextBox></p>
                        <asp:Button ID="generateWallet" runat="server" Text="Generate wallet" CssClass="btn btn-primary" OnClick="generateWallet_Click" />
                        <asp:Button ID="clearData" runat="server" Text="Clear Data" CssClass="btn btn-danger" OnClick="clearData_Click" />
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="panel-footer">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped responsive-sm" AutoGenerateColumns="False" DataKeyNames="WalletID" DataSourceID="ManageWalletsDataSource">
                                <Columns>
                                    <asp:BoundField DataField="WalletID" HeaderText="Wallet ID" InsertVisible="False" ReadOnly="True" SortExpression="WalletID" />
                                    <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="UserID" />
                                    <asp:BoundField DataField="UserEmail" HeaderText="User Email" SortExpression="UserEmail" />
                                    <asp:BoundField DataField="WalletBalance" HeaderText="Wallet Balance" SortExpression="WalletBalance" DataFormatString="{0:0.00}" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="ManageWalletsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [Wallet] WHERE [WalletID] = @WalletID" InsertCommand="INSERT INTO [Wallet] ([UserID], [WalletBalance],[UserEmail]) VALUES (@UserID, @WalletBalance,@UserEmail)" SelectCommand="SELECT * FROM [Wallet]" UpdateCommand="Update Wallet set WalletBalance = WalletBalance - 1 where WalletID = @SourceWalletID
Update Wallet set WalletBalance = WalletBalance + 1 where WalletID = @DestinationWalletID">
                                <DeleteParameters>
                                    <asp:Parameter Name="WalletID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="UserID" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="MasterBalance" Name="WalletBalance" PropertyName="Text" Type="Decimal" />
                                    <asp:ControlParameter ControlID="DropDownList2" Name="UserEmail" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="SourceWalletID" Name="SourceWalletID" PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="DestinationWalletID" Name="DestinationWalletID" PropertyName="SelectedValue" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
