<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="AllQuestion.aspx.cs" Inherits="Merchant_AllQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.padd
{
    padding:7px;
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
            <span class="navigation_page">All Ask Question</span><asp:Label ID="merchantid"  Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">all Ask Question</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-12">
                    <div class="box-authentication">
                  
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                            DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                            GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="padd" />
                                    <FooterStyle CssClass="padd" Wrap="False" />
                                    <HeaderStyle CssClass="padd" Wrap="False" />
                                    <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="Full_Name" HeaderText="Name" 
                                    SortExpression="Full_Name" >
                                <ControlStyle CssClass="padd" />
                                <FooterStyle CssClass="padd" Wrap="False" />
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Mobile_Number" HeaderText="Mobile Number" 
                                    SortExpression="Mobile_Number" >
                                <ControlStyle CssClass="padd" />
                                <FooterStyle CssClass="padd" Wrap="False" />
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email_Id" HeaderText="Email" 
                                    SortExpression="Email_Id" >
                                <ControlStyle CssClass="padd" />
                                <FooterStyle CssClass="padd" Wrap="False" />
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Message" HeaderText="Message" 
                                    SortExpression="Message" >
                                <ControlStyle CssClass="padd" />
                                <FooterStyle CssClass="padd" Wrap="False" />
                                <HeaderStyle CssClass="padd" Wrap="False" />
                                <ItemStyle CssClass="padd" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Merchant_Id" HeaderText="Merchant_Id" 
                                    SortExpression="Merchant_Id" Visible="False" />
                                <asp:BoundField DataField="Default_Date" HeaderText="Date" 
                                    SortExpression="Default_Date" >
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
                            DeleteCommand="DELETE FROM [Admin_Asq_Question] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Admin_Asq_Question] ([Full_Name], [Mobile_Number], [Email_Id], [Message], [Merchant_Id], [Default_Date]) VALUES (@Full_Name, @Mobile_Number, @Email_Id, @Message, @Merchant_Id, @Default_Date)" 
                            SelectCommand="SELECT * FROM [Admin_Asq_Question] WHERE ([Merchant_Id] = @Merchant_Id) ORDER BY [Default_Date] DESC" 
                            UpdateCommand="UPDATE [Admin_Asq_Question] SET [Full_Name] = @Full_Name, [Mobile_Number] = @Mobile_Number, [Email_Id] = @Email_Id, [Message] = @Message, [Merchant_Id] = @Merchant_Id, [Default_Date] = @Default_Date WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Full_Name" Type="String" />
                                <asp:Parameter Name="Mobile_Number" Type="String" />
                                <asp:Parameter Name="Email_Id" Type="String" />
                                <asp:Parameter Name="Message" Type="String" />
                                <asp:Parameter Name="Merchant_Id" Type="String" />
                                <asp:Parameter Name="Default_Date" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="merchantid" Name="Merchant_Id" 
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Full_Name" Type="String" />
                                <asp:Parameter Name="Mobile_Number" Type="String" />
                                <asp:Parameter Name="Email_Id" Type="String" />
                                <asp:Parameter Name="Message" Type="String" />
                                <asp:Parameter Name="Merchant_Id" Type="String" />
                                <asp:Parameter Name="Default_Date" Type="String" />
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

