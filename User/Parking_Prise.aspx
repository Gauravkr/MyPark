<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="Parking_Prise.aspx.cs" Inherits="User_Parking_Prise" %>

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
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="Default.aspx" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Price </span><asp:Label ID="Label1" Visible="false"   runat="server"
                Text=""></asp:Label>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">Add Parking Price</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">
                        <asp:Panel ID="Panel1" runat="server">
                                 <label for="emmail_register">Parking Name</label>
                            <asp:DropDownList ID="DropDownList1" class="form-control " runat="server" 
                                     AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Parking_Name" 
                                     DataValueField="Parking_Id" ondatabound="DropDownList1_DataBound" 
                                     onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                                 <asp:Label ID="Label4" runat="server" Visible="false"  Text=""></asp:Label>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                     ConnectionString="<%$ ConnectionStrings:admin %>" 
                                     
                                     SelectCommand="SELECT [Parking_Name], [Parking_Id], [Uniq_Id] FROM [Admin_Rent_Space] WHERE ([Uniq_Id] = @Uniq_Id)">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="Label1" Name="Uniq_Id" PropertyName="Text" 
                                             Type="String" />
                                     </SelectParameters>
                                 </asp:SqlDataSource>
                            <label for="emmail_register">Vehical Type</label>
                            <asp:DropDownList ID="DropDownList2" class="form-control " runat="server" 
                                     DataSourceID="SqlDataSource2" DataTextField="Vehical_Type" 
                                     DataValueField="Id" ondatabound="DropDownList2_DataBound">
                            </asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                     ConnectionString="<%$ ConnectionStrings:admin %>" 
                                     SelectCommand="SELECT * FROM [Add_Vehical_Type]"></asp:SqlDataSource>
                            <label for="emmail_register">Time</label>
                            <asp:DropDownList ID="DropDownList3" class="form-control " runat="server" 
                                    >
                                <asp:ListItem Value="0">---Select Hour---</asp:ListItem>
                             <%--   <asp:ListItem Value="1">1 Hours</asp:ListItem>--%>
                                <asp:ListItem Value="2">1 Day</asp:ListItem>
                                <%--  <asp:ListItem Value="3">1 Week</asp:ListItem>
                                   <asp:ListItem Value="4">1 Month</asp:ListItem>--%>
                               
                            </asp:DropDownList>

                         <label for="emmail_register">Rate</label>
            
                    <asp:TextBox ID="Txtrate" runat="server" class="form-control " ></asp:TextBox>
                                            

                       
                      <asp:Button ID="Button2" runat="server" Text="Submit" class="button" 
                                                 ValidationGroup="ab" onclick="Button2_Click"  ></asp:Button>
                        <asp:ValidationSummary ID="ValidationSummary1"  ValidationGroup="ab" 
                            runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </asp:Panel>
                       
                       
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                   
                        <asp:Label ID="Label2" runat="server" Visible="false" Text=""></asp:Label>
                        <label for="emmail_register">Parking Price</label>
            
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="Id" DataSourceID="SqlDataSource3" BackColor="#CCCCCC" Width="100%"
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                            CellSpacing="2" ForeColor="Black" onrowcommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Edits" CommandArgument='<%# Bind("Id") %>' Font-Bold="True" ForeColor="#3333FF" Text="Edit"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                            CommandName="Delete"  OnClientClick="if ( !confirm('Are you sure you want to delete?')) return false;" CommandArgument='<%# Bind("Id") %>' Font-Bold="True" ForeColor="Red" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                               
                                    <ControlStyle CssClass="pad" />
                                    <FooterStyle CssClass="pad" Wrap="False" />
                                    <HeaderStyle CssClass="pad" Wrap="False" />
                                    <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="Pcode" HeaderText="Pcode" SortExpression="Pcode" 
                                    Visible="False" />
                                <asp:BoundField DataField="Rate" HeaderText="Price" SortExpression="Rate" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Vehical_Type_Id" HeaderText="Vehical_Type_Id" 
                                    SortExpression="Vehical_Type_Id" Visible="False" />
                                <asp:BoundField DataField="Vehical_Type_Name" HeaderText="Vehical Type" 
                                    SortExpression="Vehical_Type_Name" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" 
                                    SortExpression="Default_Date" Visible="False" />
                                <asp:BoundField DataField="Time" HeaderText="Day" SortExpression="Time" >
                                <ControlStyle CssClass="pad" />
                                <FooterStyle CssClass="pad" Wrap="False" />
                                <HeaderStyle CssClass="pad" Wrap="False" />
                                <ItemStyle CssClass="pad" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Time_id" HeaderText="Time_id" 
                                    SortExpression="Time_id" Visible="False" />
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:admin %>" 
                            DeleteCommand="DELETE FROM [Admin_Parking_Rate] WHERE [Id] = @Id" 
                            InsertCommand="INSERT INTO [Admin_Parking_Rate] ([Pcode], [Rate], [Vehical_Type_Id], [Vehical_Type_Name], [Default_Date], [Time], [Time_id]) VALUES (@Pcode, @Rate, @Vehical_Type_Id, @Vehical_Type_Name, @Default_Date, @Time, @Time_id)" 
                            SelectCommand="SELECT * FROM [Admin_Parking_Rate] WHERE ([Pcode] = @Pcode)" 
                            UpdateCommand="UPDATE [Admin_Parking_Rate] SET [Pcode] = @Pcode, [Rate] = @Rate, [Vehical_Type_Id] = @Vehical_Type_Id, [Vehical_Type_Name] = @Vehical_Type_Name, [Default_Date] = @Default_Date, [Time] = @Time, [Time_id] = @Time_id WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Pcode" Type="String" />
                                <asp:Parameter Name="Rate" Type="Decimal" />
                                <asp:Parameter Name="Vehical_Type_Id" Type="Int64" />
                                <asp:Parameter Name="Vehical_Type_Name" Type="String" />
                                <asp:Parameter Name="Default_Date" Type="String" />
                                <asp:Parameter Name="Time" Type="String" />
                                <asp:Parameter Name="Time_id" Type="Int64" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="Pcode" PropertyName="Text" 
                                    Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Pcode" Type="String" />
                                <asp:Parameter Name="Rate" Type="Decimal" />
                                <asp:Parameter Name="Vehical_Type_Id" Type="Int64" />
                                <asp:Parameter Name="Vehical_Type_Name" Type="String" />
                                <asp:Parameter Name="Default_Date" Type="String" />
                                <asp:Parameter Name="Time" Type="String" />
                                <asp:Parameter Name="Time_id" Type="Int64" />
                                <asp:Parameter Name="Id" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
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


