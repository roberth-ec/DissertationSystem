<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LostReport.aspx.cs" Inherits="testApp.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center clearfix">
        <h1>
            <strong><em>Reporting Lost Item</em></strong>
            <br />
        </h1>
        <p>
            Complete the following form to report your lost item!
        </p>
    </div>
    <div class="row">
        <div class="col-md-6">
        <h3>
            <strong>Location<span class="rounded-tab">
                <span class="fa fa-map-pin"></span></span></strong></h3>
        <h4>Provide information about where the item was last seen</h4>
    </div>
        <div class="col-md-6">
            <h3><strong>Item<span class="fa fa-cube"></span></strong></h3>
            <h4>Provide as much detail as you can about your lost item</h4>
        </div>
        </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group" id="address">
                <input type="text" class="form-control" id="autocomplete" placeholder="Enter your address" onfocus="geolocate()"/>
                <label for="FirstLineAddress">Address Line 1</label>
                <input type="text" class="form-control" id="street_number" disabled="disabled"  />
                <label for="SecondLineAddress">Adress Line 2</label>
                <input type="text" class="form-control"  id="route" disabled="disabled" />
                <label for="PostCode">Postcode</label>
                <input type="text" class="form-control" id="postal_code" disabled="disabled" />
                <label for="Town">Town</label>
                <input type="text" class="form-control" id="postal_town" disabled="disabled" />
                <label for="LocationDescription">Location Description</label>
                <asp:TextBox ID="LocationDescription" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine" Width="280px" ></asp:TextBox>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group" id="LostReportForm2">
                <label for="itemCategory">Select an item category from the drop down menu</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="LostItemDataSource" DataTextField="ItemCategoryName" DataValueField="ItemCategoryID" AppendDataBoundItems="True">
                <asp:ListItem>Select an item</asp:ListItem></asp:DropDownList>
                <asp:SqlDataSource ID="LostItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [ItemCategory]"></asp:SqlDataSource>
                <label for="ItemColour">Please provide the color of your lost item</label>
                <input id="ItemColour" type="text" class="form-control" placeholder="Write here"/>
                 <label for="ItemBrand">Please provide the brand of your lost item</label>
                <input id="ItemBrand" type="text" class="form-control" placeholder="Write here"/>
                 <label for="ItemSerialNumber">Please provide the serial number of your lost item*</label>
                <input id="ItemSerialNumber" type="text" class="form-control" placeholder="Enter numbers only"/>
                 <label for="ItemDescription">Please provide a brief description of your lost item</label>
                <textarea id="ItemDescription" rows="3" class="form-control" placeholder="Write here" style="width: 280px" ></textarea>
                <label for="ItemPicture">Optional you can upload a picture of your lost item</label>
                <asp:FileUpload ID="ItemPictureUpload" runat="server" />
            </div>
        </div>
    </div>
    <div class="row" style="text-align: right">
        <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" Text="Submit Report"/>
        <asp:Button ID="Btn2" runat="server" CssClass="btn btn-danger btn-lg" Text="Clear Data"/>
    </div>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnN3LBYWOFLCci1OnrBsGWc-5l72iXg-k&libraries=places&callback=initAutocomplete" async defer></script>
    <script>
            var placeSearch, autocomplete;
            var componentForm = {
                street_number: 'short_name',
                route: 'long_name',
                postal_code: 'short_name',
                postal_town: 'long_name'
            };
            function initAutocomplete() {
                autocomplete = new google.maps.places.Autocomplete(
                    document.getElementById('autocomplete'), { types: ['geocode'] });
                autocomplete.setFields(['address_component']);
                autocomplete.addListener('place_changed', fillInAddress);
            } 
            function fillInAddress() {
                var place = autocomplete.getPlace();
                for (var component in componentForm) {
                    document.getElementById(component).value = '';
                    document.getElementById(component).disabled = false;
                }

                for (var i = 0; i < place.address_components.length; i++) {
                    var addressType = place.address_components[i].types[0];
                    if (componentForm[addressType]) {
                        var val = place.address_components[i][componentForm[addressType]];
                        document.getElementById(addressType).value=val
                    }
                }
            }
            function geolocate() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var geolocation = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        var circle = new google.maps.Circle(
                            { center: geolocation, radious: position.coords.accuracy });
                        autocomplete.setBounds(circle.getBounds());
                    });
                }
            }
    </script>
</asp:Content>
