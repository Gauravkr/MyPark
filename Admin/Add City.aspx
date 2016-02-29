<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add City.aspx.cs" Inherits="Admin_Add_City" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
    .padd
    {
        padding:07px;
    }
</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Add City</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">Add City</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">State</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" class="form-control " 
                            DataSourceID="SqlDataSource2" DataTextField="State_Name" 
                            DataValueField="Id" ondatabound="DropDownList1_DataBound">
                        </asp:DropDownList>

                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            SelectCommand="SELECT * FROM [Admin_State] ORDER BY [State_Name]">
                        </asp:SqlDataSource>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ErrorMessage="Select State" ControlToValidate="DropDownList1" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                        <label for="emmail_register">City</label>
            
                    <asp:TextBox ID="txtcity" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter City" ControlToValidate="txtcity" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                       
                      <asp:Button ID="Button2" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" onclick="Button2_Click" ></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="ab" 
                            runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All City</label>
            
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                            CellPadding="4" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" 
                            ForeColor="Black">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:CommandField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="City_Name" HeaderText="City" 
                                    SortExpression="City_Name" >
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="State_Id" HeaderText="State_Id" 
                                    SortExpression="State_Id" Visible="False" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            DeleteCommand="DELETE FROM [Admin_City] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Admin_City] ([City_Name], [State_Id]) VALUES (@City_Name, @State_Id)" 
                            SelectCommand="SELECT * FROM [Admin_City] ORDER BY [City_Name]" 
                            
                            
                            UpdateCommand="UPDATE [Admin_City] SET [City_Name] = @City_Name, [State_Id] = @State_Id WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="City_Name" Type="String" />
                                <asp:Parameter Name="State_Id" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="City_Name" Type="String" />
                                <asp:Parameter Name="State_Id" Type="String" />
                                <asp:Parameter Name="Id" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

