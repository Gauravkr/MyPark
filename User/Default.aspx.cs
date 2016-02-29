using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Sockets;
using System.IO;
using System.Globalization;

public partial class User_Default : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
            subscription();

        //}
        //catch
        //{
        //    if (Session["Expire"] == "0")
        //    {
        //        Response.Redirect("Default.aspx");
        //    }
        //}
    }

    private void subscription()
    {
        //DateTime ada = DateTime.Now.ToUniversalTime();
        //var client = new TcpClient("time.nist.gov", 13);
        //using (var streamReader = new StreamReader(client.GetStream()))
        //{
        //    var response = streamReader.ReadToEnd();
        //    var utcDateTimeString = response.Substring(7, 17);
        //    var localDateTime = DateTime.ParseExact(utcDateTimeString, "yy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal).ToShortDateString();

        //    string dateee = localDateTime;
            DateTime sys = Convert.ToDateTime(System.DateTime.Now.ToShortDateString());

            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT Registration_Id , Defoult_Date FROM Admin_Login", sconn);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                string v1 = dt1.Rows[0]["Defoult_Date"].ToString();

                DateTime day1 = Convert.ToDateTime(v1);
                DateTime day = day1.AddMonths(3);
                DateTime dt = day.AddDays(-2);
                if (sys == dt)
                {
                    Label7.Text = "Your Account will Expire In 2 Days..";
                }

                if (sys < day)
                {
                    if (Session["user"] != "" || Session["user"] != null)
                    {
                        //   string abc = Session["Registration_Id"].ToString();
                       
                        Label4.Text = Session["Registration_Id"].ToString();
                        TimeSpan objTimeSpan = day - sys;
                        double Days = Convert.ToDouble(objTimeSpan.TotalDays);
                        //Label6.Text = "Your Account will Expire In " + Convert.ToString(Days) + " Days..";

                        if (!IsPostBack)
                        {
                            Session["Expire"] = "1";
                            call();
                            callverify();

                            // name = Session["username"].ToString();
                        }
                    }
                    else
                    {

                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                   
                    Label5.Text = "Your Account Is Expired ON " + day.ToString();
                   
                    Session["Expire"] = "0";
                   // ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Your Account Is Expired...Please Renew Your Pack')", true);
                   // Response.Redirect("Default.aspx");
                }
          //  }
        }
    }


    private void callverify()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd1 = new SqlCommand("Select * from Table1 where Registration_Id='" + Label4.Text + "'", sconn);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            string v1 = dt1.Rows[0]["Email_Verify"].ToString();
            string v2 = dt1.Rows[0]["Membership"].ToString();
            string v3 = dt1.Rows[0]["Profile_Pic"].ToString();
            string v4 = dt1.Rows[0]["Mobile_No"].ToString();

            if (v1 == "1")
            {
                r1.Visible = true;
                w1.Visible = false;
            }
            else
            {
                r1.Visible = false;
                w1.Visible = true;
            }
            if (v2 == "1")
            {
                r2.Visible = true;
                w2.Visible = false;
            }
            else
            {
                r2.Visible = false;
                w2.Visible = true;
            }
            if (v3 == "1")
            {
                r3.Visible = true;
                w3.Visible = false;
            }
            else
            {
                r3.Visible = false;
                w3.Visible = true;
            }
            if (v4 == "1")
            {
                r4.Visible = true;
                w4.Visible = false;
            }
            else
            {
                r4.Visible = false;
                w4.Visible = true;
            }
        }
        else
        {
        }
    }

    private void call()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd1 = new SqlCommand("Select * from Admin_Login where Registration_Id='" + Label4.Text + "'", sconn);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            Label1.Text = dt1.Rows[0]["Username"].ToString();
            Label2.Text = dt1.Rows[0]["Mobile_Number"].ToString();
            Label3.Text = dt1.Rows[0]["Email_Id"].ToString();
            lblcode.Text = dt1.Rows[0]["Registration_Id"].ToString();
            Image1.ImageUrl = dt1.Rows[0]["Profile_Pic"].ToString();
        }
        else
        {
            //Label1.Text = dt1.Rows[0]["Username"].ToString();
            //Label2.Text = dt1.Rows[0]["Mobile_No"].ToString();
            //Label3.Text = dt1.Rows[0]["Email_Id"].ToString();
            //Image1.ImageUrl = dt1.Rows[0]["Profile_Pic"].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../User/Edit_Profile.aspx");
    }
}