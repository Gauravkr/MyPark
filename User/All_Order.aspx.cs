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
using System.Web.Services;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
public partial class Admin_All_Order : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["Expire"] != "0")
            {
                if (Session["user"] != "" || Session["user"] != null || Session["Expire"] != "0")
                {

                    Label3.Text = Session["Registration_Id"].ToString();
                }
                else
                {

                    Response.Redirect("../Default.aspx");
                }

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
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        DataList1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
        Repeater1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = true;
        Repeater2.DataBind();
    }
    protected void DataList1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Can")
        {
            {
                if (cn.State == ConnectionState.Open)
                {
                    cn.Close();
                }
                cn.Open();
                string cded = e.CommandArgument.ToString();
                SqlCommand cmd1 = new SqlCommand("Select * from Admin_Booking_Parking where Id='" + cded + "'", cn);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count == 1)
                {
                    SqlCommand cmd2 = new SqlCommand("update Admin_Booking_Parking SET Status=@Status  where Id='" + cded + "'", cn);
                    cmd2.Parameters.AddWithValue("@Status", "2");
                    cmd2.ExecuteNonQuery();
                    DataList1.DataBind();
                }
            }
        }
        else if (e.CommandName == "Con")
        {
            if (cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
            cn.Open();
            string cde = e.CommandArgument.ToString();
            SqlCommand cmd = new SqlCommand("Select * from Admin_Booking_Parking where Id='" + cde + "'", cn);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count == 1)
            {
                SqlCommand cmd2 = new SqlCommand("update Admin_Booking_Parking SET Status=@Status  where Id='" + cde + "'", cn);
                cmd2.Parameters.AddWithValue("@Status", "1");
                cmd2.ExecuteNonQuery();
                DataList1.DataBind();
            }
        }
    }
}