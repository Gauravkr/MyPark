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
using System.Windows.Forms;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    string ss, xxx, sss;
    int idd;
    string abbb;
    string area,city,state,country;
    ArrayList list = new ArrayList();
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        getCurrentDate();
        getCurrentDate11();

      
    }

    protected void mercy(object sender, EventArgs e)
    {
        ModalPopupExtender2.Show();
        
    }
    protected void Button5_Click(object sender, EventArgs e)
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
            Panel12.Visible = false;
            Panel13.Visible = true;


        }
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
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Register')", true);

            sconn.Close();

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

            //   ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Register')", true);

            sconn.Close();

            MailMessage mm = new MailMessage("info@parkingmy.com", "" + txtemail.Text + "");
            mm.Subject = "ParkingMy.com:: Welcome To ParkingMy.com ";
            mm.Body = "<html><body> <table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + txtname.Text + "</i>,<br><br>                  </b>                </td>              </tr>              <tr>                <td height='8' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Welcome to the ParkingMy Family. We are delighted to have you as a Member                  and hope this relationship will be mutually beneficial.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Please find in this email your login credentials for our User panel.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>                  Login: " + txtemail.Text + "                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>Password: " + Session["pass"].ToString() + "                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>            <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We endeavour to keep our processes as transparent as possible and are constantly                  adding new features to our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  For added convenience and better transparency, we kindly request you                  to submit all your profile and parking details only through our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We have assigned a dedicated account manager to serve your account and GALIB GAURAV is your point of contact.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9902738900 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table>  </body></html>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            smtp.Send(mm);



            Response.Redirect("User/Default.aspx");
            txtname.Text = "";
            txtuserpass.Text = "";
            txtcpass.Text = "";
            txtemail.Text = "";
            txtmobile.Text = "";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Entered OTP is incorrect')", true);

        }
    }

    protected void Button5_Clickfirstcancel(object sender, EventArgs e)
    {
        Panel12.Visible = true;
        Panel13.Visible = false;
    }

    
    protected void Button5_Click2(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();


        SqlCommand cmd1 = new SqlCommand("Select * from Admin_Login where Email_Id='" + txtemail2.Text + "'", sconn);
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
            lbllotp.Text = abbb;
          //  txtverification.Text = abbbb;
            string url = null;
            string Response_f = null;
            string strmsg1 = null;

            Session["pass"] = txtuserpass22.Text;
            // strmsg1 = " " + finalString + " .";

            url = "http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=" + txtmobile2.Text + "&sid=PARKMY&msg=Thank you for registration in ParkingMy.com. Your verification code is " + abbbb + "&fl=0&gwid=2";

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
            Panel10.Visible = false;
            Panel11.Visible = true;

        }
    }
    
    protected void Button5_Click222(object sender, EventArgs e)
    {
        Panel10.Visible = true;
        Panel11.Visible = false;
    }

    protected void Button5_Click22(object sender, EventArgs e)
    {
        if (lbllotp.Text == txtverification.Text)
        {
            generate();
            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();

            SqlCommand cmd = new SqlCommand("insert into Admin_Login(Defoult_Date,Registration_Id,Username,Password,Mobile_Number,Email_Id,Role_Id,Approve,Profile_Pic) values (@Defoult_Date,@Registration_Id,@Username,@Password,@Mobile_Number,@Email_Id,@Role_Id,@Approve,@Profile_Pic)", sconn);

            cmd.Parameters.AddWithValue("@Username", txtname2.Text);
            cmd.Parameters.AddWithValue("@Password", Session["pass"].ToString());
            cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile2.Text);
            cmd.Parameters.AddWithValue("@Email_Id", txtemail2.Text);
            cmd.Parameters.AddWithValue("@Role_Id", "2");
            cmd.Parameters.AddWithValue("@Approve", "1");
            cmd.Parameters.AddWithValue("@Registration_Id", "U" + abbb);
            cmd.Parameters.AddWithValue("@Defoult_Date", getCurrentDate11());
            cmd.Parameters.AddWithValue("@Profile_Pic", "../Gallery/jackk.png");
            cmd.ExecuteNonQuery();

            Session["Registration_Id"] = "U" + abbb;
            Session["user"] = txtname2.Text;
            Session["Mobile_Number"] = txtmobile2.Text;
            Session["Email_Id"] = txtemail2.Text;


            string abbbb = "U" + abbb;
            string url = null;
            string Response_f = null;
            string strmsg1 = null;

            // strmsg1 = " " + finalString + " .";

            url = "http://sms.unitechitsolution.in/vendorsms/pushsms.aspx?user=parkingmy&password=parkingmy&msisdn=" + txtmobile2.Text + "&sid=PARKMY&msg=Welcome to ParkingMy Family. Now you can park your vehicle anywhere anytime and rent your parking area. Your user code is " + abbbb + "&fl=0&gwid=2";

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
            
         //   ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Register')", true);

            sconn.Close();

            MailMessage mm = new MailMessage("info@parkingmy.com", "" + txtemail2.Text + "");
            mm.Subject = "ParkingMy.com:: Welcome To ParkingMy.com ";
            mm.Body = "<html><body> <table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + txtname2.Text + "</i>,<br><br>                  </b>                </td>              </tr>              <tr>                <td height='8' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Welcome to the ParkingMy Family. We are delighted to have you as a Member                  and hope this relationship will be mutually beneficial.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Please find in this email your login credentials for our User panel.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>                  Login: " + txtemail2.Text + "                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>Password: " + Session["pass"].ToString() + "                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>            <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We endeavour to keep our processes as transparent as possible and are constantly                  adding new features to our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  For added convenience and better transparency, we kindly request you                  to submit all your profile and parking details only through our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We have assigned a dedicated account manager to serve your account and GALIB GAURAV is your point of contact.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9902738900 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table>  </body></html>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            smtp.Send(mm);
            
            
            txtname2.Text = "";
            txtuserpass22.Text = "";
            txtcpass2.Text = "";
            txtemail2.Text = "";
            txtmobile2.Text = "";
            Response.Redirect("User/Default.aspx");


          
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Entered OTP is incorrect')", true);

        }
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
    protected void Button2_Click(object sender, EventArgs e)
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
            if (ab == "2")
            {

                Session["user"] = dt.Rows[0]["Username"].ToString();
                Session["Email_Id"] = txtusername.Text;
                Session["role"] = ab.ToString();
                Response.Redirect("User/Default.aspx");

            }
            else
                if (ab == "1")
                {
                    Session["Admin"] = dt.Rows[0]["Username"].ToString();
                    Session["Email_Id"] = txtusername.Text;
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
    protected void Button2_Click2(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand abc = new SqlCommand("select * from Admin_Login where Email_Id=@Email_Id and Password=@Password", sconn);
        abc.Parameters.AddWithValue("@Email_Id", txtusername2.Text);
        abc.Parameters.AddWithValue("@Password", txtpass2.Text);
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
            if (ab == "2")
            {

                Session["user"] = dt.Rows[0]["Username"].ToString();
                Session["Email_Id"] = txtusername2.Text;
                Session["role"] = ab.ToString();
                Response.Redirect("User/Default.aspx");

            }
            else
                if (ab == "1")
                {
                    Session["Admin"] = dt.Rows[0]["Username"].ToString();
                    Session["Email_Id"] = txtusername2.Text;
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
    protected void Button6_Click(object sender, EventArgs e)
    {

        Session["pname"] = TextBox1.Text;

        string start = Request.Form["start"].ToString();
        string end = Request.Form["end"].ToString();

        Session["la"] = start.ToString();
        Session["lo"] = end.ToString();
        callarea();
        //string[] data = TextBox1.Text.Split(',');
        //if (data.Length == 4)
        //{
        //    area = data[0];
        //    city = data[1];
        //    state = data[2];
        //    country = data[3];
        //    callarea();
        //}
        //else if (data.Length == 5)
        //{
        //    area = data[1];
        //    city = data[2];
        //    state = data[3];
        //    country = data[4];
        //    callarea();
        //}
        //else if (data.Length == 3)
        //{
        //    city = data[0];
        //    state = data[1];
        //    country = data[2];
        //    callcity();
        //}
        //else if (data.Length == 2)
        //{
        //    state = data[0];
        //    country = data[1];
        //}
        //else if (data.Length == 1)
        //{
        //    country = data[0];
        //    ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Invalid Entered Location')", true);
        //}
        //else
        //{
        //    ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Invalid Entered Location')", true);
        //}
    }

    private void callarea()
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();

       // string remove = area.Trim();
        SqlCommand con = new SqlCommand("SELECT Id,title=Parking_Name,lat=lat,lng=longt,Parking_Name FROM(SELECT *,(((acos(sin((@lat*pi()/180)) * sin((lat*pi()/180))+cos((@lat*pi()/180)) * cos((lat*pi()/180)) * cos(((@longt - longt)*pi()/180))))*180/pi())*60*1.1515*1.609344) as distance FROM Admin_Rent_Space) t WHERE distance <=3", sconn);
        con.Parameters.AddWithValue("@lat", Session["la"].ToString());
        con.Parameters.AddWithValue("@longt", Session["lo"].ToString());
        SqlDataAdapter da = new SqlDataAdapter(con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string isss = dt.Rows[i]["Id"].ToString();
                list.Add(isss);
            }
            Session.Remove("sess");
            Session["sess"] = list;
            Response.Redirect("Default2.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('No parking available in this specific place')", true);
        }

        //if (dt.Rows.Count > 0)
        //{
            

        //    //idd = int.Parse(isss);
        //  //  Session["pid"] = remove;
        //   // Session["pname"] = remove;
        //    Session["search"] = "Area";
        //    Response.Redirect("Default2.aspx");

        //}
        //else
        //{

        //    //string isss = dt.Rows[0]["Id"].ToString();
        //    //idd = int.Parse(isss);
        //  //  Session["pid"] = remove;
        //   // Session["pname"] = remove;
        //    Session["search"] = "Area";
        //    Response.Redirect("Default2.aspx");
        //    ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Invalid Entered Location')", true);
        //}
    }

    //private void callcity()
    //{
    //    if (sconn.State == ConnectionState.Open)
    //    {
    //        sconn.Close();
    //    }
    //    sconn.Open();
    //    string remove = city.Trim();
    //    SqlCommand con = new SqlCommand("select * from Admin_Rent_Space where City_Name=@City_Name", sconn);
    //    con.Parameters.AddWithValue("@City_Name", city);
    //    SqlDataAdapter da = new SqlDataAdapter(con);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);
    //    if (dt.Rows.Count > 0)
    //    {
    //        //string isss = dt.Rows[0]["Id"].ToString();

    //        //idd = int.Parse(isss);
    //        Session["pid"] = city;
    //        Session["pname"] = city;
    //        Session["search"] = "city";
    //        Response.Redirect("Default2.aspx");

    //    }
    //    else
    //    {
    //        //string isss = dt.Rows[0]["Id"].ToString();

    //        //idd = int.Parse(isss);
    //        Session["pid"] = city;
    //        Session["pname"] = city;
    //        Session["search"] = "city";
    //        Response.Redirect("Default2.aspx");
    //       // ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Invalid Entered Location')", true);
    //    }
   // }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();

        SqlCommand cmd = new SqlCommand("insert into Admin_Contact(Default_Date,Username,Mobile_No,Email,Message) values (@Default_Date,@Username,@Mobile_No,@Email,@Message)", sconn);

        cmd.Parameters.AddWithValue("@Username", txtusernam.Text);
        cmd.Parameters.AddWithValue("@Mobile_No", txtmob.Text);
        cmd.Parameters.AddWithValue("@Email", txtema.Text);
        cmd.Parameters.AddWithValue("@Message", txtmsg.Text);
        cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());

        cmd.ExecuteNonQuery();
      



        txtusernam.Text = "";
        txtmob.Text = "";
        txtema.Text = "";
        txtmsg.Text = "";
        ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Send Message')", true);
        sconn.Close();
    }


    protected void jack(object sender, EventArgs e)
    {
        Panel3.Visible = false;
        Panel4.Visible = true;
    }
    protected void jack2(object sender, EventArgs e)
    {
        Panel8.Visible = false;
        Panel9.Visible = true;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand abc = new SqlCommand("select * from Admin_Login where Email_Id=@Email_Id", sconn);
        abc.Parameters.AddWithValue("@Email_Id", TextBox2.Text);
        SqlDataAdapter da = new SqlDataAdapter(abc);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 1)
        {
            string nammee = dt.Rows[0]["Username"].ToString();
            string Password = dt.Rows[0]["Password"].ToString();
            string Email_Id = dt.Rows[0]["Email_Id"].ToString();


            MailMessage mm = new MailMessage("info@parkingmy.com", "" + Email_Id + "");
            mm.Subject = "ParkingMy.com:: Receover Your Password ";
            mm.Body = "<html><body><table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/assets/images/LogoHDSmall%20copy.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + nammee + "</i>,<br><br>                  </b>                </td>              </tr>              <tr>                <td height='8' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Please find your password credentials for our User panel.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>                  Login: " + Email_Id + "                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>Password: " + Password + "                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>            <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We endeavour to keep our processes as transparent as possible and are constantly                  adding new features to our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9902738900 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table></body></html>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            smtp.Send(mm);

            TextBox2.Text = "";
            Label1.Text = "Please check your email account!";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Email Id is Incorrect');", true);
        }
    }
    protected void Button7_Click2(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand abc = new SqlCommand("select * from Admin_Login where Email_Id=@Email_Id", sconn);
        abc.Parameters.AddWithValue("@Email_Id", TextBox3.Text);
        SqlDataAdapter da = new SqlDataAdapter(abc);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 1)
        {
            string nammee = dt.Rows[0]["Username"].ToString();
            string Password = dt.Rows[0]["Password"].ToString();
            string Email_Id = dt.Rows[0]["Email_Id"].ToString();

            MailMessage mm = new MailMessage("info@parkingmy.com", "" + Email_Id + "");
            mm.Subject = "ParkingMy.com:: Receover Your Password ";
            mm.Body = "<html><body><table cellspacing='0' cellpadding='0' width='100%' border='0' bgcolor='#AED66A'>  <tbody>  <tr>    <td height='42'></td>  </tr>  <tr>    <td>      <table cellspacing='0' cellpadding='0' width='600' border='0' bgcolor='#ffffff' align='center'>        <tbody>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        <tr>          <td width='1' bgcolor='#d6d6d6'></td>          <td>            <table cellspacing='0' cellpadding='0' width='598' border='0' align='center'>              <tbody>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='417' colspan='2'></td>                <td width='165' style='text-decoration:none;font-family:Arial,Helvetica,sans-serif;font-size:20px;font-weight:bold;color:#6ac451'>                  <img src='http://parking.unitechitsolution.in/newlogo.png' class='CToWUd'>                </td>                <td width='16'></td>              </tr>              <tr>                <td height='17' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              <tr>                <td height='21' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666' colspan='3'>                  <b>                    Dear <i>" + nammee + "</i>,<br><br>                  </b>                </td>              </tr>              <tr>                <td height='8' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  Please find your password credentials for our User panel.                  <br>                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>                  Login: " + Email_Id + "                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:32px' colspan='3'>Password: " + Password + "                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>            <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We endeavour to keep our processes as transparent as possible and are constantly                  adding new features to our panel.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  He/She can be reached at +91-9902738900 /<a href='mailto:support@parkingmy.com' target='_blank'>support@parkingmy.com<wbr></a>.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>                         <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#666666;line-height:32px' colspan='3'>                  We value your relationship and hope to serve you better.                  <br>                </td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td height='20' colspan='4'></td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;font-weight:bold;color:#000;line-height:24px' colspan='3'>                  Regards,                </td>              </tr>              <tr>                <td width='24'></td>                <td style='font-family:Arial,Helvetica,sans-serif;font-size:14px;color:#000000;line-height:24px' colspan='3'>                  ParkingMy Team                </td>              </tr>              <tr>                <td height='32' colspan='4'></td>              </tr>              <tr>                <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='4'></td>              </tr>              </tbody>            </table>         </td>          <td width='1' bgcolor='#d6d6d6'></td>        </tr>        <tr>          <td height='1' bgcolor='#d6d6d6' style='line-height:1px' colspan='3'></td>        </tr>        </tbody>      </table>    </td>  </tr>  <tr>    <td height='42'></td>  </tr>  </tbody></table></body></html>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
            smtp.Send(mm);

            TextBox3.Text = "";
            Label2.Text = "Please check your email account!";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Email Id is Incorrect');", true);
        }
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Panel4.Visible = false;
        Panel3.Visible = true;
    }
    protected void Button8_Click2(object sender, EventArgs e)
    {
        Panel9.Visible = false;
        Panel8.Visible = true;
    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
       
        Panel6.Visible = false;
        Panel7.Visible = true;
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        Panel6.Visible = true;
        Panel7.Visible = false;
    }
 
}
