<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add Area.aspx.cs" Inherits="Admin_Add_Area" %>

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
            <span class="navigation_page">Add Area</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">Add Area</span>
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
            
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" class="form-control " 
                            DataSourceID="SqlDataSource3" DataTextField="City_Name" 
                            DataValueField="Id" ondatabound="DropDownList2_DataBound">
                        </asp:DropDownList>

                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            
                            SelectCommand="SELECT [City_Name], [Id] FROM [Admin_City] WHERE ([State_Id] = @State_Id) ORDER BY [City_Name]">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList1" Name="State_Id" 
                                                        PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                        </asp:SqlDataSource>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="Select City" ControlToValidate="DropDownList2" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>

                                                 <label for="emmail_register">Area</label>
            
                    <asp:TextBox ID="txtarea" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Area" ControlToValidate="txtarea" 
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
                                <asp:BoundField DataField="City_Id" HeaderText="City_Id" 
                                    SortExpression="City_Id" Visible="False" >
                                </asp:BoundField>
                                <asp:BoundField DataField="State_Id" HeaderText="State_Id" 
                                    SortExpression="State_Id" Visible="False" />
                                <asp:BoundField DataField="Area_Name" HeaderText="Area" 
                                    SortExpression="Area_Name">
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:BoundField>
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
                            DeleteCommand="DELETE FROM [Admin_Area] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Admin_Area] ([City_Id], [State_Id], [Area_Name]) VALUES (@City_Id, @State_Id, @Area_Name)" 
                            SelectCommand="SELECT * FROM [Admin_Area] ORDER BY [Area_Name]" 
                            
                            
                            
                            UpdateCommand="UPDATE [Admin_Area] SET [City_Id] = @City_Id, [State_Id] = @State_Id, [Area_Name] = @Area_Name WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="City_Id" Type="String" />
                                <asp:Parameter Name="State_Id" Type="String" />
                                <asp:Parameter Name="Area_Name" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="City_Id" Type="String" />
                                <asp:Parameter Name="State_Id" Type="String" />
                                <asp:Parameter Name="Area_Name" Type="String" />
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


