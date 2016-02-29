<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add_Vehical_Type.aspx.cs" Inherits="Admin_Add_Vehical_Type" %>

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
            <span class="navigation_page">Vehical Type</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2"> Add Vehical type</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">Vehical type Name</label>
            
                    <asp:TextBox ID="txtcategory" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Category" ControlToValidate="txtcategory" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                       
                      <asp:Button ID="Button2" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" onclick="Button2_Click"  ></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="ab" 
                            runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Vehical type</label>
            
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" 
                            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Font-Bold="True" ForeColor="#3333FF" Text="Edit"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Font-Bold="True" ForeColor="Red" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="padd" />
                                    <FooterStyle CssClass="padd" Wrap="False" />
                                    <HeaderStyle CssClass="padd" Wrap="False" />
                                    <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="Vehical_Type" HeaderText="Vehical Type" 
                                    SortExpression="Vehical_Type" >
                                <ControlStyle CssClass="padd" />
                                <FooterStyle CssClass="padd" Wrap="False" />
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:BoundField>
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
                            DeleteCommand="DELETE FROM [Add_Vehical_Type] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Add_Vehical_Type] ([Vehical_Type]) VALUES (@Vehical_Type)" 
                            SelectCommand="SELECT * FROM [Add_Vehical_Type]" 
                            UpdateCommand="UPDATE [Add_Vehical_Type] SET [Vehical_Type] = @Vehical_Type WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Vehical_Type" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Vehical_Type" Type="String" />
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


