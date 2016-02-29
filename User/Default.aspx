<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.floot
{
        float: right;
    width: 28px;
    padding: 0px 6px 5px 0px;
}
.err
{
    font-size: x-large;
    color: red;
    }
</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="columns-container">
    <div class="container" id="columns">
       
        <div class="page-content" style="border: 1px solid #00D999;padding: 39px;background-color: rgba(197, 197, 197, 0.22);">
            <div class="row">
            <!-- Left colunm -->
               <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- Product -->
                    <div id="product">
                    <div class="primary-box row">
                        <asp:Label ID="Label5" runat="server" CssClass="err" Text=""></asp:Label>
                        <asp:Label ID="Label6" runat="server" CssClass="err" Text=""></asp:Label>
                        <asp:Label ID="Label7" runat="server" CssClass="err" Text=""></asp:Label>
                    </div>
                        <div class="primary-box row">
                            <div class="pb-left-column col-xs-3 col-sm-3">
                                <!-- product-imge-->
                                <div class="product-image">
                                    <div class="product-full" style="border: 1px solid #00D999;">
                                        <asp:Image ID="Image1" runat="server" />
                                        <%--<img src="assets/images/default-user-image.png" />--%>
                                    </div>
                                    
                                </div>
                                <br />
                             <center >  <asp:Button ID="Button1" runat="server"   class="btn btn-primary" 
                                     Text="Edit Profile" onclick="Button1_Click" />
                                <!-- product-imge--></center> 
                            </div>
                            <div class="pb-right-column col-xs-12 col-sm-6" style="padding-left: 9%;">
                               
                                
                                <div class="product-price-group">
                                     <span class="price" style="
    font-size: xx-large;
"><asp:Label ID="Label1" style="
    text-transform: capitalize;
" runat="server" Text=""></asp:Label></span>
<br /><asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                                   <p style="margin-top: 21px;">Mobile Number : <span class="price" ><asp:Label ID="Label2" runat="server" Text=""></asp:Label></span></p>
                                    <p>Email Id : <span class="price"><asp:Label ID="Label3" runat="server" Text=""></asp:Label></span></p>
                                     <p>Member Code: <span class="price"><asp:Label ID="lblcode" runat="server" Text=""></asp:Label></span></p>
                                </div>
                            
                              
                                
                               
                            </div>
                        </div>
                        <!-- tab product -->
                      
                   
                    </div>
                <!-- Product -->
            </div>
            <div class="column col-xs-12 col-sm-3" id="left_column">
              
                <div class="block left-module" style="border: 1px solid #00D999;">
                    <p class="title_block"  style="background-color: #00D999;color: white;">Trust Centre</p>
                          <p class="title_block" style="border-bottom: 1px solid #00D999;">Email Address 
                              <asp:Image ID="r1" CssClass="floot" runat="server" ImageUrl="~/User/img/1.png" /> <asp:Image CssClass="floot" ID="w1" runat="server" ImageUrl="~/User/img/2.png"/> </p>
                        <p class="title_block" style="border-bottom: 1px solid #00D999;">Membership
                        <asp:Image ID="r2" runat="server" CssClass="floot" ImageUrl="~/User/img/1.png"/> <asp:Image ID="w2" runat="server" CssClass="floot" ImageUrl="~/User/img/2.png"/> 
                        </p>
                        <p class="title_block" style="border-bottom: 1px solid #00D999;">Profile Photo
                        <asp:Image ID="r3" runat="server" CssClass="floot" ImageUrl="~/User/img/1.png"/> <asp:Image ID="w3" runat="server" CssClass="floot" ImageUrl="~/User/img/2.png"/> 
                        </p>
                        <p class="title_block" style="border-bottom: 1px solid #00D999;">Phone Number
                        <asp:Image ID="r4" runat="server" CssClass="floot" ImageUrl="~/User/img/1.png"/> <asp:Image ID="w4" runat="server" CssClass="floot" ImageUrl="~/User/img/2.png"/> 
                        </p>
                    
                </div>
                <!-- ./block category  -->
                
                
            </div>
            <!-- ./left colunm -->
            <!-- Center colunm-->
         
            <!-- ./ Center colunm -->
        </div>
        </div>
    </div>
</div>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:admin %>" 
            SelectCommand="SELECT User_Infomation.Registration_Id, Admin_Login.Registration_Id AS Expr1, Admin_Login.Defoult_Date FROM User_Infomation INNER JOIN Admin_Login ON User_Infomation.Registration_Id = Admin_Login.Registration_Id"></asp:SqlDataSource>

</asp:Content>


