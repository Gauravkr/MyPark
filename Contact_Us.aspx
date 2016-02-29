<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Contact_Us.aspx.cs" Inherits="Contact_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<!-- Go to www.addthis.com/dashboard to customize your tools -->


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <asp:Label ID="Label2" runat="server" Visible="false" Text=""></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  <section id="blog-banner">
    <img src="assets/images/blog-banner.jpg" alt="img">
    <div class="blog-overlay">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="blog-banner-area">
              <h2><asp:Label ID="Label1" runat="server" Text="Contact Us"></asp:Label></h2>
              <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>                
                <li class="active">Contact Us</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


   <section id="blog">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="blog-area">
            <div class="row">
              <div class="col-sm-6">
             <div class="box-authentication" style="width: 100%;border: 1px solid black;      background-color: white;padding: 30px;      min-height: 320px;">
                        <h3>Contact Us</h3>
                        <label for="emmail_login"></label>
                         <asp:TextBox ID="txtusername" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                        <label for="emmail_login"></label>
                         <asp:TextBox ID="txtmob" runat="server" class="form-control" placeholder="Mobile Number "></asp:TextBox>
                         <label for="emmail_login"></label>
                         <asp:TextBox ID="txtema" runat="server" class="form-control" placeholder=" Email Id"></asp:TextBox>
                         <label for="emmail_login"></label>
                         <asp:TextBox ID="txtmsg" runat="server" class="form-control" placeholder="Message" Rows="7" TextMode="MultiLine"></asp:TextBox>
                      <br />
                        <asp:Button ID="Button1" TabIndex="0"  runat="server" Text="Submit" 
                            style="font-size: larger;width: 30%;color: white;border-radius: 7px;padding: 7px;background-color: #00d999;" onclick="Button1_Click"
                                                ></asp:Button>
                      
                    </div>
              </div>
              <div class="col-sm-6" style="width: 50%;border: 1px solid black;      background-color: white;padding: 30px;      min-height: 320px;">
              <div class="box-authentication">
                <%-- <h3>How To Works </h3>--%>
                  <h2>Contact with us</h2>
             <address class="single-address">
              <h4 style="color: #43D8C5;">Postal address:</h4>
              <p style="color:#9E8787">PO Box 16122 Collins Street West Victoria 8007 Australia</p>
            </address>
            <%-- <address class="single-address">
              <h4 style="color: #43D8C5;">Headquarters:</h4>
              <p style="color:#9E8787">121 King Street, Melbourne Victoria 3000 Australia</p>
            </address>--%>
             <address class="single-address">
              <h4 style="color: #43D8C5;">Phone</h4>
              <p style="color:#9E8787">Phone Number: (123) 456 7890</p>
              <p style="color:#9E8787">Fax Number: (123) 456 7890</p>
            </address>
             <address class="single-address">
              <h4 style="color: #43D8C5;">E-Mail</h4>
              <p style="color:#9E8787">Support: Support@example.com</p>
              <p style="color:#9E8787">Sales: sales@example.com</p>
            </address>
                <div class="footer-social">
                <a class="facebook" href="#"><span class="fa fa-facebook" style="margin-top: 14px;"></span></a>
                <a class="twitter" href="#"><span class="fa fa-twitter" style="margin-top: 14px;"></span></a>
                <a class="google-plus" href="#"><span class="fa fa-google-plus" style="margin-top: 14px;"></span></a>
                <a class="youtube" href="#"><span class="fa fa-youtube" style="margin-top: 14px;"></span></a>
                <a class="linkedin" href="#"><span class="fa fa-linkedin" style="margin-top: 14px;"></span></a>
                <a class="dribbble" href="#"><span class="fa fa-dribbble" style="margin-top: 14px;"></span></a>
                </div>
             
              </div>
              </div> 
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
