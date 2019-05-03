<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="testApp._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div class="jumbotron">
        <h1 style="text-align: center">Welcome</h1>
        <p class="lead" style="text-align: center">Click on one of the buttons below to make use of our online property reporting system.</p>
        <div style="text-align: center">
        <a href="/Customer/LostReport.aspx" class="btn btn-danger btn-lg">Report an item &raquo;</a>
        <a href="/Customer/ManageReports.Aspx" class="btn btn-primary btn-lg">Manage your report &raquo;</a>
        </div>
    </div>
    
    <div class="row">
        
            <div class="panel panel-info">
            <div class="panel-heading"><h2>What is time bank?</h2></div>
            <p>
Timebanking is a way of spending one hour of time helping someone out by, for example, mowing someone’s lawn, or doing their shopping. For every hour spent, you earn an hour in return. This can be spent on receiving an hour of someone else’s time or, where available, things like theatre or cinema tickets.  You could learn something new or share a skill you have like cooking or playing a musical instrument.
            </p>
                
            <%--<p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>--%>
        </div>
        </div>
        
       <%-- <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>--%>
   

</asp:Content>
