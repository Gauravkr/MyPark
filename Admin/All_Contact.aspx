<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="All_Contact.aspx.cs" Inherits="Admin_All_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">All Contact</span><asp:Label ID="Label1" Visible="false"  runat="server"
                Text="Label"></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">All Contact</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
          
                <div class="col-sm-12">
                    <div class="box-authentication">
                   
                       
                        <label for="emmail_register">All Contact</label>
                        <div style="overflow-x:scroll; width:1200x;">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" 
                                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Font-Bold="True" ForeColor="Blue" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" Font-Bold="True" ForeColor="Red" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ControlStyle CssClass="pad" />
                                        <FooterStyle CssClass="pad" Wrap="False" />
                                        <HeaderStyle CssClass="pad" Wrap="False" />
                                        <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="Id" Visible="False" />
                                    <asp:BoundField DataField="Username" HeaderText="Name" 
                                        SortExpression="Username" >
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mobile_No" HeaderText="Mobile Number" 
                                        SortExpression="Mobile_No" >
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Message" HeaderText="Message" 
                                        SortExpression="Message" >
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
                                DeleteCommand="DELETE FROM [Admin_Contact] WHERE [Id] = @Id" 
                                InsertCommand="INSERT INTO [Admin_Contact] ([Username], [Email], [Mobile_No], [Message], [Default_Date]) VALUES (@Username, @Email, @Mobile_No, @Message, @Default_Date)" 
                                SelectCommand="SELECT * FROM [Admin_Contact]" 
                                UpdateCommand="UPDATE [Admin_Contact] SET [Username] = @Username, [Email] = @Email, [Mobile_No] = @Mobile_No, [Message] = @Message, [Default_Date] = @Default_Date WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int64" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Username" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Mobile_No" Type="String" />
                                    <asp:Parameter Name="Message" Type="String" />
                                    <asp:Parameter Name="Default_Date" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Username" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Mobile_No" Type="String" />
                                    <asp:Parameter Name="Message" Type="String" />
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
</div>
<%--<asp:UpdateProgress  ID="upprogpnl" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
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
</asp:Content>


