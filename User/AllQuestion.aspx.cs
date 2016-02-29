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
using System.Collections;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

public partial class Merchant_AllQuestion : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Expire"] != "0")
            {
                if (Session["user"] != "" || Session["user"] != null || Session["Expire"] != "0")
                {
                    merchantid.Text = Session["Registration_Id"].ToString();


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
}