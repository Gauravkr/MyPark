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

public partial class Login : System.Web.UI.Page
{
    
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    string ss, xxx, sss;
    string aaa2;
    string abbb;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (Request.QueryString["Code"] != "")
            {
                Label2.Text = Request.QueryString["Code"].ToString();
                aaa2 = Label2.Text;
            }
        }
        catch
        {

        }
        generate();
        getCurrentDate();
        getCurrentDate11();
        //try
        //{
        //    if (Session["user"] != "" || Session["user"] != null)
        //    {

        //        xxx = Session["user"].ToString();
        //        if (Profile.SCart.Items.Count > 0)
        //        {
        //            Response.Redirect("Checkout.aspx");
        //        }
        //        else
        //        {
        //            Response.Redirect("User/");
        //        }
        //    }
        //}
        //catch
        //{
        //}
    }
    public string getCurrentDate11()
    {
        DateTime dt = System.DateTime.Now;
        sss = dt.Day.ToString() + "-" + dt.Month.ToString() + "-" + dt.Year.ToString();

        return sss;
    }
    public string getCurrentDate()
    {
        DateTime dt = System.DateTime.Now;
        ss = "U" + dt.Day.ToString() + "" + dt.Month.ToString() + "" + dt.Year.ToString() + "" + dt.Millisecond.ToString();

        return ss;
    }

   
    void generate()
    {
        var chars = "0123456789";
        var stringChars = new char[8];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];

        }

        var finalString = new String(stringChars);

        abbb = finalString.ToString();

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();


        SqlCommand cmd1 = new SqlCommand("Select * from Admin_Login where Email_Id='" + txtemail.Text + "'", sconn);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Email ID Is Already Registered')", true);

        }
        else
        {
            generate2();
            string abbbb = abbb;
            lblfirstverification.Text = abbb;

            string url = null;
            string Response_f = null;
            string strmsg1 = null;

            Session["pass"] = txtuserpass.Text;
            // strmsg1 = " " + finalString + " .";

            url = "http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=" + txtmobile.Text + "&sid=PARKMY&msg=Thank you for registration in ParkingMy.com. Your verification code is " + abbbb + "&fl=0&gwid=2";

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
            Panel2.Visible = true;
            Panel1.Visible = false;
        }
    }

    void generate2()
    {
        var chars = "0123456789";
        var stringChars = new char[4];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];

        }

        var finalString = new String(stringChars);

        abbb = finalString.ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand abc = new SqlCommand("select * from Admin_Login where Email_Id=@Email_Id and Password=@Password", sconn);
        abc.Parameters.AddWithValue("@Email_Id", txtusername.Text);
        abc.Parameters.AddWithValue("@Password", txtpass.Text);
        SqlDataAdapter da = new SqlDataAdapter(abc);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 1)
        {
            string ab = dt.Rows[0]["Role_Id"].ToString();
            string approve = dt.Rows[0]["Approve"].ToString();


            Session["name"] = dt.Rows[0]["Username"].ToString();
            Session["Mobile_Number"] = dt.Rows[0]["Mobile_Number"].ToString();
            Session["Registration_Id"] = dt.Rows[0]["Registration_Id"].ToString();
            Session["Pic"] = dt.Rows[0]["Profile_Pic"].ToString();
            if (ab == "2")
            {

                Session["user"] = dt.Rows[0]["Username"].ToString();
                Session["Email_Id"] = txtusername.Text;
                Session["role"] = ab.ToString();
                Session["Registration_Id"] = dt.Rows[0]["Registration_Id"].ToString();
                if (aaa2 == "" || aaa2 == null)
                {
                    Response.Redirect("User/Default.aspx");
                }
                else
                {
                    Response.Redirect("Booking.aspx");
                }
            }
            else if (ab == "1")
                {
                    Session["Admin"] = dt.Rows[0]["Username"].ToString();
                    Session["Email_Id"] = txtusername.Text;
                    Session["Registration_Id"] = dt.Rows[0]["Registration_Id"].ToString();
                    Response.Redirect("Admin/");

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Email Id or Password Incorrect');", true);
                }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Email Id or Password Incorrect');", true);
        }

        sconn.Close();
    }


    protected void Button5_Clickfirstverify(object sender, EventArgs e)
    {
        if (lblfirstverification.Text == txtfiratverification.Text)
        {
            generate();
            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();

            SqlCommand cmd = new SqlCommand("insert into Admin_Login(Defoult_Date,Registration_Id,Username,Password,Mobile_Number,Email_Id,Role_Id,Approve,Profile_Pic) values (@Defoult_Date,@Registration_Id,@Username,@Password,@Mobile_Number,@Email_Id,@Role_Id,@Approve,@Profile_Pic)", sconn);

            cmd.Parameters.AddWithValue("@Username", txtname.Text);
            cmd.Parameters.AddWithValue("@Password", Session["pass"].ToString());
            cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile.Text);
            cmd.Parameters.AddWithValue("@Email_Id", txtemail.Text);
            cmd.Parameters.AddWithValue("@Role_Id", "2");
            cmd.Parameters.AddWithValue("@Approve", "1");
            cmd.Parameters.AddWithValue("@Registration_Id", "U" + abbb);
            cmd.Parameters.AddWithValue("@Defoult_Date", getCurrentDate11());
            cmd.Parameters.AddWithValue("@Profile_Pic", "../Gallery/jackk.png");

            Session["Registration_Id"] = "U" + abbb;
            Session["user"] = txtname.Text;
            Session["Mobile_Number"] = txtmobile.Text;
            Session["Email_Id"] = txtemail.Text;


            cmd.ExecuteNonQuery();


            string abbbb = "U" + abbb;

            string url = null;
            string Response_f = null;
            string strmsg1 = null;

            // strmsg1 = " " + finalString + " .";

            url = "http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=" + txtmobile.Text + "&sid=PARKMY&msg=Welcome to ParkingMy Family. Now you can park your vehicle anywhere anytime and rent your parking area. Your user code is " + abbbb + "&fl=0&gwid=2";

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
            MailMessage mm = new MailMessage("info@parkingmy.com", "" + txtemail.Text + "");
            mm.Subject = "ParkingMy.com:: Welcome To ParkingMy.com ";
            mm.Body = "<html><body> <table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + txtname.Text + "</i>,<br><br>                  </b>                </td>              </tr>              <tr>                <td height='8' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Welcome to the ParkingMy Family. We are delighted to have you as a Member                  and hope this relationship will be mutually beneficial.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Please find in this email your login credentials for our User panel.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>                  Login: " + txtemail.Text + "                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>Password: " + Session["pass"].ToString() + "                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>            <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We endeavour to keep our processes as transparent as possible and are constantly                  adding new features to our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  For added convenience and better transparency, we kindly request you                  to submit all your profile and parking details only through our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We have assigned a dedicated account manager to serve your account and GALIB GAURAV is your point of contact.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9902738900 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table>  </body></html>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            smtp.Send(mm);
            Response.Redirect("User/Default.aspx");

            sconn.Close();
        }
    }
    protected void Button5_Clickfirstcancel(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
}
