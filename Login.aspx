<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
  @media only screen and (max-width: 768px)
        {
        .sss {
                width: 65% !important;
                margin-top: 10px;
        }
        }
          @media only screen and (max-width: 500px)
        {
        .sss {
                width: 100% !important;
    margin-top: 10px;
        }
        }
        @media only screen and (max-width: 370px)
        {
        .pp {
                padding:8px !important;
        }
        }
        @media only screen and (max-width: 767px){
#blog-banner {
    margin-top: -6px;
}}
</style>
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
              <h2><asp:Label ID="Label1" runat="server" Text="Login / Register"></asp:Label></h2>
              <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>                
                <li class="active">Login / Register</li>
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
              <div class="col-sm-6 sss">
             <div class="box-authentication pp" style="width: 100%;border: 1px solid black;      background-color: white;padding: 30px;      min-height: 377px;">
                        <h3>Login Here</h3>
                        <label for="emmail_login"></label>
                         <asp:TextBox ID="txtusername" runat="server" class="form-control" placeholder=" Email Id"></asp:TextBox>

                        <label for="password_login"></label>
                       <asp:TextBox ID="txtpass" runat="server" class="form-control"  placeholder="Password" TextMode="Password"></asp:TextBox>
                        <p class="forgot-pass"><a href="Forgot_Password.aspx">Forgot your password?</a></p>

                        <asp:Button ID="Button1" TabIndex="0"  runat="server" Text="Sign in" 
                            style="font-size: larger;width: 125px;color: white;border-radius: 7px;padding: 7px;background-color: #00d999;" onclick="Button1_Click"
                                                ></asp:Button>
                      
                    </div>
              </div>
              <div class="col-sm-6 sss" >
              <div class="box-authentication pp"  style="width: 100%;border: 1px solid black;      background-color: white;padding: 30px;      min-height: 320px;">
                 <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>--%>
                         <asp:Panel ID="Panel1" runat="server">
                                  <div>
                 <h3>Create an account </h3>
                       
                        <label for="emmail_register"></label>
                   <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder=" Your Name"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ErrorMessage="Enter Name" ControlToValidate="txtname" Display="None" 
                                                ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                        
                        <label for="emmail_register"></label>
                     <asp:TextBox ID="txtmobile" runat="server" class="form-control" placeholder=" Mobile Number  (Eg. 9898xxxxxx)"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Enter Mobile Number" ControlToValidate="txtmobile" 
                                                Display="None" ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ControlToValidate="txtmobile" Display="None" 
                                                ErrorMessage="Enter Valid Mobile Number" 
                                                ValidationExpression="^[0-9]{10}$"
                                                ValidationGroup="abcccc"></asp:RegularExpressionValidator>
                        
                        <label for="emmail_register"></label>
                        <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder=" Email Id"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Email Id" ControlToValidate="txtemail" Display="None" 
                                                ValidationGroup="abcccc"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                ControlToValidate="txtemail" Display="None" ErrorMessage="Enter Valid Email Id" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="abcccc"></asp:RegularExpressionValidator>
                        
                        <label for="emmail_register"></label>
                       <asp:TextBox ID="txtuserpass" runat="server" class="form-control"
                                                placeholder=" Password" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ErrorMessage="Enter Password" ControlToValidate="txtuserpass" 
                                                ValidationGroup="abcccc" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" style="font-size: xx-small;" runat="server" ControlToValidate="txtuserpass"
    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
    ErrorMessage="Minimum 8 characters, 1 Alphabet, 1 Number and 1 Special Character" Display="Dynamic" ValidationGroup="abccccc" ForeColor="Red" />

                        <label for="emmail_register"></label>
                         <asp:TextBox ID="txtcpass" runat="server" class="form-control"
                                                placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ControlToCompare="txtuserpass" ControlToValidate="txtcpass" Display="None" 
                                                ErrorMessage="Password Not Match" ValidationGroup="abcccc"></asp:CompareValidator>
                        

                   
                       <%-- <button class="button"><i class="fa fa-user"></i> Create an account</button>--%>
                      <asp:Button ID="Button2" runat="server" Text="Create an Account" style="margin-top: 19px;font-size: larger;width: 200px;color: white;border-radius: 7px;padding: 7px;background-color: #00d999;"
                                                 ValidationGroup="abcccc" 
                      onclick="Button2_Click"></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="abcccc" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </div>
                        </asp:Panel>
                        
                        <asp:Panel ID="Panel2" Visible="false" runat="server">
                        <h3 style="color:White" class="fonnt">Enter Verification Code</h3></center> 
                                                    <asp:Label ID="lblfirstverification" Visible="false" runat="server" Text=""></asp:Label>
                                          <asp:TextBox ID="txtfiratverification" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                                ErrorMessage="Enter OTP" ControlToValidate="txtfiratverification" Display="None" 
                                                ValidationGroup="jacks"></asp:RequiredFieldValidator>
                        <br />
                                        
                                      
                                          <asp:Button ID="Button16" runat="server" Text="Finish" ValidationGroup="jacks"
                                            style="margin-top: 19px;font-size: larger;width: 200px;color: white;border-radius: 7px;padding: 7px;background-color: #00d999;" 
                                                class="btn form-btn btn-lg btn-block" onclick="Button5_Clickfirstverify"/>
                                                 <asp:Button ID="Button17" runat="server" Text="Cancle"
                                            style="margin-top: 19px;font-size: larger;width: 200px;color: white;border-radius: 7px;padding: 7px;background-color: #00d999;" 
                                                class="btn form-btn btn-lg btn-block" onclick="Button5_Clickfirstcancel"/>
                                     <br />
                                           
                                        <asp:ValidationSummary ID="ValidationSummary9" ValidationGroup="jacks" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                       
                        </asp:Panel>
                       <%--  <asp:UpdateProgress  ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
           
                                        <div   style="z-index: 10025; left: 45%;position: fixed; top: 40%" > 
                                       <center>
                                           <img  id="imglaaaddoader" runat="server"  src="~/Gallery/loader.GIF" height="100" visible="True" width="100" />
                                         </center>
                                       </div>
                                        </ProgressTemplate>

                                    </asp:UpdateProgress>
                                       </ContentTemplate>
                                        </asp:UpdatePanel>--%>
              </div>
              </div> 
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>

