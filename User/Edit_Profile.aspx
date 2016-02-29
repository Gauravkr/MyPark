<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Edit_Profile.aspx.cs" Inherits="User_Edit_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .call
     {
        width:65%;
         }
    
  @media (max-width: 280px) {

     .call
     {
         width:100%;
         }
   
}    
 
     @media (max-width: 480px) {

      .call
     {
         width:100%;
         }
}
 @media (max-width: 1200px) {
.call
      {
       
        
      }
 }
 </style>
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="jquery.Jcrop.js" type="text/javascript"></script>
<link href="jquery.Jcrop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $('#imgcrop').Jcrop({
            onSelect: getcroparea
        });
    })
    function getcroparea(c) {
        $('#hdnx').val(c.x);
        $('#hdny').val(c.y);
        $('#hdnw').val(c.w);
        $('#hdnh').val(c.h);
    };
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 <div>
 
            <div class="container">

  <div class="content">

    <div class="content-container">

      

      <div class="content-header">
        <h2 class="content-header-title">User Information </h2>
        <ol class="breadcrumb">
       <%--   <li><a href="./index.html">Home</a></li>
          <li><a href="javascript:;">Data Elements</a></li>
          <li class="active">Form Validation</li>--%>
       
        </ol>
      </div> <!-- /.content-header -->
        <asp:Panel ID="Panel1" runat="server">
        <div class="row">

        <div class="col-sm-6">

          <div class="portlet">

            <div class="portlet-header">

              <h3>
                <i class="fa fa-tasks"></i>
               Edit Profile
              </h3>

            </div> <!-- /.portlet-header -->

            <div class="portlet-content">

             <%-- <form id="validate-enhanced" action="./form-validation.html" >--%>
              <div class="form parsley-form">
              
                  <asp:Panel ID="Panel2" runat="server">
<div class="form-group">
                  <label for="name">Name</label>
                   <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                  <asp:TextBox ID="txtname" runat="server" class="form-control parsley-validated" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Your Name" ControlToValidate="txtname" Display="None"
                                                ValidationGroup="ab"></asp:RequiredFieldValidator>

    <br />
                </div>
                <div class="form-group">
                  <label for="name">Mobile No</label>
                  <asp:TextBox ID="txtmobile" runat="server" class="form-control parsley-validated" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None"
                                                ErrorMessage="Enter Mobile No." ControlToValidate="txtmobile" 
                                                ValidationGroup="ab"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ControlToValidate="txtmobile" 
                                                ErrorMessage="Plz Valid Mobile Number" Display="None"
                                                ValidationExpression="^[0-9]{10}$"
                                                ValidationGroup="ab"></asp:RegularExpressionValidator>
                     
                    <asp:LinkButton ID="LinkButton1" ForeColor="Red"  runat="server" 
                        onclick="LinkButton1_Click">Change Number</asp:LinkButton>
                  
                        
                        <br />
                </div>
               
                <div class="form-group">
                  <label for="name">Email Id</label>

                    <asp:TextBox ID="txtemail" runat="server" 
                        class="form-control parsley-validated" ReadOnly="True"
                                                ></asp:TextBox>
                                           
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                        ControlToValidate="txtemail" 
                        ErrorMessage="Enter Email Id" ValidationGroup="ab"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="None"
                                                ControlToValidate="txtemail"  ErrorMessage="Plz Valid Email Id" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="ab"></asp:RegularExpressionValidator>
             <br />
                </div>
                  <div class="form-group">
                  <label for="name">Image</label>
                      
                   <asp:FileUpload ID="FileUpload1" runat="server" class="form-control parsley-validated" onchange="preview()"/>
                      <asp:Image ID="Image1" runat="server" class="form-control parsley-validated" Height="100px" Width="100px" />
                 <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtaddress" Display="None"
                        ErrorMessage="Enter Address" ValidationGroup="ab"></asp:RequiredFieldValidator>--%>
                 <br />
                </div>
                
                   <asp:Button ID="Button4" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" onclick="Button1_Click" ></asp:Button>
                  </asp:Panel>
              
                  <asp:Panel ID="Panel3" Visible="false" runat="server">
                    <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                      <ContentTemplate>--%>
                      
                          <asp:Panel ID="Panel4" runat="server">
                         
                     
                 <br /><br />
                   <asp:Label ID="Label2" runat="server" Text="Verification code will be sent to this number."></asp:Label>
                    <br />
                    <asp:TextBox ID="txtnewnumber" runat="server" placeholder="Enter Mobile No." class="form-control parsley-validated" ></asp:TextBox>
                    <br />
                    <asp:Button ID="Button11" runat="server" Text="Verify" class="button" 
                          onclick="Button11_Click"></asp:Button>
                     <asp:Button ID="Button2" runat="server" Text="Cancel" class="button" 
                          onclick="Button2_Click"></asp:Button>
                    
                         </asp:Panel>
                          <asp:Panel ID="Panel5" Visible="false" runat="server">
                              <br /><br />
                              
                              <asp:TextBox ID="txtverify" runat="server" placeholder="Enter OTP" class="form-control parsley-validated" ></asp:TextBox>
                      <br />
                    <asp:Button ID="Button1" runat="server" Text="Verify" class="button" 
                                  onclick="Button1_Click1"></asp:Button>
                     <asp:Button ID="Button3" runat="server" Text="Cancel" class="button" 
                                  onclick="Button3_Click" ></asp:Button>

                          </asp:Panel>
                    
                    
                    <%--  <asp:UpdateProgress  ID="upprogpnl" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
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
                  </asp:Panel>


              </div>

            </div> <!-- /.portlet-content -->

          </div> <!-- /.portlet -->

        </div> 


       

      </div>
        </asp:Panel>
 


        

    </div> <!-- /.content-container -->
      
  </div> <!-- /.content -->

</div>

    </div>
        <script type="text/javascript">
            function preview() {
                var preview = document.querySelector('#<%=Image1.ClientID %>');
                var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
                var reader = new FileReader();

                reader.onloadend = function () {
                    preview.src = reader.result;
                }

                if (file) {
                    reader.readAsDataURL(file);
                } else {
                    preview.src = "";
                }
            }
    </script> 
            
</asp:Content>

