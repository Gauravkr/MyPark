<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <section id="contact">
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="contact-left wow fadeInLeft">
            <h3 style=" font-size: x-large;color: white;">Support For Booking </h3>
             <address class="single-address">
              <h4> address:</h4>
              <p>"J P Nagar Phase 1, bangalore</p>
            </address>
             <address class="single-address">
              <h4>Phone</h4>
              <p>Phone Number:9902738900</p>
        
            </address>
             <address class="single-address">
              <h4>E-Mail</h4>
              <p>Support: support@parkingmy.com</p>
              <p>Info: info@parkingmy.com</p>
            </address>
          </div>
        </div>
        <div class="col-md-8 col-sm-6 col-xs-12">
          <div class="contact-right wow fadeInRight">
            <h2>Parking Name</h2>
            <div action="" class="contact-form">
              <div class="form-group">                
            
                  <span style="color: white;">From Date  </span> 
                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="From" style="width: 25%;display: inline-block;margin-left: 30px;"></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="TextBox1" >
                        </asp:CalendarExtender>
                        <asp:DropDownList ID="DropDownList2" class="form-control" style="height: 47px;display: inline-block;width: 18%;" runat="server">
                            
                           
<asp:ListItem  value="00:00:00" >12:00am</asp:ListItem>
<asp:ListItem  value="00:30:00" >12:30am</asp:ListItem>
<asp:ListItem  value="01:00:00" >1:00am</asp:ListItem>
<asp:ListItem  value="01:30:00" >1:30am</asp:ListItem>
<asp:ListItem  value="02:00:00" >2:00am</asp:ListItem>
<asp:ListItem  value="02:30:00" >2:30am</asp:ListItem>
<asp:ListItem  value="03:00:00" >3:00am</asp:ListItem>
<asp:ListItem  value="03:30:00" >3:30am</asp:ListItem>
<asp:ListItem  value="04:00:00" >4:00am</asp:ListItem>
<asp:ListItem  value="04:30:00" >4:30am</asp:ListItem>
<asp:ListItem  value="05:00:00" >5:00am</asp:ListItem>
<asp:ListItem  value="05:30:00" >5:30am</asp:ListItem>
<asp:ListItem  value="06:00:00" >6:00am</asp:ListItem>
<asp:ListItem  value="06:30:00" >6:30am</asp:ListItem>
<asp:ListItem  value="07:00:00" >7:00am</asp:ListItem>
<asp:ListItem  value="07:30:00" >7:30am</asp:ListItem>
<asp:ListItem  value="08:00:00" selected="selected" >8:00am</asp:ListItem>
<asp:ListItem  value="08:30:00" >8:30am</asp:ListItem>
<asp:ListItem  value="09:00:00" >9:00am</asp:ListItem>
<asp:ListItem  value="09:30:00" >9:30am</asp:ListItem>
<asp:ListItem  value="10:00:00" >10:00am</asp:ListItem>
<asp:ListItem  value="10:30:00" >10:30am</asp:ListItem>
<asp:ListItem  value="11:00:00" >11:00am</asp:ListItem>
<asp:ListItem  value="11:30:00" >11:30am</asp:ListItem>
<asp:ListItem  value="12:00:00" >12:00pm (Noon)</asp:ListItem>
<asp:ListItem  value="12:30:00" >12:30pm</asp:ListItem>
<asp:ListItem  value="13:00:00" >1:00pm</asp:ListItem>
<asp:ListItem  value="13:30:00" >1:30pm</asp:ListItem>
<asp:ListItem  value="14:00:00" >2:00pm</asp:ListItem>
<asp:ListItem  value="14:30:00" >2:30pm</asp:ListItem>
<asp:ListItem  value="15:00:00" >3:00pm</asp:ListItem>
<asp:ListItem  value="15:30:00" >3:30pm</asp:ListItem>
<asp:ListItem  value="16:00:00" >4:00pm</asp:ListItem>
<asp:ListItem  value="16:30:00" >4:30pm</asp:ListItem>
<asp:ListItem  value="17:00:00" >5:00pm</asp:ListItem>
<asp:ListItem  value="17:30:00" >5:30pm</asp:ListItem>
<asp:ListItem  value="18:00:00" >6:00pm</asp:ListItem>
<asp:ListItem  value="18:30:00" >6:30pm</asp:ListItem>
<asp:ListItem  value="19:00:00" >7:00pm</asp:ListItem>
<asp:ListItem  value="19:30:00" >7:30pm</asp:ListItem>
<asp:ListItem  value="20:00:00" >8:00pm</asp:ListItem>
<asp:ListItem  value="20:30:00" >8:30pm</asp:ListItem>
<asp:ListItem  value="21:00:00" >9:00pm</asp:ListItem>
<asp:ListItem  value="21:30:00" >9:30pm</asp:ListItem>
<asp:ListItem  value="22:00:00" >10:00pm</asp:ListItem>
<asp:ListItem  value="22:30:00" >10:30pm</asp:ListItem>
<asp:ListItem  value="23:00:00" >11:00pm</asp:ListItem>
<asp:ListItem  value="23:30:00" >11:30pm</asp:ListItem>
<asp:ListItem  value="23:59:59" >Midnight</asp:ListItem>
                        </asp:DropDownList>

   

              </div>
              <div class="form-group">                
              <span style="color: white;" >To Date</span>
                 <asp:TextBox ID="TextBox2" runat="server" class="form-control"  style="width: 25%;display: inline-block;padding-left: 12px;margin-left: 50PX;" ></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server"  
                            Enabled="True" TargetControlID="TextBox2">
                        </asp:CalendarExtender>
                        <asp:DropDownList ID="DropDownList6" style="height: 47px;display: inline-block;width: 18%;"  runat="server">
                            
                           
