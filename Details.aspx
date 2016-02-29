<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
hr
{
        margin-top: 20px;
    margin-bottom: 20px;
   
    border-top: 1px solid #eee;
}

</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Label ID="Label12" Visible="false"  runat="server" Text=""></asp:Label>

  <section id="blog-banner">
    <img src="assets/images/blog-banner.jpg" alt="img">
    <div class="blog-overlay">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="blog-banner-area">
              <h2><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
              <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>                
                <li class="active">Parking Detail</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End blog banner section -->
 
  <!-- Start blog section -->
  <section id="blog">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="blog-area">
            <div class="row">
              

              <div class="col-lg-8 col-md-7 col-sm-12">
                <div class="blog-left blog-details">
                  <!-- Start single blog post -->
                  <article class="single-from-blog">                    
                    <div class="blog-title">
                      <h2 style="display: inline-block;"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></h2>
                        <asp:Button ID="Button1" runat="server" 
                            style="float: right;background-color: #C71616;background-color: C71616;color: white;padding: 15px;border-radius: 15px;" 
                            Text="Booking Now" onclick="Button1_Click"></asp:Button>
                      <p>Property Type <a href="#" class="blog-admin"><asp:Label ID="Label3" runat="server" Text=""></asp:Label></a> </p>
                    </div>
                    <figure>
                      
                     <%-- <a href="#"><img alt="img" src="assets/images/Google_map-2.jpg" style=" MARGIN-LEFT: 10PX; HEIGHT: 334PX;width: 97%;"></a>--%>
                      <div class="col-xs-12">
                      <asp:Label ID="Label13" runat="server" Visible="false"  Text=""></asp:Label>
                        <div class="about-left wow fadeInLeft" style="width: 100%; visibility: visible; animation-name: fadeInLeft; height: 445px;background: white;">
                   
                          <div id="map_canvas" style="width: 100%; height: 445px"></div>

                  
                        </div>
                      </div>

                    </figure>
                   <div class="blog-details-content">
                      <blockquote style="margin-bottom: 0px;margin-top: 0px;">
                        <asp:Label ID="Label10"  runat="server" Text="Address"></asp:Label>
                      </blockquote>
                      <p style="padding-left: 22px;"><asp:Label ID="Label11" style="padding-top: 3px;" runat="server" Text=""></asp:Label></p>  
                      <blockquote style="margin-bottom: 0px;margin-top: 0px;">
                        <asp:Label ID="Label6"  runat="server" Text="Discription"></asp:Label>
                      </blockquote>
                      <p style="padding-left: 22px;"><asp:Label ID="Label4" style="padding-top: 3px;" runat="server" Text=""></asp:Label></p>  
                      <blockquote style="margin-bottom: 0px;margin-top: 0px;">
                            <asp:Label ID="Label7"  runat="server" Text="Facilities"></asp:Label>
                      </blockquote>
                      <p style="padding-left: 22px;"> <asp:Label ID="Label5"  runat="server" Text=""></asp:Label></p>
                       <blockquote style="margin-bottom: 0px;margin-top: 0px;">
                            <asp:Label ID="Label8"  runat="server" Text="Parking Size"></asp:Label>
                      </blockquote>
                      <p style="padding-left: 22px;"> <asp:Label ID="Label9"  runat="server" Text=""></asp:Label></p>
                      <%-- <blockquote style="margin-bottom: 0px;margin-top: 0px;">
                            <asp:Label ID="Label12"  runat="server" Text="Available Space"></asp:Label>
                      </blockquote>
                      <p style="padding-left: 22px;"> <asp:Label ID="Label13"  runat="server" Text=""></asp:Label></p>--%>
                      <asp:Label ID="Label14" Visible="false"   runat="server" Text=""></asp:Label>
                       <asp:Label ID="Label15" runat="server" Visible="false" Text=""></asp:Label>
                   </div>                  
                  </article>
                 <%-- <div class="blog-comment">
                    <h2>Post a comment</h2>
                    <form class="comment-form" action="">
                      <div class="form-group">                
                        <input type="text" placeholder="Name" class="form-control">
                      </div>
                      <div class="form-group">                
                        <input type="email" placeholder="Enter Email" class="form-control">
                      </div>              
                      <div class="form-group">
                        <textarea class="form-control"></textarea>
                      </div>
                      <button class="button button-default" data-text="Comment" type="submit"><span>Comment</span></button>
                    </form>
                  </div>--%>
                  <!-- End single blog post -->                  
                </div>
              </div>
              <div class="col-lg-4 col-md-5 col-sm-12">
                <aside class="blog-right">
                <%--  <!-- Start Sidebar Single widget -->
                  <div class="single-widget">
                    <h2>Search</h2>
                    <form class="blog-search">
                      <input type="text">
                      <button class="button button-default" data-text="Search" type="submit"><span>Search</span></button>
                    </form>
                  </div>
                  <!-- End Sidebar Single widget -->--%>
                  <!-- Start Sidebar Single widget -->
                  <div class="single-widget">
                    <h2>Follow us on</h2>
                    <div class="follow-us">
                      <a class="facebook" href="https://www.facebook.com/parkingmy/" target="_blank" ><span class="fa fa-facebook" style="line-height: 35px;"></span></a>
                  <a class="twitter" href="https://twitter.com/ParkingMyCom"target="_blank"  ><span class="fa fa-twitter" style="line-height: 47px;"></span></a>
                <a class="google-plus" href="https://plus.google.com/109417580993695308682" target="_blank" ><span class="fa fa-google-plus" style="line-height: 47px;"></span></a>
                    </div>
                  </div>
                   <div class="single-widget">
                    <h2>Asq a question for park</h2>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                    <div class="follow-us" >
                    
                  <asp:Button ID="Button2" runat="server" 
                            style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;" 
                            Text="Asq a question for park" onclick="Button2_Click"></asp:Button>

                  <asp:Panel ID="Panel1" Visible="false" runat="server" style="margin-top: 20px;background-color: #F8F8F8;" >
                      
                        <label for="emmail_register"></label>
                   <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder=" Your Name" style="margin-top: 12px;margin-left: 14px;width: 90%;"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ErrorMessage="Enter Name" ControlToValidate="txtname" Display="None" 
                                                ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                        
                        <label for="emmail_register"></label>
                     <asp:TextBox ID="txtmobile" runat="server" class="form-control" placeholder=" Mobile Number" style="margin-left: 14px;width: 90%;"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Enter Mobile Number" ControlToValidate="txtmobile" 
                                                Display="None" ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ControlToValidate="txtmobile" Display="None" 
                                                ErrorMessage="Enter Valid Mobile Number" 
                                                ValidationExpression="^[0-9]{10}$"
                                                ValidationGroup="abcccc"></asp:RegularExpressionValidator>
                        
                        <label for="emmail_register"></label>
                        <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder=" Email Id" style="margin-left: 14px;width: 90%;"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Email Id" ControlToValidate="txtemail" Display="None" 
                                                ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                ControlToValidate="txtemail" Display="None" ErrorMessage="Enter Valid Email Id" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="abcccc"></asp:RegularExpressionValidator>
                 
                    <label for="emmail_register"></label>
                     <asp:TextBox ID="txtmessage" runat="server" class="form-control" 
                            placeholder="Message" Rows="2" TextMode="MultiLine" style="margin-left: 14px;width: 90%;"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ErrorMessage="Enter Message" ControlToValidate="txtmessage" Display="None" 
                                                ValidationGroup="abcccc"></asp:RequiredFieldValidator>

                       <%-- <button class="button"><i class="fa fa-user"></i> Create an account</button>--%>
                      <asp:Button ID="Button3" runat="server" Text="Send Message" 
                            style="height: 37px;color: white;background-color: #C71616; margin-top: 6px;margin-bottom: 17px;" 
                            ValidationGroup="abcccc" onclick="Button3_Click"></asp:Button>
                                                  <asp:Button ID="Button4" runat="server" 
                            style="height: 37px;color: white;background-color: #C71616; margin-top: 6px;margin-bottom: 17px;" 
                            Text="Cancel" onclick="Button4_Click" ></asp:Button>
               <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="abcccc" runat="server" ShowMessageBox="True" ShowSummary="False" />
                  </asp:Panel>

                    </div>

                     <asp:UpdateProgress  ID="upprogpnl" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                                        <ProgressTemplate>
           
                                        <div   style="z-index: 10025; left: 45%;position: fixed; top: 40%" > 
                                       <center>
                                           <img  id="imglddoader" runat="server"  src="~/Gallery/loader.GIF" height="100" visible="True" width="100" />
                                         </center>
                                       </div>
                                        </ProgressTemplate>

                                    </asp:UpdateProgress>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                  </div>
                  <!-- End Sidebar Single widget -->
                  <!-- Start Sidebar Single widget -->
                  <div class="single-widget">
                    <h2>Other Parking</h2>
                    <div class="popular-post-widget">

                    <asp:Repeater ID="DataList1" runat="server" >
                        <ItemTemplate>


                           <div class="media">
                          <div class="media-left" style="height: 66px;margin-right: -9px;">
                            <a href='Details.aspx?code=<%# Eval("Parking_Id") %>' >
                              <img class="media-object" src="assets/images/parking.png" alt="img">
                            </a>
                          &nbsp;&nbsp;</div>
                          <div class="media-body">
                            <h4 class="media-heading"><a href='Details.aspx?code=<%# Eval("Parking_Id") %>'> <asp:Label ID="Parking_NameLabel" runat="server" 
                                Text='<%# Eval("Parking_Name") %>' /></a></h4>
                            <p>  <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' /></p>
                          </div>
                      </div>
                          
                         
                            <asp:Label ID="Parking_IdLabel" Visible="false" runat="server" 
                                Text='<%# Eval("Parking_Id") %>' />
                            
                            <asp:Label ID="DiscriptionLabel" Visible="false" runat="server" 
                                Text='<%# Eval("Discription") %>' />
                          
                        </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            SelectCommand="SELECT top[5] [Parking_Name], [Address], [Parking_Id], [Discription] FROM [Admin_Rent_Space] WHERE ([City_Id] = @City_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="City_Id" PropertyName="Text" 
                                    Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                   
                     
                    </div>
                  </div>
             
                
                </aside>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
    <asp:Panel ID="Panel2"  runat="server">
    
   <section id="portfolio" style="padding: 11px 0;">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="portfolio-area">
            <div class="title-area">
              <h2 class="tittle"><asp:Label ID="Label16" runat="server" Text=""></asp:Label> Photose</h2>
              <span class="tittle-line"></span>
             
            </div>
            <!-- Portfolio content -->
            <div class="portfolio-content" style="margin-top: 0px;">
              
               <div id="mixit-container" class="portfolio-container" style="margin-top: 6px;">
               
                    <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate>


                 <div class="single-portfolio mix branding" style="display: inline-block;">
                   <div class="single-item">
                     <img src='<%# Eval("Image") %>' alt="img">
                     <div class="single-item-content">
                        <div class="portfolio-social-icon">
                          <a class="fancybox" data-fancybox-group="gallery" href='<%# Eval("Image") %>'><i class="fa fa-eye"></i></a>
                        
                        </div>
                 
                     </div>
                   </div>
                 </div>
               
               </ItemTemplate> 
               </asp:Repeater> 

               </div>      
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  </asp:Panel>
</asp:Content>

