<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="All_Order.aspx.cs" Inherits="Admin_All_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style>
  .padd
        {
            padding:7px;
        }
        
        h2
        {
                font-size: initial;
    padding: 5px;
    color: white;
    background-color: #269AD4;
    border-radius: 7px;
}
        }
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
  <%-- <script language="javascript" type="text/javascript">
       function printGrid() {
           var printContent = document.getElementById('<%= Panel4.ClientID %>');
           var printWindow = window.open("All Records", "Print Panel", 'left=50000,top=50000,width=0,height=0');
           printWindow.document.write(printContent.innerHTML);
           printWindow.document.close();
           printWindow.focus();
           printWindow.print();
       }
</script>--%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   


   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        

    <div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Booking History </span>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
      
          <div class="grid_12">
			<div style="display=inline-block";>
				  <asp:Button ID="Button1"  
                      style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;"  
                      runat="server" Text="All Booking" onclick="Button1_Click"  /> 
                <asp:Button ID="Button2"  
                      style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;" 
                      runat="server" Text="Confirm Booking" onclick="Button2_Click"   /> 
            <asp:Button ID="Button3" 
                      style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;"  
                      runat="server" Text="Cancel Booking" onclick="Button3_Click"  />
               
   </div>
   
    
    </div>
        
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">

                 <asp:Panel ID="Panel1" runat="server">
             
                <div class="col-sm-12">

                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Current Booking</label>
                 <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                            onitemcommand="DataList1_ItemCommand">
                  <HeaderTemplate>
                <table class="table table-bordered table-responsive cart_summary">
                    <thead>
                        <tr>
                            <th class="cart_product"> User Description</th>
                            <th>Booked Parking </th>
                            <th>Booking Date</th>
                            <th></th>
                          
                         
                           
                        </tr>
                    </thead>
                    </HeaderTemplate>
                     <ItemTemplate>
                    <tbody>
                        <tr>
                            
                            <td class="cart_description">

                                
                                <p class="product-name"><span style="font-size: large;color: #A22424;"><%# Eval("Username") %></span></p>
                                <small class="cart_ref" style="font-size: medium;"><%# Eval("Mobile_Number") %></small><br>
                                <small style="font-size: medium;"><%# Eval("Email_Id") %></small><br>  
                                   <small style="background-color: #333333;font-size: medium;color: white;padding: 2px;border-radius: 2px;" > Total Ammount : <%# Eval("Total_Ammount")%> .Rs</small><br>  
                               
                            </td>
                            <td class="cart_avail">
                            
                            
                            <p class="product-name"><span style="font-size: large;color: #A22424;"><%# Eval("Parking_Name") %> </span></p>
                               
                                
                                <small style="font-size: medium;"><a href="#">Vehical Type : <%# Eval("Vehical_Type_Name") %></a></small><br />
                                <small style="font-size: medium;"><a href="#">Vehical Name : <%# Eval("Vehical_name") %></a></small><br />
                                <small style="font-size: medium;">Parking Address : <%# Eval("Address") %></small>
                            </td>
                            <td class="price"><span style="background-color: #333333;color: white; padding: 9px;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("From_Date") %>'></asp:Label><asp:Label ID="Label2" runat="server" style="margin-left: 5px;" Text='<%# Eval("From_Time") %>'></asp:Label> <span style="font-weight: 800;color: #FF9900;">To</span>  <asp:Label ID="Label3" runat="server" Text='<%# Eval("To_Date") %>'></asp:Label><asp:Label ID="Label4" runat="server" style="margin-left: 5px;" Text='<%# Eval("To_Time") %>'></asp:Label> </span></td>
                    
                            <td class="price">
                                <asp:Button ID="Button4"  
                      style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;"  
                      runat="server" Text="Cancel" CommandName="Can" CommandArgument='<%# Eval("Id") %>' OnClientClick="if ( !confirm('Are you sure you want to Cancel ?')) return false;"  /> 


                <asp:Button ID="Button5"  style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;" runat="server" Text="Confirm "  CommandName="Con" CommandArgument='<%# Eval("Id") %>'  OnClientClick="if ( !confirm('Are you sure you want to Confirm Booking ?')) return false;"    /> 
                            </td>
                            
                        </tr>
                        
                    </tbody>
                     </ItemTemplate>
                       <FooterTemplate>
               </table>
               </FooterTemplate>
              </asp:Repeater>
                </table>
             
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:admin %>" 
            SelectCommand="SELECT Admin_Booking_Parking.From_Date,
  Admin_Booking_Parking.Id, 
  Admin_Booking_Parking.Total_Ammount,
  Admin_Booking_Parking.From_Time, 
  Admin_Booking_Parking.To_Date,
   Admin_Booking_Parking.To_Time, 
   Admin_Booking_Parking.Vehical_Type_Name, 
   Admin_Booking_Parking.Vehical_name, 
   Admin_Booking_Parking.Purpose,
    Admin_Booking_Parking.Parking_Id,
	Admin_Rent_Space.Address, 
	Admin_Rent_Space.Parking_Name, 
	Admin_Login.Mobile_Number, 
	Admin_Login.Email_Id, 
	Admin_Login.Username 
	 FROM Admin_Login Right OUTER JOIN Admin_Booking_Parking ON Admin_Login.Registration_Id = Admin_Booking_Parking.[Register_Id] Right Outer Join Admin_Rent_Space ON Admin_Rent_Space.[Parking_Id]=  Admin_Booking_Parking.Parking_Id Where  (Admin_Booking_Parking.Status =0 ) AND (Admin_Booking_Parking.Success_Id =1 )  ">
        </asp:SqlDataSource>
            
                   
                    </div>
                </div>
                   </asp:Panel>
                 <asp:Panel ID="Panel2" Visible="false"  runat="server">
             
                <div class="col-sm-12">

                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Confirm Booking</label>
                 <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                  <HeaderTemplate>
                <table class="table table-bordered table-responsive cart_summary">
                    <thead>
                        <tr>
                            <th class="cart_product"> User Description</th>
                            <th>Booked Parking </th>
                            <th>Booking Date</th>
                           
                          
                         
                           
                        </tr>
                    </thead>
                    </HeaderTemplate>
                     <ItemTemplate>
                    <tbody>
                        <tr>
                            
                            <td class="cart_description">

                                
                                <p class="product-name"><span style="font-size: large;color: #A22424;"><%# Eval("Username") %></span></p>
                                <small class="cart_ref" style="font-size: medium;"><%# Eval("Mobile_Number") %></small><br>
                                <small style="font-size: medium;"><%# Eval("Email_Id") %></small><br>   
                                <small style="background-color: #333333;font-size: medium;color: white;padding: 2px;border-radius: 2px;" > Total Ammount : <%# Eval("Total_Ammount")%> .Rs</small><br>  
                               
                            </td>
                            <td class="cart_avail">
                            
                            
                            <p class="product-name"><span style="font-size: large;color: #A22424;"><%# Eval("Parking_Name") %> </span></p>
                               
                                
                                <small style="font-size: medium;"><a href="#">Vehical Type : <%# Eval("Vehical_Type_Name") %></a></small><br />
                                <small style="font-size: medium;"><a href="#">Vehical Name : <%# Eval("Vehical_name") %></a></small><br />
                                <small style="font-size: medium;">Parking Address : <%# Eval("Address") %></small>
                            </td>
                            <td class="price"><span style="background-color: #333333;color: white; padding: 9px;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("From_Date") %>'></asp:Label><asp:Label ID="Label2" runat="server" style="margin-left: 5px;" Text='<%# Eval("From_Time") %>'></asp:Label> <span style="font-weight: 800;color: #FF9900;">To</span>  <asp:Label ID="Label3" runat="server" Text='<%# Eval("To_Date") %>'></asp:Label><asp:Label ID="Label4" runat="server" style="margin-left: 5px;" Text='<%# Eval("To_Time") %>'></asp:Label> </span></td>
                    
                            
                            
                        </tr>
                        
                    </tbody>
                     </ItemTemplate>
                       <FooterTemplate>
               </table>
               </FooterTemplate>
              </asp:Repeater>
                </table>
             
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:admin %>" 
            SelectCommand="SELECT Admin_Booking_Parking.From_Date,
  Admin_Booking_Parking.Id, 
  Admin_Booking_Parking.Total_Ammount,
  Admin_Booking_Parking.From_Time, 
  Admin_Booking_Parking.To_Date,
   Admin_Booking_Parking.To_Time, 
   Admin_Booking_Parking.Vehical_Type_Name, 
   Admin_Booking_Parking.Vehical_name, 
   Admin_Booking_Parking.Purpose,
    Admin_Booking_Parking.Parking_Id,
	Admin_Rent_Space.Address, 
	Admin_Rent_Space.Parking_Name, 
	Admin_Login.Mobile_Number, 
	Admin_Login.Email_Id, 
	Admin_Login.Username 
	 FROM Admin_Login Right OUTER JOIN Admin_Booking_Parking ON Admin_Login.Registration_Id = Admin_Booking_Parking.[Register_Id] Right Outer Join Admin_Rent_Space ON Admin_Rent_Space.[Parking_Id]=  Admin_Booking_Parking.Parking_Id Where  (Admin_Booking_Parking.Status =1 ) AND (Admin_Booking_Parking.Success_Id =1 )  ">
        </asp:SqlDataSource>
            
                   
                    </div>
                </div>
                   </asp:Panel>
                 <asp:Panel ID="Panel3" Visible="false" runat="server">
             
               <div class="col-sm-12">

                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Cancel Booking</label>
                 <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3" 
                            onitemcommand="DataList1_ItemCommand">
                  <HeaderTemplate>
                <table class="table table-bordered table-responsive cart_summary">
                    <thead>
                        <tr>
                            <th class="cart_product"> User Description</th>
                            <th>Booked Parking </th>
                            <th>Booking Date</th>
                         
                          
                         
                           
                        </tr>
                    </thead>
                    </HeaderTemplate>
                     <ItemTemplate>
                    <tbody>
                        <tr>
                            
                            <td class="cart_description">

                                
                                <p class="product-name"><span style="font-size: large;color: #A22424;"><%# Eval("Username") %></span></p>
                                <small class="cart_ref" style="font-size: medium;"><%# Eval("Mobile_Number") %></small><br>
                                <small style="font-size: medium;"><%# Eval("Email_Id") %></small><br>   
                                <small style="background-color: #333333;font-size: medium;color: white;padding: 2px;border-radius: 2px;" > Total Ammount : <%# Eval("Total_Ammount")%> .Rs</small><br>  
                            </td>
                            <td class="cart_avail">
                            
                            
                            <p class="product-name"><span style="font-size: large;color: #A22424;"><%# Eval("Parking_Name") %> </span></p>
                               
                                
                                <small style="font-size: medium;"><a href="#">Vehical Type : <%# Eval("Vehical_Type_Name") %></a></small><br />
                                <small style="font-size: medium;"><a href="#">Vehical Name : <%# Eval("Vehical_name") %></a></small><br />
                                <small style="font-size: medium;">Parking Address : <%# Eval("Address") %></small>
                            </td>
                            <td class="price"><span style="background-color: #333333;color: white; padding: 9px;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("From_Date") %>'></asp:Label><asp:Label ID="Label2" runat="server" style="margin-left: 5px;" Text='<%# Eval("From_Time") %>'></asp:Label> <span style="font-weight: 800;color: #FF9900;">To</span>  <asp:Label ID="Label3" runat="server" Text='<%# Eval("To_Date") %>'></asp:Label><asp:Label ID="Label4" runat="server" style="margin-left: 5px;" Text='<%# Eval("To_Time") %>'></asp:Label> </span></td>
                   
                            
                            
                        </tr>
                        
                    </tbody>
                     </ItemTemplate>
                       <FooterTemplate>
               </table>
               </FooterTemplate>
              </asp:Repeater>
                </table>
             
              <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:admin %>" 
            SelectCommand="SELECT Admin_Booking_Parking.From_Date,
  Admin_Booking_Parking.Id, 
  Admin_Booking_Parking.Total_Ammount,
  Admin_Booking_Parking.From_Time, 
  Admin_Booking_Parking.To_Date,
   Admin_Booking_Parking.To_Time, 
   Admin_Booking_Parking.Vehical_Type_Name, 
   Admin_Booking_Parking.Vehical_name, 
   Admin_Booking_Parking.Purpose,
    Admin_Booking_Parking.Parking_Id,
	Admin_Rent_Space.Address, 
	Admin_Rent_Space.Parking_Name, 
	Admin_Login.Mobile_Number, 
	Admin_Login.Email_Id, 
	Admin_Login.Username 
	 FROM Admin_Login Right OUTER JOIN Admin_Booking_Parking ON Admin_Login.Registration_Id = Admin_Booking_Parking.[Register_Id] Right Outer Join Admin_Rent_Space ON Admin_Rent_Space.[Parking_Id]=  Admin_Booking_Parking.Parking_Id Where  (Admin_Booking_Parking.Status =2 ) AND (Admin_Booking_Parking.Success_Id =1 )  ">
        </asp:SqlDataSource>
            
                   
                    </div>
                </div>
                   </asp:Panel>


            </div>
        </div>
    </div>
</div>
   <%--<asp:UpdateProgress  ID="upprogpnl" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
           
                                        <div   style="z-index: 10025; left: 45%;position: fixed; top: 40%" > 
                                       <center>
                                           <img  id="imglddoader" runat="server"  src="~/Gallery/loader.GIF" height="100" visible="True" width="100" />
                                         </center>
                                       </div>
                                        </ProgressTemplate>

                                    </asp:UpdateProgress>
      </ContentTemplate>
        </asp:UpdatePanel>--%>
</asp:Content>


