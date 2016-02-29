<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="All_Parking_Space.aspx.cs" Inherits="Admin_All_Parking_Space" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    .pad
    {
        padding:07px;
    }
</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">All Parking</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">All Parking</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
          
                <div class="col-sm-12">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Parking Space</label>
                        <div style="overflow-x:scroll; width:1200x;">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" 
                                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                                onrowcommand="GridView1_RowCommand">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Approve / Not Approve">
                                      
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="app" CommandArgument='<%# Bind("Id") %>' Font-Bold="True" 
                                                ForeColor="Blue">Approve</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" 
                                                ForeColor="Red" CommandName="Not" CommandArgument='<%# Bind("Id") %>' >Not Approve</asp:LinkButton>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="pad" />
                                        <FooterStyle CssClass="pad" Wrap="False" />
                                        <HeaderStyle CssClass="pad" Wrap="False" />
                                        <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Parking_Name" HeaderText="Parking Name" 
                                        SortExpression="Parking_Name">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Approved" HeaderText="Approved" 
                                        SortExpression="Approved">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Username" HeaderText="User name" 
                                        SortExpression="Username">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email_Id" HeaderText="Email Id" 
                                        SortExpression="Email_Id">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="Id" Visible="False" />
                                    <asp:BoundField DataField="Space_Type_Id" HeaderText="Space_Type_Id" 
                                        SortExpression="Space_Type_Id" Visible="False" />
                                    <asp:BoundField DataField="Space_Type_Name" HeaderText="Space Type" 
                                        SortExpression="Space_Type_Name">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Property_Id" HeaderText="Property_Id" 
                                        SortExpression="Property_Id" Visible="False" />
                                    <asp:BoundField DataField="Property_Name" HeaderText="Property Name" 
                                        SortExpression="Property_Name">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="State_Id" HeaderText="State_Id" 
                                        SortExpression="State_Id" Visible="False" />
                                    <asp:BoundField DataField="State_Name" HeaderText="State " 
                                        SortExpression="State_Name">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="City_Id" HeaderText="City_Id" 
                                        SortExpression="City_Id" Visible="False" />
                                    <asp:BoundField DataField="City_Name" HeaderText="City" 
                                        SortExpression="City_Name">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Area_Id" HeaderText="Area_Id" 
                                        SortExpression="Area_Id" Visible="False" />
                                    <asp:BoundField DataField="Area_Name" HeaderText="Area" 
                                        SortExpression="Area_Name">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Postal_Code" HeaderText="Postal Code" 
                                        SortExpression="Postal_Code">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Available_Space" HeaderText="Available Space" 
                                        SortExpression="Available_Space">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Parking_Size" HeaderText="Parking Size" 
                                        SortExpression="Parking_Size">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Attachment" SortExpression="Attachment">
                                       
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Bind("Attachment") %>' runat="server">Download</asp:HyperLink>
                                            
                                        </ItemTemplate>
                                        <ControlStyle CssClass="pad" />
                                        <FooterStyle CssClass="pad" Wrap="False" />
                                        <HeaderStyle CssClass="pad" Wrap="False" />
                                        <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Facilities" HeaderText="Facilities" 
                                        SortExpression="Facilities" Visible="False" />
                                    <asp:BoundField DataField="Discription" HeaderText="Discription" 
                                        SortExpression="Discription" Visible="False" />
                                    <asp:BoundField DataField="Uniq_Id" HeaderText="Uniq_Id" 
                                        SortExpression="Uniq_Id" Visible="False" />
                                    <asp:BoundField DataField="Default_Date" HeaderText="Date" 
                                        SortExpression="Default_Date">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Address" HeaderText="Address" 
                                        SortExpression="Address">
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Parking_Id" HeaderText="Parking_Id" 
                                        SortExpression="Parking_Id" Visible="False" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:admin %>" 
                                SelectCommand="SELECT Admin_Rent_Space.*, Admin_Login.Username, Admin_Login.Email_Id FROM Admin_Rent_Space LEFT OUTER JOIN Admin_Login ON Admin_Rent_Space.Uniq_Id = Admin_Login.Registration_Id ORDER BY [Id] DESC">
                            </asp:SqlDataSource>
                        </div>
                        
                    </div>
                </div>
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

</asp:Content>

