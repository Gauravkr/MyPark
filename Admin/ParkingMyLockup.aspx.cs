using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ParkingMyLockup : System.Web.UI.Page
{
    string ss, xxx, sss;
    int idd;
    string abbb;
    string area, city, state, country;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

       
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
       
    }
    protected void jack(object sender, EventArgs e)
    {
        string input = txtSearch.Text;

        string[] data = txtSearch.Text.Split(',');
        if (data.Length == 4)
        {
            area = data[0];
            city = data[1];
            state = data[2];
            country = data[3];
            Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            Session["lat"] = txtLat.Text.Trim();
            Session["long"] = txtLng.Text.Trim();
            Panel1.Visible = true;
            Button1.Visible = false;
        }
        else if (data.Length == 5)
        {
            area = data[1];
            city = data[2];
            state = data[3];
            country = data[4];
            Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            Session["lat"] = txtLat.Text.Trim();
            Session["long"] = txtLng.Text.Trim();
            Panel1.Visible = true;
            Button1.Visible = false;
        }
        else if (data.Length == 6)
        {
            area = data[2];
            city = data[3];
            state = data[4];
            country = data[5];
            Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            Session["lat"] = txtLat.Text.Trim();
            Session["long"] = txtLng.Text.Trim();
            Panel1.Visible = true;
            Button1.Visible = false;
        }
        else
        {
            Panel1.Visible = false;
            Button1.Visible = true;
        }
    }
   
}