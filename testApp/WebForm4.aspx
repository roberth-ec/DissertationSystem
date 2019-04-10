<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="testApp.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<br /><br /><br /><br />
<table align="center" width="100%">
    <tr>
        <td>to
        </td>
        <td>
            <asp:TextBox ID="totxt" runat="server" Width="99%"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>From
        </td>
        <td><asp:TextBox ID="fromtxt" runat="server" Width="99%"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>subject
        </td>
        <td><asp:TextBox ID="subjecttxt" runat="server" Width="99%"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>Body
        </td>
        <td><asp:TextBox ID="body" runat="server" Width="99%" Height="150px" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
     <tr>
        <td>
        </td>
        <td>
            <asp:Button ID="sendbtn" runat="server" Text="Send" OnClick="sendbtn_Click" />
        </td>
    </tr>
     <tr>
        <td>
        </td>
        <td>
            <asp:Label ID="status" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
