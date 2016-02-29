<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Parking_Spaces.aspx.cs" Inherits="User_Parking_Spaces" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    function preview() {
        var preview = document.querySelector('#<%=Image1.ClientID %>');
        var file = document.querySelector('#<%=FileUpload2.ClientID %>').files[0];
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
<style>
.pad
{
    padding:7px;
}

</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page" >Rent Parking Space</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
                <asp:Label ID="Label3" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h3 >
            
            <div style="display=inline-block";>
                <asp:Button ID="Button3" runat="server" 
                    style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;"  
                    Text="Add Space" onclick="Button3_Click" />

                    <asp:Button ID="Button1" runat="server" 
                    style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;"   
                    Text="Parking Image" onclick="Button1_Click" />
				
                 <asp:Button ID="Button4" runat="server" 
                    style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;"   
                    Text="All Space" onclick="Button4_Click" />
				 
            
               
   </div>
   
        </h3>
        <asp:Label ID="Label4" Visible="false" runat="server" Text=""></asp:Label>
        <asp:Panel ID="Panel1" runat="server">
       

        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">

                       <label for="emmail_register">Lock Up Your Location</label><br />
                        <asp:LinkButton ID="LinkButton3" PostBackUrl="~/Admin/ParkingMyLockup.aspx" 
                            runat="server" Font-Bold="True" ForeColor="#00CC99">Lockup Now</asp:LinkButton>

                        <br />  <br />


                    <label for="emmail_register">Parking Name</label>
                        <asp:TextBox ID="TextBox1" placeholder="Name to identify your spaces. Example:CarParkSpace1" runat="server" class="form-control " ></asp:TextBox>
                   
                       <label for="emmail_register">Type&nbsp; of space</label>
            
                   
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="SqlDataSource1" class="form-control "  DataTextField="Space" 
                            DataValueField="Id" ondatabound="DropDownList3_DataBound">
                        </asp:DropDownList>                    

                       
                       
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            SelectCommand="SELECT * FROM [Admin_Space]"></asp:SqlDataSource>

                       
                       <label for="emmail_register">Type of property</label>
            
                   
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                          class="form-control " DataSourceID="SqlDataSource4" DataTextField="Proparty" 
                            DataValueField="Id" ondatabound="DropDownList4_DataBound" 
                            onselectedindexchanged="DropDownList4_SelectedIndexChanged"  >
                        </asp:DropDownList>                    

                   
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            SelectCommand="SELECT * FROM [Admin_Proprty]"></asp:SqlDataSource>

                      

                       
                       
                        <label for="emmail_register">State</label>
                                        <asp:TextBox ID="txtstate" class="form-control" runat="server"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ErrorMessage="Enter State" ControlToValidate="txtstate" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>

                                            


                        <label for="emmail_register">City</label>
            
                                       <asp:TextBox ID="txtcity" class="form-control" runat="server"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Enter City" ControlToValidate="txtcity" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>

                       <label for="emmail_register">Area</label>
                        <asp:TextBox ID="txtarea" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Area" ControlToValidate="txtarea" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>

                            <label for="emmail_register">Address</label>
                        <asp:TextBox ID="txtaddress" runat="server" class="form-control " Rows="2" 
                            TextMode="MultiLine"></asp:TextBox>



                                                 <label for="emmail_register">Postal Code</label>
                        <asp:TextBox ID="txtpostalcode" runat="server" placeholder="Example: 000000" class="form-control "></asp:TextBox>

                        
                              
                        
                                  <label for="emmail_register">Facilities</label>
                                <cc1:Editor ID="Editor2" runat="server" />

                    </div>
                </div>
                   <div class="col-sm-6">
                    <div class="box-authentication">
                                      <label for="emmail_register">Available Space</label>
                        <asp:TextBox ID="txtavailablespace" placeholder="Example: 100" runat="server" class="form-control "></asp:TextBox>

                        
                                                <label for="emmail_register">Parking Size</label>
                        <asp:TextBox ID="txtparkingsize" placeholder="Example: 12345 sqft" runat="server" class="form-control "></asp:TextBox>

                           <label for="emmail_register"> Document Parking</label>
                        <asp:FileUpload ID="FileUpload1" class="form-control " runat="server" />



                        
                                                <label for="emmail_register">Discription</label>
                        <cc1:Editor ID="Editor1" runat="server" />
                       
                      <asp:Button ID="Button2" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" onclick="Button2_Click" style="width: 38%;" ></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="ab" 
                            runat="server" ShowMessageBox="True" ShowSummary="False" />

                    </div>
                    </div> 

                
            </div>
        </div>
         </asp:Panel>
         <asp:Panel ID="Panel2" Visible="false" runat="server">


         <div class="page-content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="box-authentication">
                    <label for="emmail_register">All space</label>
                        
                   <div style="overflow-x:scroll; width:1200x;">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" 
                            DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" 
                            ondatabound="GridView1_DataBound" onrowcommand="GridView1_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Editss" CommandArgument='<%# Bind("Id") %>' Text="Edit" Font-Bold="True" ForeColor="#3333FF"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                            CommandName="Delete"  OnClientClick="if ( !confirm('Are you sure you want to delete?')) return false;" Text="Delete" Font-Bold="True" ForeColor="Red"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="Parking_Name" HeaderText="Parking Name" 
                                    SortExpression="Parking_Name" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Space_Type_Id" HeaderText="Space_Type_Id" 
                                    SortExpression="Space_Type_Id" Visible="False" />
                                <asp:BoundField DataField="Space_Type_Name" HeaderText="Space Type" 
                                    SortExpression="Space_Type_Name" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Property_Id" HeaderText="Property_Id" 
                                    SortExpression="Property_Id" Visible="False" />
                                <asp:BoundField DataField="Property_Name" HeaderText="Property Name" 
                                    SortExpression="Property_Name" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="State_Id" HeaderText="State_Id" 
                                    SortExpression="State_Id" Visible="False" />
                                <asp:BoundField DataField="State_Name" HeaderText="State " 
                                    SortExpression="State_Name" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="City_Id" HeaderText="City_Id" 
                                    SortExpression="City_Id" Visible="False" />
                                <asp:BoundField DataField="City_Name" HeaderText="City " 
                                    SortExpression="City_Name" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Area_Id" HeaderText="Area_Id" 
                                    SortExpression="Area_Id" Visible="False" />
                                <asp:BoundField DataField="Area_Name" HeaderText="Area" 
                                    SortExpression="Area_Name" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Postal_Code" HeaderText="Postal Code" 
                                    SortExpression="Postal_Code" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Available_Space" HeaderText=" Available Space" 
                                    SortExpression="Available_Space" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Parking_Size" HeaderText="Parking Size" 
                                    SortExpression="Parking_Size" >
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
                                <asp:BoundField DataField="Approved" HeaderText="Approved" 
                                    SortExpression="Approved" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Default_Date" HeaderText="Date" 
                                    SortExpression="Default_Date" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address" 
                                    SortExpression="Address" >
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
                        
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            DeleteCommand="DELETE FROM [Admin_Rent_Space] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Admin_Rent_Space] ([Space_Type_Id], [Space_Type_Name], [Property_Id], [Property_Name], [State_Id], [State_Name], [City_Id], [City_Name], [Area_Id], [Area_Name], [Postal_Code], [Available_Space], [Parking_Size], [Attachment], [Facilities], [Discription], [Uniq_Id], [Approved], [Default_Date], [Address], [Parking_Name], [Parking_Id]) VALUES (@Space_Type_Id, @Space_Type_Name, @Property_Id, @Property_Name, @State_Id, @State_Name, @City_Id, @City_Name, @Area_Id, @Area_Name, @Postal_Code, @Available_Space, @Parking_Size, @Attachment, @Facilities, @Discription, @Uniq_Id, @Approved, @Default_Date, @Address, @Parking_Name, @Parking_Id)" 
                            SelectCommand="SELECT * FROM [Admin_Rent_Space] WHERE ([Uniq_Id] = @Uniq_Id)" 
                            UpdateCommand="UPDATE [Admin_Rent_Space] SET [Space_Type_Id] = @Space_Type_Id, [Space_Type_Name] = @Space_Type_Name, [Property_Id] = @Property_Id, [Property_Name] = @Property_Name, [State_Id] = @State_Id, [State_Name] = @State_Name, [City_Id] = @City_Id, [City_Name] = @City_Name, [Area_Id] = @Area_Id, [Area_Name] = @Area_Name, [Postal_Code] = @Postal_Code, [Available_Space] = @Available_Space, [Parking_Size] = @Parking_Size, [Attachment] = @Attachment, [Facilities] = @Facilities, [Discription] = @Discription, [Uniq_Id] = @Uniq_Id, [Approved] = @Approved, [Default_Date] = @Default_Date, [Address] = @Address, [Parking_Name] = @Parking_Name, [Parking_Id] = @Parking_Id WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Space_Type_Id" Type="Int64" />
                                <asp:Parameter Name="Space_Type_Name" Type="String" />
                                <asp:Parameter Name="Property_Id" Type="Int64" />
                                <asp:Parameter Name="Property_Name" Type="String" />
                                <asp:Parameter Name="State_Id" Type="Int64" />
                                <asp:Parameter Name="State_Name" Type="String" />
                                <asp:Parameter Name="City_Id" Type="Int64" />
                                <asp:Parameter Name="City_Name" Type="String" />
                                <asp:Parameter Name="Area_Id" Type="Int64" />
                                <asp:Parameter Name="Area_Name" Type="String" />
                                <asp:Parameter Name="Postal_Code" Type="String" />
                                <asp:Parameter Name="Available_Space" Type="String" />
                                <asp:Parameter Name="Parking_Size" Type="String" />
                                <asp:Parameter Name="Attachment" Type="String" />
                                <asp:Parameter Name="Facilities" Type="String" />
                                <asp:Parameter Name="Discription" Type="String" />
                                <asp:Parameter Name="Uniq_Id" Type="String" />
                                <asp:Parameter Name="Approved" Type="Int64" />
                                <asp:Parameter Name="Default_Date" Type="String" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="Parking_Name" Type="String" />
                                <asp:Parameter Name="Parking_Id" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label3" Name="Uniq_Id" PropertyName="Text" 
                                    Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Space_Type_Id" Type="Int64" />
                                <asp:Parameter Name="Space_Type_Name" Type="String" />
                                <asp:Parameter Name="Property_Id" Type="Int64" />
                                <asp:Parameter Name="Property_Name" Type="String" />
                                <asp:Parameter Name="State_Id" Type="Int64" />
                                <asp:Parameter Name="State_Name" Type="String" />
                                <asp:Parameter Name="City_Id" Type="Int64" />
                                <asp:Parameter Name="City_Name" Type="String" />
                                <asp:Parameter Name="Area_Id" Type="Int64" />
                                <asp:Parameter Name="Area_Name" Type="String" />
                                <asp:Parameter Name="Postal_Code" Type="String" />
                                <asp:Parameter Name="Available_Space" Type="String" />
                                <asp:Parameter Name="Parking_Size" Type="String" />
                                <asp:Parameter Name="Attachment" Type="String" />
                                <asp:Parameter Name="Facilities" Type="String" />
                                <asp:Parameter Name="Discription" Type="String" />
                                <asp:Parameter Name="Uniq_Id" Type="String" />
                                <asp:Parameter Name="Approved" Type="Int64" />
                                <asp:Parameter Name="Default_Date" Type="String" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="Parking_Name" Type="String" />
                                <asp:Parameter Name="Parking_Id" Type="String" />
                                <asp:Parameter Name="Id" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                   

                
            </div>
        </div>
          </asp:Panel>

             <asp:Panel ID="Panel3"  Visible="false" runat="server">
       
       
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">

                       


                        <asp:Label ID="Label5" runat="server" Visible="false"  Text=""></asp:Label>
                   
                       <label for="emmail_register">Parking Name</label>
            
                   
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource222" class="form-control "  DataTextField="Parking_Name" 
                            DataValueField="Parking_Id" ondatabound="DropDownList1_DataBound" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                            AutoPostBack="True" >
                        </asp:DropDownList>                    

                       
                       
                                              
