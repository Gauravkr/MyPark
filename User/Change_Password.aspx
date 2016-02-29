<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Change_password.aspx.cs" Inherits="A_SVMerchant_Change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">change Password</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">change Password</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">Old Password</label>
            
                    <asp:TextBox ID="txtoldpass" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Please Enter Old Password" ControlToValidate="txtoldpass" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                        <label for="emmail_register">New Password</label>
                    <asp:Label ID="Label2" runat="server" Text="" Visible="False"></asp:Label>
                  <asp:TextBox ID="txtnewpass" runat="server" class="form-control "
                                                TextMode="Password" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Please Enter New Password" Display="None" ControlToValidate="txtnewpass" 
                                                ValidationGroup="ab"></asp:RequiredFieldValidator>


                        
                        <label for="emmail_register">Confirm Password</label>
                        
                         <asp:Label ID="Label3" runat="server" Text="" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtconform_password" runat="server" class="form-control "
                                                TextMode="Password" ></asp:TextBox>
                                             <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                ErrorMessage="Password Not Match" Display="None" ControlToCompare="txtnewpass" 
                                                ControlToValidate="txtconform_password" ValidationGroup="ab"></asp:CompareValidator>
                 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtconform_password" 
                        ErrorMessage="Please Enter Conform Password" ValidationGroup="ab"></asp:RequiredFieldValidator>
                        
                   
                      
                   
                       <%-- <button class="button"><i class="fa fa-user"></i> Create an account</button>--%>
                      <asp:Button ID="Button2" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" onclick="Button2_Click" ></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="ab" 
                            runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>

</asp:Content>

