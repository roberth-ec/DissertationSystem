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
        <div id="map" style="height: 300px; width: 650px;"></div>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnN3LBYWOFLCci1OnrBsGWc-5l72iXg-k&callback=initMap">
        </script>
        <script>
            function initMap() {
                var LostAndFoundOffices = { lat: 51.482656, lng: -0.004584 };
                var map = new google.maps.Map(
                    document.getElementById('map'), { zoom: 16, center: LostAndFoundOffices });
                var marker = new google.maps.Marker({ position: LostAndFoundOffices, map: map });
            }
        </script>
        </div>
        </div>
    
</asp:Content>
