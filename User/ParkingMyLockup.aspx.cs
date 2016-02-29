using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Script.Serialization;
using System.IO;

public partial class User_ParkingMyLockup : System.Web.UI.Page
{
    string ss, xxx, sss;
    int idd;
    string abbb;
    string area, city, state, country;
    string abcd;
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
        if (data.Length == 3)
        {
            city = data[0];
            state = data[1];
            country = data[2];
            //  Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            abbb = city + ", " + state + ", " + country;
            Session["abbb"] = abbb;
        }
        else if (data.Length == 4)
        {
            city = data[1];
            state = data[2];
            country = data[3];
          //  Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            abbb = city + ", " + state + ", " + country;
            Session["abbb"] = abbb;
        }
        else if (data.Length == 5)
        {
            city = data[2];
            state = data[3];
            country = data[4];
          //  Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            abbb = city + ", " + state + ", " + country;
            Session["abbb"] = abbb;
        }
        else if (data.Length == 6)
        {
            city = data[3];
            state = data[4];
            country = data[5];
           // Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            abbb = city + ", " + state + ", " + country;
            Session["abbb"] = abbb;
        }
        else if (data.Length == 7)
        {
            city = data[4];
            state = data[5];
            country = data[6];
            // Session["areaa"] = area.Trim();
            Session["cityy"] = city.Trim();
            Session["statee"] = state.Trim();
            Session["countyrr"] = country.Trim();
            abbb = city + ", " + state + ", " + country;
            Session["abbb"] = abbb;
        }
        else
        {

        }
        mk();

        Session["areaa"] = txtSearch.Text;
        Session["lat"] = txtLat.Text.Trim();
        Session["long"] = txtLng.Text.Trim();
        Button1.Visible = false;
        Panel1.Visible = true;
    }
    private void mk()
    {
        string abcd = Session["abbb"].ToString();

        var request = WebRequest.Create("https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + abcd + "&destinations=" + txtSearch.Text + "");
        // Indicate you are looking for a JSON response
        request.ContentType = "application/json; charset=utf-8";
        var response = (HttpWebResponse)request.GetResponse();

        // Read through the response
        using (var sr = new StreamReader(response.GetResponseStream()))
        {
            // Define a serializer to read your response
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            // Get your results
            dynamic result = serializer.DeserializeObject(sr.ReadToEnd());

            // Read the distance property from the JSON request
            var distance = result["rows"][0]["elements"][0]["distance"]["text"]; // yields "1,300 KM" 
            var duration = result["rows"][0]["elements"][0]["duration"]["text"];
            string output = distance.Replace("km", " ");
            lblduratio.Text = duration;
            lbldistant.Text = output;
            Session["km"] = lbldistant.Text;
            Session["time"] = lblduratio.Text;         
        }
    }
}