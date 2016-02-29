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

public partial class Contact_Us : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    string sss;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string getCurrentDate11()
    {
        DateTime dt = System.DateTime.Now;
        sss = dt.Day.ToString() + "-" + dt.Month.ToString() + "-" + dt.Year.ToString();

        return sss;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();

        SqlCommand cmd = new SqlCommand("insert into Admin_Contact(Default_Date,Username,Mobile_No,Email,Message) values (@Default_Date,@Username,@Mobile_No,@Email,@Message)", sconn);

        cmd.Parameters.AddWithValue("@Username", txtusername.Text);
        cmd.Parameters.AddWithValue("@Mobile_No", txtmob.Text);
        cmd.Parameters.AddWithValue("@Email", txtema.Text);
        cmd.Parameters.AddWithValue("@Message", txtmsg.Text);
        cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());

        cmd.ExecuteNonQuery();
        ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Send Message')", true);

        sconn.Close();
    }
}