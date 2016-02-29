<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Successfully.aspx.cs" Inherits="Successfully" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Label ID="Label1" Visible ="false"  runat="server"  Text=""></asp:Label>
    <asp:Label ID="Label2" Visible="false"  runat="server"  Text=""></asp:Label>
      <asp:Label ID="Label3" Visible="false"  runat="server"  Text=""></asp:Label>
       <asp:Label ID="Label5" Visible="false"  runat="server"  Text=""></asp:Label>
   
 <section id="about">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <!-- Start welcome area -->
          <div class="welcome-area">
            <div class="title-area">
              <h2 class="tittle"> <span>Successfully Book Parking</span></h2>
              <span class="tittle-line"></span>
              <p>Parking My is  pre-bookable parking. The idea is brutally simple: we connect drivers in search of parking with anyone who has a space going spare, whether in a car park, private driveway, church, school, or pub.</p>
            </div>
            <div class="welcome-content">
              <ul class="wc-table">
              

              <asp:Label ID="Label4" Visible="false" runat="server" Text=""></asp:Label>
                    <asp:Label ID="txtname1" Visible="false" runat="server" Text=""></asp:Label>
                     <asp:Label ID="txtname" Visible="false" runat="server" Text=""></asp:Label>
                       <asp:Label ID="txtfromdate" Visible="false" runat="server" Text=""></asp:Label>
                     <asp:Label ID="txttodate" Visible="false" runat="server" Text=""></asp:Label>
                      <asp:Label ID="txtvehicalname" Visible="false" runat="server" Text=""></asp:Label>
                      <asp:Label ID="txttype" Visible="false" runat="server" Text=""></asp:Label>
                       <asp:Label ID="txtpname" Visible="false" runat="server" Text=""></asp:Label>
                        <asp:Label ID="txtaddress" Visible="false" runat="server" Text=""></asp:Label>
                        <asp:Label ID="txtmobile2" Visible="false" runat="server" Text=""></asp:Label>
                         <asp:Label ID="txtmodelname" Visible="false" runat="server" Text=""></asp:Label>
                  
              </ul>
            </div>
          </div>
          <!-- End welcome area -->
        </div>
      </div>
      
    </div>
  </section> 
</asp:Content>


