<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Add_Property_Type.aspx.cs" Inherits="Admin_Add_Property_Type" %>

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
            <span class="navigation_page">Add Type of Property</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">Add Type of  Property</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">Property Type</label>
            
                    <asp:TextBox ID="txtspace" runat="server" class="form-control " ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="Enter Space" ControlToValidate="txtspace" 
                                                ValidationGroup="ab" Display="None"></asp:RequiredFieldValidator>


                       
                      <asp:Button ID="Button2" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" onclick="Button2_Click"  ></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="ab" 
                            runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Property</label>
            
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
                                <asp:BoundField DataField="Proparty" HeaderText="Proparty" 
                                    SortExpression="Proparty" >
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
                            DeleteCommand="DELETE FROM [Admin_Proprty] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Admin_Proprty] ([Proparty]) VALUES (@Proparty)" 
                            SelectCommand="SELECT * FROM [Admin_Proprty]" 
                            UpdateCommand="UPDATE [Admin_Proprty] SET [Proparty] = @Proparty WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Proparty" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Proparty" Type="String" />
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

