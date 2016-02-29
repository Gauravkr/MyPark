using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

public partial class Details : System.Web.UI.Page
{
    SqlConnection abc = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    string codeee, sss;
    protected void Page_Load(object sender, EventArgs e)
    {
        getCurrentDate11();
        try
        {
            if (Request.QueryString["Code"] == "")
            {
                // Response.Redirect("product_List.aspx");
            }
            else
            {
                codeee = Request.QueryString["Code"].ToString();
                Label12.Text =Request.QueryString["Code"].ToString();
                try
                {

                    if (!IsPostBack)
                    {
                        data();
                        Pan();
                        Bind1();
                        // Bind();
                    }
                }
                catch
                {
                    Response.Redirect("http://unitechitsolution.in/");
                }
            }
        }
        catch
        {
            Response.Redirect("Default.aspx");
        }
        Session["coded"] = codeee;
        Session["search"] = "details";
    }

    private void Pan()
    {
        if (abc.State == ConnectionState.Open)
        {
            abc.Close();
        }
        abc.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT COUNT(Id)  FROM Admin_parking_Image Where Parking_Id=@Parking_Id", abc);
        cmd3.Parameters.AddWithValue("@Parking_Id", codeee);
        SqlDataAdapter dr22 = new SqlDataAdapter(cmd3);
        DataTable dt22 = new DataTable();
        dr22.Fill(dt22);
        //  lblmore.Text = dt22.Rows[0][0].ToString();
        string abcddd = dt22.Rows[0][0].ToString();
        if (abcddd == "0")
        {
            Panel2.Visible = false;
        }
        
    }
    public string ConvertDataTabletoString()
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select title=Parking_Name,lat=lat,lng=longt,Parking_Name from Admin_Rent_Space WHERE Parking_Id=@Parking_Id", con))
            {
                cmd.Parameters.AddWithValue("@Parking_Id", codeee);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row;
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
                return serializer.Serialize(rows);
            }
        }
    }
    private void data()
    {
        if (abc.State == ConnectionState.Open)
        {
            abc.Close();
        }
        abc.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM Admin_Rent_Space WHERE Parking_Id=@Parking_Id", abc);
        cmd3.Parameters.AddWithValue("@Parking_Id", codeee);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        DataTable dt3 = new DataTable();
        dt3.Load(dr3);
        if (dt3.Rows.Count > 0)
        {
            Label14.Text = dt3.Rows[0]["City_Id"].ToString();
            Label1.Text = dt3.Rows[0]["Parking_Name"].ToString();
            Label16.Text = dt3.Rows[0]["Parking_Name"].ToString();
            Label2.Text = dt3.Rows[0]["Parking_Name"].ToString();
            Label3.Text = dt3.Rows[0]["Property_Name"].ToString();
            Label4.Text = dt3.Rows[0]["Discription"].ToString();
            Label5.Text = dt3.Rows[0]["Facilities"].ToString();
            Label9.Text = dt3.Rows[0]["Parking_Size"].ToString();
            Label11.Text = dt3.Rows[0]["Address"].ToString();
            Label15.Text = dt3.Rows[0]["Uniq_Id"].ToString();
            // Label13.Text = dt3.Rows[0]["Available_Space"].ToString();
            Bind();

        }
    }

    private void Bind()
    {
        if (abc.State == ConnectionState.Open)
        {
            abc.Close();
        }
        abc.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT TOP(5) *  FROM Admin_Rent_Space WHERE City_Id=@City_Id And Approved=1", abc);
        cmd3.Parameters.AddWithValue("@City_Id", Label14.Text);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        DataTable dt3 = new DataTable();
        dt3.Load(dr3);
        if (dt3.Rows.Count > 0)
        {
            DataList1.DataSource = dt3;
            DataList1.DataBind();
        }
    }

      private void Bind1()
    {
        if (abc.State == ConnectionState.Open)
        {
            abc.Close();
        }
        abc.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT TOP(4) *  FROM Admin_parking_Image Where Parking_Id=@Parking_Id", abc);
        cmd3.Parameters.AddWithValue("@Parking_Id", codeee);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        DataTable dt3 = new DataTable();
        dt3.Load(dr3);
        if (dt3.Rows.Count > 0)
        {
            Repeater1.DataSource = dt3;
            Repeater1.DataBind();
        }
    }
 
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    public string getCurrentDate11()
    {
        DateTime dt = System.DateTime.Now;
        sss = dt.Day.ToString() + "-" + dt.Month.ToString() + "-" + dt.Year.ToString();

        return sss;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (abc.State == ConnectionState.Open)
        {
            abc.Close();
        }
        abc.Open();

        SqlCommand cmd = new SqlCommand("insert into Admin_Asq_Question(Full_Name,Mobile_Number,Email_Id,Message,Merchant_Id,Default_Date) values (@Full_Name,@Mobile_Number,@Email_Id,@Message,@Merchant_Id,@Default_Date)", abc);

        cmd.Parameters.AddWithValue("@Full_Name", txtname.Text);

        cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile.Text);
        cmd.Parameters.AddWithValue("@Email_Id", txtemail.Text);
        cmd.Parameters.AddWithValue("@Message", txtmessage.Text);
        cmd.Parameters.AddWithValue("@Merchant_Id", Label15.Text);
        cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());
        cmd.ExecuteNonQuery();

        txtname.Text = "";
        txtemail.Text = "";
        txtmessage.Text = "";
        ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Your message was sent successfully');", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["user"] != "" || Session["user"] != null)
            {
                string xxx = Session["user"].ToString();
                Session["booked"] = Label12.Text;
                Response.Redirect("Booking.aspx");
            }
            else
            {
                Session["booked"] = Label12.Text;
                string aaa = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("Login.aspx?Code=" + codeee + "");
              

            }
        }
        catch
        {
            Session["booked"] = Label12.Text;
            string aaa = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect("Login.aspx?Code=" + codeee + "");
        }
    }
}
