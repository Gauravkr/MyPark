using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Expire"] != "0")
            {
                if (Session["user"] != "" || Session["user"] != null)
                {
                    Label2.Text = Session["user"].ToString();
                    Label3.Text = Session["Registration_Id"].ToString();
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }
            else
            {
               // ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Your Subscription Pack Is Expired..Please Renew Your pack')", true);
                //Response.Redirect("Default.aspx");
            }
        }
        catch
        {
           // Response.Redirect("../Default.aspx");
        }

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Parking_Spaces.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("../Default.aspx");
    }
}
