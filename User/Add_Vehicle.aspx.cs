using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Add_Vehicle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Expire"] != "0")
            {
                //   string abc = Session["Registration_Id"].ToString();
               
               
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Your Subscription Pack Is Expired')", true);
            }
        }
        catch
        {
            Response.Redirect("../Default.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Button2.Visible = false;
    }
}