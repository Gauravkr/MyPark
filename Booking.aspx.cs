using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
public partial class Booking : System.Web.UI.Page
{

    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    string ss, xxx, sss, sssss;
    double days;
    protected void Page_Load(object sender, EventArgs e)
    {
        getCurrentDate11();
        lblcode.Text = Session["booked"].ToString();
        Label2.Text = Session["Registration_Id"].ToString();
        Bind();
        ramdoom();

    }

    private void Bind()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM Admin_Rent_Space WHERE Parking_Id=@Parking_Id", sconn);
        cmd3.Parameters.AddWithValue("@Parking_Id", lblcode.Text);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        DataTable dt3 = new DataTable();
        dt3.Load(dr3);
        if (dt3.Rows.Count > 0)
        {

            Label1.Text = dt3.Rows[0]["Parking_Name"].ToString();
        }
    }
    public string getCurrentDate11()
    {
        DateTime dt = System.DateTime.Now;
        sss = dt.Day.ToString() + "/" + dt.Month.ToString() + "/" + dt.Year.ToString();
        //TextBox1.Text = sss;
       // TextBox2.Text = sss;
        return sss;
    }

    protected void DropDownList3_DataBound(object sender, EventArgs e)
    {
        DropDownList3.Items.Insert(0, "--Select Vehical Type--");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        txtcname.Text = null;
        txtmodel.Text = null;
        txtname.Text = null;
    }
    protected void DropDownList4_DataBound(object sender, EventArgs e)
    {
        DropDownList4.Items.Insert(0, "--Select Vehical Type--");
    }

    protected void DropDownList5_DataBound(object sender, EventArgs e)
    {
        DropDownList5.Items.Insert(0, "--Select vehical Name--");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        getCurrentDate11();
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd3 = new SqlCommand("Insert Into Admin_Add_Vehical(Vehical_type,Vehical_type_Id,Vehical_Name,Model_Number,Companey_Name,Default_Date,Register_Id)values(@Vehical_type,@Vehical_type_Id,@Vehical_Name,@Model_Number,@Companey_Name,@Default_Date,@Register_Id)", sconn);
        cmd3.Parameters.AddWithValue("@Vehical_type",DropDownList4.SelectedItem.ToString());
        cmd3.Parameters.AddWithValue("@Vehical_type_Id",DropDownList4.SelectedValue.ToString());
        cmd3.Parameters.AddWithValue("@Vehical_Name", txtname.Text);
        cmd3.Parameters.AddWithValue("@Model_Number",txtmodel.Text);
        cmd3.Parameters.AddWithValue("@Companey_Name",txtcname.Text);
        cmd3.Parameters.AddWithValue("@Default_Date",getCurrentDate11());
        cmd3.Parameters.AddWithValue("@Register_Id", Label2.Text);
        cmd3.ExecuteNonQuery();

        ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Add Vehical successfully');", true);
        DropDownList5.DataBind();
        Panel1.Visible = false;
        txtcname.Text = null;
        txtmodel.Text = null;
        txtname.Text = null;

    }

    public void ramdoom()
    {
        var chars = "0123456789";
        var stringChars = new char[9];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];

        }

        var finalString = new String(stringChars);

        Label5.Text = finalString.ToString();
    }
    public void pri()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM Admin_Parking_Rate WHERE Pcode=@Pcode AND Vehical_Type_Id=@Vehical_Type_Id ", sconn);
        cmd3.Parameters.AddWithValue("@Pcode", lblcode.Text);
        cmd3.Parameters.AddWithValue("@Vehical_Type_Id", Label7.Text);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        DataTable dt3 = new DataTable();
        dt3.Load(dr3);
        if (dt3.Rows.Count > 0)
        {
            Label8.Text = dt3.Rows[0]["Rate"].ToString();
            Panel2.Visible = true;
            Panel1.Visible = false;

            int abd = int.Parse(Label8.Text) * int.Parse(Label10.Text);

            Label6.Text = abd.ToString();
            Session["price"] = Label6.Text;
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        getCurrentDate11();
        ramdoom();
        SqlCommand cmd3 = new SqlCommand("Insert Into Admin_Booking_Parking(booking_Id,From_Date,From_Time,To_Date,To_Time,Vehical_Type_Id,Vehical_Type_Name,Vehical_name,Vehical_Name_Id,Purpose,Register_Id,Default_Date,Parking_Id)values(@booking_Id,@From_Date,@From_Time,@To_Date,@To_Time,@Vehical_Type_Id,@Vehical_Type_Name,@Vehical_name,@Vehical_Name_Id,@Purpose,@Register_Id,@Default_Date,@Parking_Id)", sconn);
        cmd3.Parameters.AddWithValue("@From_Date",TextBox1.Text);
        cmd3.Parameters.AddWithValue("@From_Time",DropDownList2.SelectedItem.ToString());
        cmd3.Parameters.AddWithValue("@To_Date",TextBox2.Text);
        cmd3.Parameters.AddWithValue("@To_Time",DropDownList6.SelectedItem.ToString());
        cmd3.Parameters.AddWithValue("@Vehical_Type_Id", DropDownList3.SelectedValue.ToString());
        cmd3.Parameters.AddWithValue("@Vehical_Type_Name",DropDownList3.SelectedItem.ToString());
        cmd3.Parameters.AddWithValue("@Vehical_name", DropDownList5.SelectedItem.ToString());
        cmd3.Parameters.AddWithValue("@Vehical_Name_Id", DropDownList5.SelectedValue.ToString());
        cmd3.Parameters.AddWithValue("@Purpose", TextBox6.Text);
        cmd3.Parameters.AddWithValue("@Register_Id", Label2.Text);
        cmd3.Parameters.AddWithValue("@Default_Date",getCurrentDate11());
        cmd3.Parameters.AddWithValue("@Parking_Id",lblcode.Text );
        cmd3.Parameters.AddWithValue("@booking_Id", Label5.Text);
        cmd3.ExecuteNonQuery();

        //ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Parking Booked');", true);

        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox6.Text = "";
     
       
        Session["bookid"] = Label5.Text;
        Session["parkingiiidd"] = lblcode.Text;
        Session["regisss"] = Label2.Text;
        Response.Redirect("Successfully.aspx");
    }
        //DateTime dold = Convert.ToDateTime(TextBox1.Text);
        //DateTime dnew = Convert.ToDateTime(TextBox2.Text);
        //TimeSpan daydif = (dnew - dold);
        //double dayd = daydif.TotalDays;
        //Label3.Text = dayd.ToString(); 
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label7.Text = DropDownList3.SelectedValue.ToString();

        pri();
       

    }
    

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        string startdate = TextBox1.Text;
        string enddate = TextBox2.Text;


        DateTime date1 = Convert.ToDateTime(startdate);

        DateTime date2 = Convert.ToDateTime(enddate);
        if (date1 < date2)
        {
            TimeSpan ts = date2 - date1;
            Label10.Text = ts.TotalDays.ToString();
            pri();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Starting Date is bigger than ending date');", true);
        }
    }

    
}
