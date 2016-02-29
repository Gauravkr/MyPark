using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Add_Vehical_Type : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        SqlCommand cmd2 = new SqlCommand("select * from Add_Vehical_Type where Vehical_Type='" + txtcategory.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd2);
        DataSet ds = new DataSet();
        da.Fill(ds, "Add_Vehical_Type");
        if (ds.Tables["Add_Vehical_Type"].Rows.Count > 0)
        {

            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert(' Vehical Type Already Exit ');", true);

        }
        else
        {
            string s = txtcategory.Text;
            s = System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(s.ToLower());
            txtcategory.Text = s.ToString();

            SqlCommand cmd = new SqlCommand("insert into Add_Vehical_Type(Vehical_Type)values(@Vehical_Type)", con);
            cmd.Parameters.AddWithValue("@Vehical_Type", txtcategory.Text);
            cmd.ExecuteNonQuery();
            txtcategory.Text = "";

            ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('  Successfully Insert');", true);
            GridView1.DataBind();
            con.Close();
        }
    }
}

