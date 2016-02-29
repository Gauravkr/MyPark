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

public partial class User_Edit_Profile : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    string abc;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        try
        {
            if (Session["Expire"] != "0")
            {
                if (Session["user"] != "" || Session["user"] != null || Session["Expire"] != "0")
                {
                    string abc = Session["Registration_Id"].ToString();
                    Label1.Text = Session["Registration_Id"].ToString();
                    if (!IsPostBack)
                    {
                        //Label1.Text = Session["Registration_Id"].ToString();
                        txtemail.Text = Session["Email_Id"].ToString();
                        calldata();
                        callverify();
                    }
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Your Subscription Pack Is Expired..Please Renew Your pack')", true);
                Response.Redirect("User/Default.aspx");
            }
        }
        catch
        {
            Response.Redirect("../Default.aspx");
        }
    }

    private void callverify()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd1 = new SqlCommand("Select * from Table1 where Registration_Id='" + Label1.Text + "'", sconn);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            string v1 = dt1.Rows[0]["Email_Verify"].ToString();
            string v2 = dt1.Rows[0]["Membership"].ToString();
            string v3 = dt1.Rows[0]["Profile_Pic"].ToString();
            string v4 = dt1.Rows[0]["Mobile_No"].ToString();
            
        }
    }
     
    private void calldata()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd1 = new SqlCommand("Select * from Admin_Login where Registration_Id='" + Label1.Text + "'", sconn);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            txtname.Text = dt1.Rows[0]["Username"].ToString();
            txtmobile.Text = dt1.Rows[0]["Mobile_Number"].ToString();
            txtemail.Text = dt1.Rows[0]["Email_Id"].ToString();
            Image1.ImageUrl = dt1.Rows[0]["Profile_Pic"].ToString();
        }
        else
        {

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string small = "~/Gallery/" + Label1.Text + FileUpload1.FileName;
        FileUpload1.SaveAs(Server.MapPath(small));
        if (FileUpload1.HasFile)
        {
            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();
            abc = Session["Email_Id"].ToString();
            SqlCommand cmd1 = new SqlCommand("Select * from Admin_Login where Registration_Id='" + Label1.Text + "'", sconn);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();
                SqlCommand cmd = new SqlCommand("Update Admin_Login SET Username=@Username,Mobile_Number=@Mobile_Number,Profile_Pic=@Profile_Pic Where Registration_Id='" + Label1.Text + "'", sconn);
                cmd.Parameters.AddWithValue("@Username", txtname.Text);
                cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile.Text);
                cmd.Parameters.AddWithValue("@Profile_Pic", small);
                cmd.ExecuteNonQuery();
              //  dkl();
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Data Updated Successfully');", true);
            }
            else
            {
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();
                SqlCommand cmd = new SqlCommand("Insert INTO Admin_Login (Registration_Id,Username,Mobile_Number,Profile_Pic) Values(@Registration_Id,@Username,@Mobile_Number,@Profile_Pic)", sconn);
                cmd.Parameters.AddWithValue("@Username", txtname.Text);
                cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile.Text);
                cmd.Parameters.AddWithValue("@Registration_Id", Label1.Text);
                cmd.Parameters.AddWithValue("@Profile_Pic", small);
                cmd.ExecuteNonQuery();
              //  dkl();
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Data Updated Successfully');", true);
            }
        }
        else
        {
            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();
            SqlCommand cmd = new SqlCommand("Update Admin_Login SET Username=@Username,Mobile_Number=@Mobile_Number Where Registration_Id='" + Label1.Text + "'", sconn);
            cmd.Parameters.AddWithValue("@Username", txtname.Text);
            cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile.Text);
            //cmd.Parameters.AddWithValue("@Profile_Pic", small);
          //  dkl();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Data Updated Successfully');", true);
        }
        calldata();
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel3.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel3.Visible = false;
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
         var chars = "0123456789";
        var stringChars = new char[4];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];

        }

        var finalString = new String(stringChars);
        Session["finalString"] = finalString;
        string url = null;
        string Response_f = null;
        string strmsg1 = null;

        // strmsg1 = " " + finalString + " .";

        url = "http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=" + txtnewnumber.Text + "&sid=PARKMY&msg=Thank you for registration in ParkingMy.com. Your verification code is " + finalString + "&fl=0&gwid=2";

        try
        {
            System.Net.HttpWebRequest fr = null;
            Uri targetURI = new Uri(url);

            fr = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(targetURI);

            if ((fr.GetResponse().ContentLength > 0))
            {
                System.IO.StreamReader str = new System.IO.StreamReader(fr.GetResponse().GetResponseStream());
                //Response.Write(str.ReadToEnd())
                Response_f = str.ReadToEnd();
                str.Close();
            }

        }
        catch
        {
            //  Response_f = "Registration failed please try again later.";

        }
        Panel4.Visible = false;
        Panel5.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel4.Visible = true;
        Panel5.Visible = false;
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (txtverify.Text == Session["finalString"].ToString())
        {
           
            Panel2.Visible = true;
            Panel3.Visible = false;

            calldata();
            callverify();
            
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Mobile Number Changed Successfully');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Enter Valid OTP');", true);
        }
    }
}