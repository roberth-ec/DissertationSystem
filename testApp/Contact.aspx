<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="testApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
    <div class="col-md-6">   
    <h2>Contact Us</h2>
    </div>
    <div class="col-md-6">   
    <h2>Find Us</h2>
    </div>
    </div>
    <div class="row">
        <div class="col-md-6">
        <div class ="form-group"  id="ContactUsForm" >
            <em ID="formHelp" class="form-text text-muted">Do you have a question? Get in touch with us! Fill the form below to contact us.</em>
            <br />
            <br />
            <label for ="Name">Name</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="UserName" placeholder="Enter your full name" required="true" autocomplete="off"></asp:TextBox>
            <label for ="Email">Email</label>
            <asp:TextBox runat="server"  CssClass="form-control"  ID="UserEmail" placeholder="Eg. example@email.com"  autocomplete="off" required="true"></asp:TextBox>
            <label for ="Subject">Subject</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="UserSubject" placeholder="Reason for your message" required="true" autocomplete="off"></asp:TextBox>
            <label for ="Message">Message</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="UserMessage" placeholder="Write your message here" required="true" autocomplete="off" MaxLength="250" Rows="5" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-danger btn-lg" OnClick="btnClear_Click"  />
            <asp:Button ID="btnSupport" runat="server" Text="Send" CssClass="btn btn-success btn-lg" OnClick="btnSupport_Click" /> <br /><br />
            <asp:Label ID="infolbl" runat="server" CssClass="form-inline"></asp:Label>
        </div>      
        </div>
        <div class="col-md-6">
        <em class="form-text text-muted">Want to visit us? Find our offices in the map below</em>
        <br />
        <p class="postal-address">
        The lost & Found Company.<br /> 
        Old Royal Naval College<br />
        London,SE10 9LS
        </p>
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9938.601666978586!2d-0.006995!3d51.4829308!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa66a5fccf89e51c4!2sUniversity+of+Greenwich!5e0!3m2!1sen!2suk!4v1554829342017!5m2!1sen!2suk" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
        </div>
    
</asp:Content>
