<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LostReport.aspx.cs" Inherits="testApp.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center clearfix">
        <h1>
            <strong><em>Reporting an Item</em></strong>
            <br />
        </h1>
        <p>
            Complete the following form to report your lost or found item!
        </p>
    </div>
    <div class="row">
        <div class="col-md-6">
        <h3>
            <strong>1. Location<span class="rounded-tab">
                <span class="fa fa-map-pin"></span></span></strong></h3>
        <h4>Provide information about where the item was last seen</h4>
    </div>
        <div class="col-md-6">
            <h3><strong>2. Item<span class="fa fa-cube"></span></strong></h3>
            <h4>Provide as much detail as you can about your lost or found item</h4>
        </div>
        </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group" id="address" >
                <input type="text" class="form-control" id="autocomplete" placeholder="Enter your address" onfocus="geolocate()"/>
                <label for="FirstLineAddress">Address Line 1</label>
                <input type="text" class="form-control" id="street_number" name="street_number" disabled="disabled"  />
                <label for="SecondLineAddress">Adress Line 2</label>
                <input type="text" class="form-control"  id="route" name="route" disabled="disabled" />
                <label for="PostCode">Postcode</label>
                <input type="text" class="form-control" id="postal_code" name="postal_code" disabled="disabled" />
                <label for="Town">Town</label>
                <input type="text" class="form-control" id="postal_town" name="postal_town" disabled="disabled" />
                <label for="LocationDescription">Location Description</label>
                <asp:TextBox ID="LocationDescription" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine" Width="280px" ></asp:TextBox>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group" id="LostReportForm2">
                <label for="ReportType" style="color: #800000; font-weight: bold">Please confirm the type of report before submitting</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="ReportTypeDataSource" DataTextField="ReportTypeName" DataValueField="ReportTypeName">
                <asp:ListItem >Atention! Select report type before submitting</asp:ListItem>
                </asp:DropDownList>
                <label for="UserID" style="color: #800000; font-weight: bold">Please confirm your username before submitting</label>
                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="UserIdDataSource" DataTextField="UserFName" DataValueField="UserID">
                <asp:ListItem >Atention! confirm your user name before submitting</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="UserIdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT [UserID], [UserFName] FROM [UserTbl] WHERE ([UserEmail] = @UserEmail)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserEmail" SessionField="Email" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="ReportTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [ReportType]"></asp:SqlDataSource>
                <label for="itemCategory" style="color: #800000">Select an item category from the drop down menu</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="LostItemDataSource" DataTextField="ItemCategoryName" DataValueField="ItemCategoryName" AppendDataBoundItems="True">
                <asp:ListItem>Select an item</asp:ListItem></asp:DropDownList>
                <asp:SqlDataSource ID="LostItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" SelectCommand="SELECT * FROM [ItemCategory]"></asp:SqlDataSource>
                <label for="ItemColour">Please provide the color of your lost or found item</label>
                <input id="ItemColour" name="ItemColour" type="text" class="form-control" placeholder="Write here"/>
                 <label for="ItemBrand">Please provide the brand of your lost or found item</label>
                <input id="ItemBrand" name="ItemBrand" type="text" class="form-control" placeholder="Write here"/>
                 <label for="ItemSerialNumber">Does your item hold a serial number? If so provide it below</label>
                <input id="ItemSerialNumber"name="ItemSerialNumber" type="text" class="form-control" placeholder="Enter numbers only"/>
                 <label for="ItemDescription">Please provide a brief description of the item</label>
                <textarea id="ItemDescription" name="ItemDescription" rows="3" class="form-control" placeholder="Write here" style="width: 280px" ></textarea>
                <label for="ItemPicture" >Do you have a picture of the item? if so please attach it below</label>
                <asp:FileUpload ID="ItemPictureUpload" runat="server" style="display:inline" />
            </div>
        </div>
    </div>
    <br />
    <div class="row" style="text-align: right">
        <asp:Button ID="btn1" runat="server" CssClass="btn btn-success btn-lg" Text="Submit Report" OnClick="btn1_Click"/>
        <asp:Button ID="Btn2" runat="server" CssClass="btn btn-danger btn-lg" Text="Clear Data"/>
    </div>
    <br />
    <div class="row">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label> <asp:Button ID="Button1" runat="server" Text=" Manage Reports" CssClass="btn-group-sm btn-link" Visible="False"  PostBackUrl="~/Customer/ManageReports.aspx" /><asp:Button ID="Button2" runat="server" Text=" HomePage" CssClass="btn-group-sm btn-link" Visible="False" PostBackUrl="~/Default.aspx" />
    </div>

        <asp:SqlDataSource ID="ReportsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Lost&FoundConnectionString %>" DeleteCommand="DELETE FROM [Report] WHERE [ReportID] = @ReportID" InsertCommand="INSERT INTO [Report] ([ReportStatus], [UserID], [ReportType], [ItemCategory], [FirstLineAddress], [SecondLineAddress], [PostCode], [Town], [LocationDescription], [ItemColour], [ItemBrand], [ItemSerialNumber], [ItemDescription], [ItemPicture], [ReportCreatedBy]) VALUES (@ReportStatus, @UserID, @ReportType, @ItemCategory, @FirstLineAddress, @SecondLineAddress, @PostCode, @Town, @LocationDescription, @ItemColour, @ItemBrand, @ItemSerialNumber, @ItemDescription, @ItemPicture,@ReportCreatedBy)" SelectCommand="SELECT * FROM [Report] WHERE ([ReportCreatedBy] = @ReportCreatedBy)" UpdateCommand="UPDATE [Report] SET [ReportStatus] = @ReportStatus, [UserID] = @UserID, [ReportType] = @ReportType, [ItemCategory] = @ItemCategory, [FirstLineAddress] = @FirstLineAddress, [SecondLineAddress] = @SecondLineAddress, [PostCode] = @PostCode, [Town] = @Town, [LocationDescription] = @LocationDescription, [ItemColour] = @ItemColour, [ItemBrand] = @ItemBrand, [ItemSerialNumber] = @ItemSerialNumber, [ItemDescription] = @ItemDescription, [ItemPicture] = @ItemPicture, [ReportCreatedOn] = @ReportCreatedOn, [ReportCreatedBy] = @ReportCreatedBy WHERE [ReportID] = @ReportID">
            <DeleteParameters>
                <asp:Parameter Name="ReportID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DefaultValue="Received" Name="ReportStatus" Type="String" />
                <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="UserID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="ReportType" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList1" Name="ItemCategory" PropertyName="SelectedValue" Type="String" />
                <asp:FormParameter DefaultValue="" FormField="street_number" Name="FirstLineAddress" Type="String" />
                <asp:FormParameter FormField="route" Name="SecondLineAddress" Type="String" />
                <asp:FormParameter FormField="postal_code" Name="PostCode" Type="String" />
                <asp:FormParameter FormField="postal_town" Name="Town" Type="String" />
                <asp:ControlParameter ControlID="LocationDescription" Name="LocationDescription" PropertyName="Text" Type="String" />
                <asp:FormParameter FormField="ItemColour" Name="ItemColour" Type="String" />
                <asp:FormParameter FormField="ItemBrand" Name="ItemBrand" Type="String" />
                <asp:FormParameter FormField="ItemSerialNumber" Name="ItemSerialNumber" Type="String" />
                <asp:FormParameter FormField="ItemDescription" Name="ItemDescription" Type="String" />
                <asp:ControlParameter ControlID="ItemPictureUpload" Name="ItemPicture" PropertyName="FileBytes" />
                <asp:SessionParameter Name="ReportCreatedBy" SessionField="Email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="ReportCreatedBy" SessionField="Email" Type="String" />
            </SelectParameters>
            <UpdateParameters>
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
                <asp:Parameter Name="ReportID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


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
