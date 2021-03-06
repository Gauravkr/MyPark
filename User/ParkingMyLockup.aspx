﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParkingMyLockup.aspx.cs" Inherits="User_ParkingMyLockup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ParkingMy Lockup Address</title>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script>
        google.load('visualization', '1', { 'packages': ['map'] });
        google.setOnLoadCallback(drawMap);

        function drawMap() {
            var data = google.visualization.arrayToDataTable([
        ['Country', 'Population'],
        ['China', 'China: 1,363,800,000'],
        ['India', 'India: 1,242,620,000'],
        ['US', 'US: 317,842,000'],
        ['Indonesia', 'Indonesia: 247,424,598'],
        ['Brazil', 'Brazil: 201,032,714'],
        ['Pakistan', 'Pakistan: 186,134,000'],
        ['Nigeria', 'Nigeria: 173,615,000'],
        ['Bangladesh', 'Bangladesh: 152,518,015'],
        ['Russia', 'Russia: 146,019,512'],
        ['Japan', 'Japan: 127,120,000']
      ]);

            var options = { showTip: true, enableScrollWheel: true, useMapTypeControl: true, showLine: true, lineWidth: 10, lineColor: '#800000', mapType: 'hybrid' };

            var map = new google.visualization.Map(document.getElementById('Map_Div'));

            map.draw(data, options);
        };
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnSearch").click(function () {
                var geocoder = new google.maps.Geocoder();
                var strSearch = document.getElementById('txtSearch').value;
                geocoder.geocode({ 'address': strSearch }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var x = results[0].geometry.location.lat();
                        var y = results[0].geometry.location.lng();
                        document.getElementById('txtLat').value = x;
                        document.getElementById('txtLng').value = y;
                        //alert(x + "|" + y);
                        var latlng = new google.maps.LatLng(x, y);
                        var myOptions = {
                            zoom: 8,
                            center: latlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        map = new google.maps.Map(document.getElementById("Map_Div"), myOptions);
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(x, y),
                            map: map,
                            title: strSearch
                        });
                        s
                        var infowindow = new google.maps.InfoWindow({
                            content: strSearch
                        });
                        infowindow.open(map, marker);
                        google.maps.event.addDomListener(window, 'load');
                    } else {
                        alert("Location Not Found...");
                        document.getElementById('txtSearch').value = "";
                    }
                });
            });
        });
    </script>


    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('txtSearch'));
            google.maps.event.addListener(places, 'place_changed', function () {
                var place = places.getPlace();
                var address = place.formatted_address;
                var latitude = place.geometry.location.lat();
                var longitude = place.geometry.location.lng();
                var mesg = "Address: " + address;
                mesg += "\nLatitude: " + latitude;
                mesg += "\nLongitude: " + longitude;
                // alert(mesg);
            });
        });
    </script>
    <style>
    .jacks
    {
        
        font-size: larger;
    
    color: white;
    border-radius: 7px;
    padding: 7px;
    background-color: #00d999;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center; font-family: Lao UI; font-size: 25px;">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="height: 42px; border: 1px Solid Black; margin: 2%; padding: 1%;">
        <asp:Label runat="server" ID="lblSearch" Text="Search : " />
        <asp:TextBox runat="server" ID="txtSearch" PlaceHolder="Enter Your Specific Area" Font-Size="20px"
            Width="300px" />
        <asp:Button ID="btnSearch" runat="server" CssClass="jacks" Text="Search" Style="font-family: Lao UI;
            font-size: 20px; width: 150px;" OnClientClick="return false;" 
            onclick="btnSearch_Click" />
    </div>
    <div id="Map_Div" style="height: 250px; border: 1px Solid Black; margin: 2%; padding: 1%;">
    </div>
    <div style="height: 50px; border: 1px Solid Black; margin: 2%; padding: 1%;">
        <asp:Label runat="server" ID="lblLat" Text="Lat : " />
        <asp:TextBox runat="server" ID="txtLat" Font-Size="15px" Enabled="false" Width="150px" style="margin-right:50px;" />
        <asp:Label runat="server" ID="lblLng" Text="Lng : " />
        <asp:TextBox runat="server" ID="txtLng" Font-Size="15px" Enabled="false" Width="150px" /><br /><br />
        <asp:Label ID="lblduratio" runat="server" Text=""></asp:Label>
            <asp:Label ID="lbldistant" runat="server" Text=""></asp:Label>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <asp:Panel ID="Panel1" Visible="false" runat="server">

        <input type="button" class="jacks"  onClick="window.open('Parking_Spaces.aspx'); window.close();" value="Back to Add Space" />
        </asp:Panel>
        <asp:Button ID="Button1"  CssClass="jacks" runat="server" Text="Finish" 
            onclick="jack" />

            </ContentTemplate>
        </asp:UpdatePanel>
        <br /><br />
    </div>

    </form>
</body>
</html>
