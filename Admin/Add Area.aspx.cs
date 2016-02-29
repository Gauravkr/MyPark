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

public partial class Admin_Add_Area : System.Web.UI.Page
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

        SqlCommand cmd1 = new SqlCommand("Select * from Admin_Area where Area_Name=@Area_Name", sconn);
        cmd1.Parameters.AddWithValue("Area_Name", txtarea.Text);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        if (dt1.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('City Alredy Exit')", true);

        }
        else
        {

            SqlCommand cmd = new SqlCommand("insert into Admin_Area(City_Id,State_Id,Area_Name)values(@City_Id,@State_Id,@Area_Name)", sconn);
            cmd.Parameters.AddWithValue("@City_Id", DropDownList2.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@State_Id", DropDownList1.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Area_Name", txtarea.Text);
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Data Insert')", true);
            txtarea.Text = "";
            GridView1.DataBind();

        }
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, "~~Select State~~");
    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(0, "~~Select City~~");
    }
}