using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class A_SVMerchant_Change_password : System.Web.UI.Page
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
                    string abcd = Session["user"].ToString();
                    string abc = Session["Email_Id"].ToString();

                }
                else
                {
                    Response.Redirect("../Login.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Your Subscription Pack Is Expired..Please Renew Your pack')", true);
            }
        }
        catch
        {
            Response.Redirect("../Login.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        abc = Session["Email_Id"].ToString();
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT * FROM  Admin_Login Where Email_Id=@Email_Id AND Password=@Password", sconn);
        cmd3.Parameters.AddWithValue("Email_Id", abc);
        cmd3.Parameters.AddWithValue("Password", txtoldpass.Text);
        SqlDataAdapter dr3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        dr3.Fill(dt3);
        if (dt3.Rows.Count == 1)
        {
            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();
            SqlCommand cmd = new SqlCommand("update Admin_Login Set Password=@Password Where Email_Id='" + abc + "'", sconn);
            cmd.Parameters.AddWithValue("Password", txtnewpass.Text);
            cmd.ExecuteNonQuery();
            txtnewpass.Text = "";
            txtoldpass.Text = "";
            txtconform_password.Text = "";

            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Password Change Successfully ');", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Current Password Is Incorrect');", true);

        }
    }
}