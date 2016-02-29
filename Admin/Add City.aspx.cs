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

public partial class Admin_Add_City : System.Web.UI.Page
{
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (sconn.State == ConnectionState.Open)
        {
            sconn.Close();
        }
        sconn.Open();

        SqlCommand cmd1 = new SqlCommand("Select * from Admin_City where City_Name=@City_Name", sconn);
        cmd1.Parameters.AddWithValue("City_Name", txtcity.Text);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('City Alredy Exit')", true);

        }
        else
        {

            SqlCommand cmd = new SqlCommand("insert into Admin_City(City_Name,State_Id) values(@City_Name,@State_Id)", sconn);
            cmd.Parameters.AddWithValue("@City_Name", txtcity.Text);
            cmd.Parameters.AddWithValue("@State_Id", DropDownList1.SelectedValue.ToString());
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Data Insert')", true);
            txtcity.Text = "";
            GridView1.DataBind();

        }
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, "~~Select State~~");
    }
}