<asp:SqlDataSource ID="SqlDataSource222" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            
                            SelectCommand="SELECT [Parking_Name], [Parking_Id] FROM [Admin_Rent_Space] WHERE ([Uniq_Id] = @Uniq_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label3" DefaultValue="" Name="Uniq_Id" 
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label2" runat="server" Visible="false"  Text=""></asp:Label>
                       
                       <label for="emmail_register">Parking Image</label>
                        <asp:FileUpload ID="FileUpload2" onchange="preview()" class="form-control" runat="server" />
                   
                       <br />

                        <asp:Image ID="Image1" Height="100" Width="100" runat="server" />

                       
                       
                        &nbsp;<br />

                                       <br />
                                     <asp:Button ID="Button5" runat="server" 
                    style="font-size: larger;color: white;border-radius: 0px;padding: 7px;background-color: #00d999;"  
                    Text="Submit" onclick="Button5_Click"  />


                    </div>
                </div>
                   <div class="col-sm-6">
                    <div class="box-authentication">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" 
                            BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
                            DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="Black" 
                            
                            onrowdatabound="GridView2_RowDataBound" 
                            onrowcommand="GridView2_RowCommand1">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Edits" CommandArgument ='<%# Bind("Id") %>' Text="Edit"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                            CommandName="Delete"  OnClientClick="if ( !confirm('Are you sure you want to delete?')) return false;" CommandArgument ='<%# Bind("Id") %>'  Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:TemplateField HeaderText="Image" SortExpression="Image">
                                    <ItemTemplate>
                                       
                                        <asp:Image ID="Image2" Height="100" Width="100" ImageUrl='<%# Bind("Image") %>' runat="server" />
                                    </ItemTemplate>
                                   
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Parking_Id" HeaderText="Parking_Id" 
                                    SortExpression="Parking_Id" Visible="False" />
                                <asp:BoundField DataField="Parking_Name" HeaderText="Parking_Name" 
                                    SortExpression="Parking_Name" Visible="False" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>              

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            DeleteCommand="DELETE FROM [Admin_parking_Image] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Admin_parking_Image] ([Image], [Parking_Id], [Parking_Name]) VALUES (@Image, @Parking_Id, @Parking_Name)" 
                            SelectCommand="SELECT * FROM [Admin_parking_Image] WHERE ([Parking_Id] = @Parking_Id)" 
                            UpdateCommand="UPDATE [Admin_parking_Image] SET [Image] = @Image, [Parking_Id] = @Parking_Id, [Parking_Name] = @Parking_Name WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Image" Type="String" />
                                <asp:Parameter Name="Parking_Id" Type="String" />
                                <asp:Parameter Name="Parking_Name" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="Parking_Id" PropertyName="Text" 
                                    Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Image" Type="String" />
                                <asp:Parameter Name="Parking_Id" Type="String" />
                                <asp:Parameter Name="Parking_Name" Type="String" />
                                <asp:Parameter Name="Id" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                    </div>
                    </div> 

                
            </div>
        </div>
              </asp:Panel>
    </div>
</div>

</asp:Content>


