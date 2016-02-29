using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Rent_booking_History : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Expire"] != "0")
            {

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Your Subscription Pack Is Expired..Please Renew Your pack')", true);
            }
        }
        catch
        {
            Response.Redirect("../Default.aspx");
        }
    }
}