<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Add_Vehicle.aspx.cs" Inherits="User_Add_Vehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Vehicles</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">Vehicles</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">
                        <asp:Panel ID="Panel1" runat="server">
                         <label for="emmail_register">License Plate</label>
            
                    <asp:TextBox ID="txtvehicle" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Vehicle" ControlToValidate="txtvehicle" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                       
                      <asp:Button ID="Button2" runat="server" Text="Lookup" class="button" 
                                                 ValidationGroup="ab" onclick="Button2_Click" ></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="ab" 
                            runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                             <label for="emmail_register">Vehicle type
</label>
            
                    <asp:TextBox ID="txttype" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ErrorMessage="Enter Vehicle" ControlToValidate="txtvehicle" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                                                      <label for="emmail_register">Make</label>
            
                    <asp:TextBox ID="txtmake" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Enter Vehicle" ControlToValidate="txtvehicle" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>

                                                      <label for="emmail_register">Model</label>
            
                    <asp:TextBox ID="txtmodel" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ErrorMessage="Enter Vehicle" ControlToValidate="txtvehicle" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                       
                      <asp:Button ID="Button4" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" ></asp:Button>
                        </asp:Panel>
                       
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Category</label>
            
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

