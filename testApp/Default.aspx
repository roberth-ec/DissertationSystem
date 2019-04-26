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
        <div class="col-md-6">
            <div class="panel panel-info">
            <div class="panel-heading"><h2>General News</h2></div>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
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
        <div class="col-md-6" >
            <div class="panel panel-info">
             <div class="panel-heading"><h2>Latest Items reported as found</h2></div>
            <p>
                You can easily find a items reported as lost from the list bellow
            </p>
                <ul>
                 <li>Coffee</li>
                 <li>Tea</li>
                 <li>Milk</li>
                </ul>
            </div>
    </div>
    </div>
   

</asp:Content>
