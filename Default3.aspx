<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


           
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                From_Date:
                <asp:Label ID="From_DateLabel" runat="server" Text='<%# Eval("From_Date") %>' />
                <br />
                From_Time:
                <asp:Label ID="From_TimeLabel" runat="server" Text='<%# Eval("From_Time") %>' />
                <br />
                To_Date:
                <asp:Label ID="To_DateLabel" runat="server" Text='<%# Eval("To_Date") %>' />
                <br />
                To_Time:
                <asp:Label ID="To_TimeLabel" runat="server" Text='<%# Eval("To_Time") %>' />
                <br />
                Vehical_Type_Name:
                <asp:Label ID="Vehical_Type_NameLabel" runat="server" 
                    Text='<%# Eval("Vehical_Type_Name") %>' />
                <br />
                Vehical_name:
                <asp:Label ID="Vehical_nameLabel" runat="server" 
                    Text='<%# Eval("Vehical_name") %>' />
                <br />
                Purpose:
                <asp:Label ID="PurposeLabel" runat="server" Text='<%# Eval("Purpose") %>' />
                <br />
                Parking_Id:
                <asp:Label ID="Parking_IdLabel" runat="server" 
                    Text='<%# Eval("Parking_Id") %>' />
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                <br />
                Parking_Name:
                <asp:Label ID="Parking_NameLabel" runat="server" 
                    Text='<%# Eval("Parking_Name") %>' />
                <br />
                Mobile_Number:
                <asp:Label ID="Mobile_NumberLabel" runat="server" 
                    Text='<%# Eval("Mobile_Number") %>' />
                <br />
                Email_Id:
                <asp:Label ID="Email_IdLabel" runat="server" Text='<%# Eval("Email_Id") %>' />
                <br />
                Username:
                <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:admin %>" 
            SelectCommand="SELECT Admin_Booking_Parking.From_Date, Admin_Booking_Parking.From_Time, Admin_Booking_Parking.To_Date, Admin_Booking_Parking.To_Time, Admin_Booking_Parking.Vehical_Type_Name, Admin_Booking_Parking.Vehical_name, Admin_Booking_Parking.Purpose, Admin_Booking_Parking.Parking_Id, Admin_Rent_Space.Address, Admin_Rent_Space.Parking_Name, Admin_Login.Mobile_Number, Admin_Login.Email_Id, Admin_Login.Username FROM Admin_Login RIGHT OUTER JOIN Admin_Rent_Space ON Admin_Login.Registration_Id = Admin_Rent_Space.Uniq_Id RIGHT OUTER JOIN Admin_Booking_Parking ON Admin_Rent_Space.Parking_Id = Admin_Booking_Parking.Parking_Id Where Status=0">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
