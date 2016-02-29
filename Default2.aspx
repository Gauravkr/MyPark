<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border: 1px solid #333333;
        }
        
        @media only screen and (max-width: 767px)
        {
        .about-right {
            margin-top: 0px;
            padding-left: 0;
        }
        .toop
        {
                margin-top: 5px !important;
        }
        }
        
         @media only screen and (max-width: 600px)
        {
        .sss {
                width: 100% !important;
    margin-top: 10px;
        }
        }
       
    </style>
  
  <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('TextBox1'));
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

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <section id="blog-banner">
    <img src="assets/images/blog-banner.jpg" alt="img">
    <div class="blog-overlay">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
              <div class="blog-banner-area">
              <h2><asp:Label ID="Label1" runat="server" Text="List of Parkings"></asp:Label></h2>
              <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>                
                <li class="active">Parking List</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
<section id="about">
    <div class="container" >
      
      <div class="row">
        <div class="col-md-12">
          <div class="about-area toop" style="margin-top: -25px;">
            <div class="row">
             <h6 class="tittle" style="padding-bottom: 12px; margin-left: 15px;"> <span><asp:Label ID="Label5" runat="server" Text=""></asp:Label></span> Parking</h6>
                     <asp:Label ID="Label6" runat="server" Visible="false" Text="No Parking Available" style="color: red;background-color: whitesmoke;padding: 14px;"></asp:Label>
              <div class="col-xs-6 sss">
                <div class="about-right wow fadeInRight" style="visibility: visible; animation-name: fadeInLeft; display: inline; float: left;     padding-left: 0px; position: relative; width: 100%; PADDING-TOP: 0PX;">
                  <div class="title-area">
                    <asp:Panel ID="Panel1" runat="server" style="padding: 7px; background-color: rgba(107, 106, 104, 0.19);">
                    <asp:Repeater ID="DataList1" runat="server" 
                            onitemdatabound="DataList1_ItemDataBound" >
                        <ItemTemplate>
                       
                        <div style="BACKGROUND-COLOR: #F7F7F7;border: 1px solid #ccc;width: 100%; display:block;margin-bottom: 7px;">
                    <div style="width:100%;display:inline-block;vertical-align: top;padding: 0px 7px 9px 2px;">
                            
                    <h4 style="display: inline-block;color: #DE1B1B;padding-left: 10px;FONT-WEIGHT: 800;"> 
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Parking_Name") %>'></asp:Label></h4>
                     <asp:Label ID="Label7" runat="server" Visible="false"  Text='<%# Eval("Parking_Id") %>'></asp:Label>
                  
                   <%-- </div>
                      <div style="width:25%;display:inline-block; text-align:center">--%>
                     <h4 style="font-weight: 800;float: right;display: inline-block;color: #AB1212;">Rs. <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h4>
                     
                  <br />
                   <a href='Details.aspx?code=<%# Eval("Parking_Id") %>' style="text-align: center;padding: 5px;border: 1px solid #00D999;color: white;background-color: #00D999;float: right;width: 113px;">View Details</a>
                     <img src="assets/images/address.png" /><h4 style="MARGIN-TOP: 0PX;/* TOP: 1PX; */display: inline-block;font-size: smaller;">
                   <asp:Label ID="Label2" runat="server"  style="padding-left: 7px;color: #181210;font-size: 15px;font-family: monospace;" Text='<%# Eval("Address") %>'></asp:Label></h4>
                  <asp:Label ID="Label8" runat="server" Text='<%# Eval("Final_Km") %>'></asp:Label> KM, <asp:Label ID="Label9" runat="server" Text='<%# Eval("Final_Time") %>'></asp:Label> 
                  </div>
                  
                     </div>
                    
                                             </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            SelectCommand="SELECT * FROM [Admin_Rent_Space] WHERE ([City_Id] = @City_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="City_Id" PropertyName="Text" 
                                    Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    
                       
                    </asp:Panel>
                                        
                     
                      
                  </div>
                </div>
              </div>
            
             <div class="col-xs-6 sss">
              <asp:Label ID="Label4" runat="server" Visible="false"  Text=""></asp:Label>
                <div class="about-left wow fadeInLeft" style="width: 100%; visibility: visible; animation-name: fadeInLeft; height: 443px;background: white;">
                   
                  <div id="map_canvas" style="width: 100%; height: 445px"></div>

                  
                </div>
              </div>
             
            </div>

          </div>
        </div>
      </div>
    </div>
  </section>


</asp:Content>