<asp:ListItem  value="00:00:00" >12:00am</asp:ListItem>
<asp:ListItem  value="00:30:00" >12:30am</asp:ListItem>
<asp:ListItem  value="01:00:00" >1:00am</asp:ListItem>
<asp:ListItem  value="01:30:00" >1:30am</asp:ListItem>
<asp:ListItem  value="02:00:00" >2:00am</asp:ListItem>
<asp:ListItem  value="02:30:00" >2:30am</asp:ListItem>
<asp:ListItem  value="03:00:00" >3:00am</asp:ListItem>
<asp:ListItem  value="03:30:00" >3:30am</asp:ListItem>
<asp:ListItem  value="04:00:00" >4:00am</asp:ListItem>
<asp:ListItem  value="04:30:00" >4:30am</asp:ListItem>
<asp:ListItem  value="05:00:00" >5:00am</asp:ListItem>
<asp:ListItem  value="05:30:00" >5:30am</asp:ListItem>
<asp:ListItem  value="06:00:00" >6:00am</asp:ListItem>
<asp:ListItem  value="06:30:00" >6:30am</asp:ListItem>
<asp:ListItem  value="07:00:00" >7:00am</asp:ListItem>
<asp:ListItem  value="07:30:00" >7:30am</asp:ListItem>
<asp:ListItem  value="08:00:00" selected="selected" >8:00am</asp:ListItem>
<asp:ListItem  value="08:30:00" >8:30am</asp:ListItem>
<asp:ListItem  value="09:00:00" >9:00am</asp:ListItem>
<asp:ListItem  value="09:30:00" >9:30am</asp:ListItem>
<asp:ListItem  value="10:00:00" >10:00am</asp:ListItem>
<asp:ListItem  value="10:30:00" >10:30am</asp:ListItem>
<asp:ListItem  value="11:00:00" >11:00am</asp:ListItem>
<asp:ListItem  value="11:30:00" >11:30am</asp:ListItem>
<asp:ListItem  value="12:00:00" >12:00pm (Noon)</asp:ListItem>
<asp:ListItem  value="12:30:00" >12:30pm</asp:ListItem>
<asp:ListItem  value="13:00:00" >1:00pm</asp:ListItem>
<asp:ListItem  value="13:30:00" >1:30pm</asp:ListItem>
<asp:ListItem  value="14:00:00" >2:00pm</asp:ListItem>
<asp:ListItem  value="14:30:00" >2:30pm</asp:ListItem>
<asp:ListItem  value="15:00:00" >3:00pm</asp:ListItem>
<asp:ListItem  value="15:30:00" >3:30pm</asp:ListItem>
<asp:ListItem  value="16:00:00" >4:00pm</asp:ListItem>
<asp:ListItem  value="16:30:00" >4:30pm</asp:ListItem>
<asp:ListItem  value="17:00:00" >5:00pm</asp:ListItem>
<asp:ListItem  value="17:30:00" >5:30pm</asp:ListItem>
<asp:ListItem  value="18:00:00" >6:00pm</asp:ListItem>
<asp:ListItem  value="18:30:00" >6:30pm</asp:ListItem>
<asp:ListItem  value="19:00:00" >7:00pm</asp:ListItem>
<asp:ListItem  value="19:30:00" >7:30pm</asp:ListItem>
<asp:ListItem  value="20:00:00" >8:00pm</asp:ListItem>
<asp:ListItem  value="20:30:00" >8:30pm</asp:ListItem>
<asp:ListItem  value="21:00:00" >9:00pm</asp:ListItem>
<asp:ListItem  value="21:30:00" >9:30pm</asp:ListItem>
<asp:ListItem  value="22:00:00" >10:00pm</asp:ListItem>
<asp:ListItem  value="22:30:00" >10:30pm</asp:ListItem>
<asp:ListItem  value="23:00:00" >11:00pm</asp:ListItem>
<asp:ListItem  value="23:30:00" >11:30pm</asp:ListItem>
<asp:ListItem  value="23:59:59" >Midnight</asp:ListItem>
                        </asp:DropDownList>
              </div>  
              <div class="form-group">                
              <span style="color: white;" > Vehical Type</span>
                <asp:DropDownList ID="DropDownList3"  runat="server" AutoPostBack="True" style="height: 47px;width: 44%;margin-left: 15px;"
                        DataSourceID="SqlDataSource1" DataTextField="Vehical_Type" 
                        DataValueField="Id" ondatabound="DropDownList3_DataBound"></asp:DropDownList>     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:admin %>" 
                        SelectCommand="SELECT * FROM [Add_Vehical_Type]"></asp:SqlDataSource>
              </div>              
              <div class="form-group">
                   <span style="color: white;" > Vehical Name</span>
                   <asp:DropDownList ID="DropDownList5" style="height: 48px;width: 44%; margin-left: 6px;" runat="server" AutoPostBack="True">
                                    <asp:ListItem Value="0">--Select vehical Name--</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>   
                        <asp:Button ID="Button1" runat="server" 
                                style="font-size: larger;color: white;background-color: #00d999;" 
                                Text="Add Vehical" onclick="Button1_Click" ></asp:Button>
              </div>
               <center >  <asp:Panel ID="Panel1" style="width: 59%;background-color: rgba(241, 241, 241, 0.28);padding: 11px;" Visible="false" runat="server">

                  <div class="form-group">                

                <asp:DropDownList ID="DropDownList4"  class="form-control"  runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="Vehical_Type" 
                        DataValueField="Id" ondatabound="DropDownList4_DataBound"></asp:DropDownList>     
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:admin %>" 
                        SelectCommand="SELECT * FROM [Add_Vehical_Type]"></asp:SqlDataSource>
              </div>
                <div class="form-group">                
             
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Vehical Name" class="form-control"  ></asp:TextBox>
              </div>
                   <div class="form-group">                
             
        <asp:TextBox ID="TextBox4" runat="server" placeholder="Model Number"   class="form-control"  ></asp:TextBox>
              </div>
              <div class="form-group">                
             
        <asp:TextBox ID="TextBox5" runat="server" placeholder="Vehical Companey Name"  class="form-control"  ></asp:TextBox>

        <asp:Button ID="Button2" runat="server" Text="Submit" style="width: 43%;font-size: larger;color: white;background-color: #00d999;"></asp:Button>
                  <asp:Button ID="Button3" runat="server" Text="Cancel" 
                      style="width: 38%;font-size: larger;color: white;background-color: #00d999;margin-left: 27px;" 
                      onclick="Button3_Click"></asp:Button>
              </div>
              </asp:Panel></center>  
              <div class="form-group">                
             <span style="color: white;" ></span>
        <asp:TextBox ID="TextBox6" runat="server" class="form-control"  style="
    height: 86px;
"
                      placeholder="Purpose Of journey" Rows="1" TextMode="MultiLine"  ></asp:TextBox>
              </div>
              
              <div class="form-group">                
             <span style="color: white;" ></span>
             <center >
   <asp:Button ID="Button4"  style="width: 37%;font-size: larger;color: white;background-color: #00d999;" runat="server" Text="Submit"></asp:Button>
              </center>
              </div>
           
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>


