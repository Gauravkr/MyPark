<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Booking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media only screen and (max-width:405px) {
            .back {
                margin-left: 0px !important;
            }

            .lll {
                margin-top: 13px;
            }
        }
        
        
    </style>
   

</script>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="Label5" runat="server" Visible="false" Text=""></asp:Label>
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        <div class="col-md-8 col-sm-6 col-xs-12">
          <div class="contact-right wow fadeInRight">
            <h2><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2><asp:Label ID="lblcode" runat="server" Visible="false"  Text="" ></asp:Label>
            <asp:Label ID="Label2" runat="server" Visible="false"   Text=""></asp:Label>
            <div action="" class="contact-form">
              <div class="form-group">                
            
                  <span style="color: white;">From Date  </span> 
                <asp:TextBox ID="TextBox1" runat="server" class="form-control back"   placeholder="-Select Date-"  style="width: 165px;display: inline-block;margin-left: 30px;"></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" Format="dd/MM/yyyy"  runat="server" 
                            Enabled="True" TargetControlID="TextBox1" >
                        </asp:CalendarExtender>
                        <asp:DropDownList ID="DropDownList2" class="form-control back" style="height: 47px;display: inline-block;width: 165px;" runat="server">
                            
                           
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
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ForeColor="Red" ValidationGroup="ab" runat="server" ControlToValidate="TextBox1" ErrorMessage="Select From Date"></asp:RequiredFieldValidator>                 
       <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

              </div>
              <div class="form-group">                
              <span style="color: white;" >To Date</span>
                 <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="true"  class="form-control back"   
                      placeholder="-Select Date-"   
                      
                      style="width: 165px;display: inline-block;padding-left: 12px;margin-left: 50PX;" ontextchanged="TextBox2_TextChanged" 
                       ></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server"  
                            Enabled="True" TargetControlID="TextBox2" >
                        </asp:CalendarExtender>
                        <asp:DropDownList ID="DropDownList6" CssClass="form-control back" style="height: 47px;display: inline-block;width: 165px;"  runat="server">
                            
                           
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
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  ForeColor="Red" ValidationGroup="ab" runat="server" ControlToValidate="TextBox2" ErrorMessage="Select To Date"></asp:RequiredFieldValidator>                 
              </div>  
                <asp:Label ID="Label10" runat="server" Visible="false"   Text=""></asp:Label>
           
         
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
              <div class="form-group">                
              <span style="color: white;" > Vehical Type</span>
                <asp:DropDownList ID="DropDownList3"  runat="server" 
                      CssClass="form-conggtrol back"  style="height: 47px;width: 220px;margin-left: 15px;"
                        DataSourceID="SqlDataSource1" AutoPostBack="true"  DataTextField="Vehical_Type" 
                        DataValueField="Id" ondatabound="DropDownList3_DataBound" onselectedindexchanged="DropDownList3_SelectedIndexChanged" 
                      ></asp:DropDownList>     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:admin %>" 
                        SelectCommand="SELECT * FROM [Add_Vehical_Type]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  ForeColor="Red"  ValidationGroup="ab" InitialValue="--Select Vehical Type--" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Select Vehicle Type"></asp:RequiredFieldValidator>                 
                  <asp:Label ID="Label7" Visible="false" runat="server" Text=""></asp:Label>
                   <asp:Label ID="Label8" Visible="false" runat="server" Text=""></asp:Label>
                
              </div>              
              <div class="form-group">
                   <span style="color: white;" > Vehical Name</span>
                   <asp:DropDownList ID="DropDownList5" CssClass="form-conggtrol back" 
                       style="height: 48px;width: 220px; margin-left: 6px;" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="Vehical_Name"  OnDataBound="DropDownList5_DataBound"
                       DataValueField="Register_Id">
                                   
                            </asp:DropDownList> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  ForeColor="Red" ValidationGroup="ab" runat="server" InitialValue="--Select vehical Name--" ControlToValidate="DropDownList5" ErrorMessage="Select Vehicle Name"></asp:RequiredFieldValidator>                  
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:admin %>" 
                       SelectCommand="SELECT [Register_Id], [Vehical_Name] FROM [Admin_Add_Vehical] WHERE ([Register_Id] = @Register_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="Register_Id" PropertyName="Text" 
                                    Type="String" />
                            </SelectParameters>
                   </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server" CssClass="lll"
                                style="font-size: larger;color: white;background-color: #00d999;" 
                                Text="Add Vehical" onclick="Button1_Click" ></asp:Button>
              </div>
               <center > 
                <asp:Panel ID="Panel1" style="width: 100%;background-color: rgba(241, 241, 241, 0.28);padding: 11px;" Visible="false" runat="server">

                  <div class="form-group">                

                <asp:DropDownList ID="DropDownList4"  class="form-control"  runat="server"  
                        DataSourceID="SqlDataSource1" DataTextField="Vehical_Type" 
                        DataValueField="Id" ondatabound="DropDownList4_DataBound"></asp:DropDownList>     
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:admin %>" 
                        SelectCommand="SELECT * FROM [Add_Vehical_Type]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  Visible="true" ForeColor="Red" ValidationGroup="a" runat="server" InitialValue="--Select Vehical Type--" ControlToValidate="DropDownList4" ErrorMessage="Select Vehicle type"></asp:RequiredFieldValidator>
              </div>
                <div class="form-group">                
             
        <asp:TextBox ID="txtname" runat="server" placeholder="licence Plate Number" class="form-control"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ValidationGroup="a" runat="server" ControlToValidate="txtname" ErrorMessage="Enter licence Plate Number"></asp:RequiredFieldValidator>
              </div>
                   <div class="form-group">                
             
        <asp:TextBox ID="txtmodel" runat="server" placeholder="Model Number"   class="form-control"  ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ForeColor="Red" runat="server" ValidationGroup="a" ControlToValidate="txtmodel" ErrorMessage="Enter Model Number"></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="None" ValidationGroup="a" ValidationExpression="^[0-9]{10}$" runat="server" ControlToValidate="txtmodel" ErrorMessage="Enter 10 Digit Number"></asp:RegularExpressionValidator>
              </div>
              <div class="form-group">                
             
        <asp:TextBox ID="txtcname" runat="server" placeholder="Vehical Companey Name"  class="form-control"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ValidationGroup="a" runat="server" ControlToValidate="txtcname" ErrorMessage="Enter Vehical Companey Name"></asp:RequiredFieldValidator>
        <br /><asp:Button ID="Button2" runat="server" Text="Submit" ValidationGroup="a"
                      style="width: 92px;font-size: larger;color: white;background-color: #00d999;" 
                      onclick="Button2_Click"></asp:Button>
                      <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="a" runat="server" ShowMessageBox="True" ShowSummary="False" />
                  <asp:Button ID="Button3" runat="server" Text="Cancel" 
                      style="width: 92px;font-size: larger;color: white;background-color: #00d999;margin-left: 0px;" 
                      onclick="Button3_Click"></asp:Button>
              </div>
              </asp:Panel></center>  
              <center> 
              <asp:Panel ID="Panel2" Visible="false" runat="server">
              <div class="form-group" style="color: #00D999;font-size: x-large;">Total Payable Ammount :-</span>  
                            <asp:Label ID="Label6" CssClass="form-conggtrol back"  runat="server" Text=""></asp:Label> <asp:Label ID="Label9" CssClass="form-conggtrol back"  runat="server" Text=".Rs"></asp:Label>
                          </asp:Panel>
                          
                            </center> 
              <div class="form-group">                
             <span style="color: white;" ></span>
        <asp:TextBox ID="TextBox6" runat="server" class="form-control"  style="height: 86px;" placeholder="Purpose Of journey" Rows="1" TextMode="MultiLine"  ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9"  ForeColor="Red" ValidationGroup="ab" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter Your Purpose Of Journey"></asp:RequiredFieldValidator>                  
              </div>
              <div class="form-group">  
             <span style="color: white;" ></span>
             <center >
   <asp:Button ID="Button4"  ValidationGroup="ab"
                     style="width: 164px;font-size: 26px;color: white;background-color: rgb(33, 140, 20);font-weight: bold;" 
                     runat="server" Text="Book Now" OnClientClick="if ( !confirm('Are you sure Booking ?')) return ;" onclick="Button4_Click"></asp:Button>
                     <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="ab" runat="server" ShowMessageBox="True" ShowSummary="false" />
              </center>
              </div>
            </div>
          </div>
        </div>
        <asp:UpdateProgress  ID="upprogpnl" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
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
    </div>
  </section>
</asp:Content>


