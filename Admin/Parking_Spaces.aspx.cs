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

public partial class User_Parking_Spaces : System.Web.UI.Page
{
    string ss, xxx, sss;
    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["admin"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        getCurrentDate11();
        getCurrentDate();
        try
        {
            if (Session["user"] != "" || Session["user"] != null)
            {
                Label3.Text = Session["Registration_Id"].ToString();
            }
            else
            {
                Response.Redirect("../Default.aspx");
            }
        }
        catch
        {
            Response.Redirect("../Default.aspx");
        }

        try
        {
            if (Session["areaa"] != "" || Session["areaa"] != null)
            {
                txtarea.Text = Session["areaa"].ToString();
                txtcity.Text = Session["cityy"].ToString();
                txtstate.Text = Session["statee"].ToString();
            }
            else
            {
               
            }
        }
        catch
        {
            
        }
    }
    public string getCurrentDate11()
    {
        DateTime dt = System.DateTime.Now;
        sss = dt.Day.ToString() + "-" + dt.Month.ToString() + "-" + dt.Year.ToString();

        return sss;
    }
    public string getCurrentDate()
    {
        DateTime dt = System.DateTime.Now;
        ss = "p" + dt.Day.ToString() + "" + dt.Month.ToString() + "" + dt.Year.ToString() + "" + dt.Millisecond.ToString();

        return ss;
    }
    protected void DropDownList3_DataBound(object sender, EventArgs e)
    {
        DropDownList3.Items.Insert(0, "--Select Space  Type--");
    }
    protected void DropDownList4_DataBound(object sender, EventArgs e)
    {
        DropDownList4.Items.Insert(0, "--Select Property Type--");
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {

        if (Label4.Text =="")
        {

            if (FileUpload1.HasFile)
            {

                string abc = "~/Document/" + FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath(abc));
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();

                getCurrentDate();
                getCurrentDate11();
                SqlCommand cmd = new SqlCommand("insert into Admin_Rent_Space(lat,longt,Parking_Id,Parking_Name,Address,Space_Type_Id,Space_Type_Name,Property_Id,Property_Name,State_Id,State_Name,City_Id,City_Name,Area_Id,Area_Name,Postal_Code,Available_Space,Parking_Size,Attachment,Facilities,Discription,Uniq_Id,Default_Date) values(@lat,@longt,@Parking_Id,@Parking_Name,@Address,@Space_Type_Id,@Space_Type_Name,@Property_Id,@Property_Name,@State_Id,@State_Name,@City_Id,@City_Name,@Area_Id,@Area_Name,@Postal_Code,@Available_Space,@Parking_Size,@Attachment,@Facilities,@Discription,@Uniq_Id,@Default_Date)", sconn);
                cmd.Parameters.AddWithValue("@Space_Type_Id", DropDownList3.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Space_Type_Name", DropDownList3.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Property_Id", DropDownList4.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Property_Name", DropDownList4.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@State_Id", "1");
                cmd.Parameters.AddWithValue("@State_Name", txtstate.Text);
                cmd.Parameters.AddWithValue("@City_Id", "1");
                cmd.Parameters.AddWithValue("@City_Name",txtcity.Text);
                cmd.Parameters.AddWithValue("@Area_Id", "1");
                cmd.Parameters.AddWithValue("@Area_Name", txtarea.Text);
                cmd.Parameters.AddWithValue("@Postal_Code", txtpostalcode.Text);
                cmd.Parameters.AddWithValue("@Available_Space", txtavailablespace.Text);
                cmd.Parameters.AddWithValue("@Parking_Size", txtparkingsize.Text);
                cmd.Parameters.AddWithValue("@Attachment", abc);
                cmd.Parameters.AddWithValue("@Facilities", Editor2.Content);
                cmd.Parameters.AddWithValue("@Discription", Editor1.Content);
                cmd.Parameters.AddWithValue("@Uniq_Id", Label3.Text);
                cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@Parking_Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Parking_Id", getCurrentDate());
                cmd.Parameters.AddWithValue("@lat", Session["lat"].ToString());
                cmd.Parameters.AddWithValue("@longt", Session["long"].ToString());

                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Register')", true);
                txtpostalcode.Text = "";
                txtavailablespace.Text = "";
                Editor2.Content = "";
                Editor1.Content = "";
                txtaddress.Text = "";
                txtparkingsize.Text = "";
                getCurrentDate();
                getCurrentDate11();
            }
            else
            {
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();

                getCurrentDate();
                getCurrentDate11();
                SqlCommand cmd = new SqlCommand("insert into Admin_Rent_Space(lat,longt,Parking_Id,Parking_Name,Address,Space_Type_Id,Space_Type_Name,Property_Id,Property_Name,State_Id,State_Name,City_Id,City_Name,Area_Id,Area_Name,Postal_Code,Available_Space,Parking_Size,Facilities,Discription,Uniq_Id,Default_Date) values(@lat,@longt,@Parking_Id,@Parking_Name,@Address,@Space_Type_Id,@Space_Type_Name,@Property_Id,@Property_Name,@State_Id,@State_Name,@City_Id,@City_Name,@Area_Id,@Area_Name,@Postal_Code,@Available_Space,@Parking_Size,@Facilities,@Discription,@Uniq_Id,@Default_Date)", sconn);
                cmd.Parameters.AddWithValue("@Space_Type_Id", DropDownList3.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Space_Type_Name", DropDownList3.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Property_Id", DropDownList4.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Property_Name", DropDownList4.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@State_Id", "1");
                cmd.Parameters.AddWithValue("@State_Name", txtstate.Text);
                cmd.Parameters.AddWithValue("@City_Id", "1");
                cmd.Parameters.AddWithValue("@City_Name", txtcity.Text);
                cmd.Parameters.AddWithValue("@Area_Id", "1");
                cmd.Parameters.AddWithValue("@Area_Name", txtarea.Text);
                cmd.Parameters.AddWithValue("@Postal_Code", txtpostalcode.Text);
                cmd.Parameters.AddWithValue("@Available_Space", txtavailablespace.Text);
                cmd.Parameters.AddWithValue("@Parking_Size", txtparkingsize.Text);
                cmd.Parameters.AddWithValue("@Facilities", Editor2.Content);
                cmd.Parameters.AddWithValue("@Discription", Editor1.Content);
                cmd.Parameters.AddWithValue("@Uniq_Id", Label3.Text);
                cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@Parking_Name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Parking_Id", getCurrentDate());
                cmd.Parameters.AddWithValue("@lat", Session["lat"].ToString());
                cmd.Parameters.AddWithValue("@longt", Session["long"].ToString());
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Register')", true);
                txtpostalcode.Text = "";
                txtavailablespace.Text = "";
                Editor2.Content = "";
                Editor1.Content = "";
                txtaddress.Text = "";
                txtparkingsize.Text = "";
                getCurrentDate();
                getCurrentDate11();
            }
        }
        else
        {
            if (FileUpload1.HasFile)
            {

                string abc = "~/Document/" + FileUpload1.FileName;
                FileUpload1.SaveAs(MapPath("abc"));
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();

                getCurrentDate();
                getCurrentDate11();
                SqlCommand cmd = new SqlCommand("Update Admin_Rent_Space SET lat=@lat,longt=@longt,Parking_Name=@Parking_Name,Address=@Address,Space_Type_Id=@Space_Type_Id,Space_Type_Name=@Space_Type_Name,Property_Id=@Property_Id,Property_Name=@Property_Name,State_Id=@State_Id,State_Name=@State_Name,City_Id=@City_Id,City_Name=@City_Name,Area_Id=@Area_Id,Area_Name=@Area_Name,Postal_Code=@Postal_Code,Available_Space=@Available_Space,Parking_Size=@Parking_Size,Attachment=@Attachment,Facilities=@Facilities,Discription=@Discription,Default_Date=@Default_Date Where Parking_Id=@Parking_Id ", sconn);

                cmd.Parameters.AddWithValue("@Parking_Id", Label4.Text);
                cmd.Parameters.AddWithValue("@Space_Type_Id", DropDownList3.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Space_Type_Name", DropDownList3.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Property_Id", DropDownList4.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Property_Name", DropDownList4.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@State_Id", "1");
                cmd.Parameters.AddWithValue("@State_Name", txtstate.Text);
                cmd.Parameters.AddWithValue("@City_Id", "1");
                cmd.Parameters.AddWithValue("@City_Name", txtcity.Text);
                cmd.Parameters.AddWithValue("@Area_Id", "1");
                cmd.Parameters.AddWithValue("@Area_Name", txtarea.Text);
                cmd.Parameters.AddWithValue("@Postal_Code", txtpostalcode.Text);
                cmd.Parameters.AddWithValue("@Available_Space", txtavailablespace.Text);
                cmd.Parameters.AddWithValue("@Parking_Size", txtparkingsize.Text);
                cmd.Parameters.AddWithValue("@Attachment", abc);
                cmd.Parameters.AddWithValue("@Facilities", Editor2.Content);
                cmd.Parameters.AddWithValue("@Discription", Editor1.Content);
                cmd.Parameters.AddWithValue("@lat", Session["lat"].ToString());
                cmd.Parameters.AddWithValue("@longt", Session["long"].ToString());
                cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@Parking_Name", TextBox1.Text);
         


                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Update')", true);
                txtpostalcode.Text = "";
                txtavailablespace.Text = "";
                Editor2.Content = "";
                Editor1.Content = "";
                txtaddress.Text = "";
                txtparkingsize.Text = "";
                getCurrentDate();
                getCurrentDate11();
            }
            else
            {
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();

                getCurrentDate();
                getCurrentDate11();
                SqlCommand cmd = new SqlCommand("Update Admin_Rent_Space SET longt=@longt,lat=@lat,Parking_Name=@Parking_Name,Address=@Address,Space_Type_Id=@Space_Type_Id,Space_Type_Name=@Space_Type_Name,Property_Id=@Property_Id,Property_Name=@Property_Name,State_Id=@State_Id,State_Name=@State_Name,City_Id=@City_Id,City_Name=@City_Name,Area_Id=@Area_Id,Area_Name=@Area_Name,Postal_Code=@Postal_Code,Available_Space=@Available_Space,Parking_Size=@Parking_Size,Facilities=@Facilities,Discription=@Discription,Default_Date=@Default_Date Where Parking_Id=@Parking_Id ", sconn);

                cmd.Parameters.AddWithValue("@Parking_Id", Label4.Text);
                cmd.Parameters.AddWithValue("@Space_Type_Id", DropDownList3.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Space_Type_Name", DropDownList3.SelectedItem.ToString());

                cmd.Parameters.AddWithValue("@Property_Id", DropDownList4.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Property_Name", DropDownList4.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@State_Id", "1");
                cmd.Parameters.AddWithValue("@State_Name", txtstate.Text);
                cmd.Parameters.AddWithValue("@City_Id", "1");
                cmd.Parameters.AddWithValue("@City_Name", txtcity.Text);
                cmd.Parameters.AddWithValue("@Area_Id", "1");
                cmd.Parameters.AddWithValue("@Area_Name", txtarea.Text);
                cmd.Parameters.AddWithValue("@Postal_Code", txtpostalcode.Text);
                cmd.Parameters.AddWithValue("@Available_Space", txtavailablespace.Text);
                cmd.Parameters.AddWithValue("@Parking_Size", txtparkingsize.Text);
                cmd.Parameters.AddWithValue("@Facilities", Editor2.Content);
                cmd.Parameters.AddWithValue("@Discription", Editor1.Content);
                cmd.Parameters.AddWithValue("@lat", Session["lat"].ToString());
                cmd.Parameters.AddWithValue("@longt", Session["long"].ToString());
                cmd.Parameters.AddWithValue("@Default_Date", getCurrentDate11());
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@Parking_Name", TextBox1.Text);
              
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript(this, typeof(string), "alert", "alert('Successfully Update ')", true);
                txtpostalcode.Text = "";
                txtavailablespace.Text = "";
                Editor2.Content = "";
                Editor1.Content = "";
                txtaddress.Text = "";
                txtparkingsize.Text = "";
                getCurrentDate();
                getCurrentDate11();
            }


        }
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //try
        //{

            if (e.CommandName == "Editss")
            {
                string abc = e.CommandArgument.ToString();

                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;

                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();
                SqlCommand cmd = new SqlCommand("Select * from Admin_Rent_Space where Id=" + abc + "", sconn);
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count == 1)
                {


                    Label4.Text = dt.Rows[0]["Parking_Id"].ToString();
                    TextBox1.Text = dt.Rows[0]["Parking_Name"].ToString();
                    txtaddress.Text = dt.Rows[0]["Address"].ToString();
                    Editor1.Content = dt.Rows[0]["Discription"].ToString();
                    Editor2.Content = dt.Rows[0]["Facilities"].ToString();
                    txtparkingsize.Text = dt.Rows[0]["Parking_Size"].ToString();
                    txtavailablespace.Text = dt.Rows[0]["Available_Space"].ToString();
                    txtpostalcode.Text = dt.Rows[0]["Postal_Code"].ToString();
                   DropDownList3.SelectedValue= dt.Rows[0]["Space_Type_Id"].ToString();
                   DropDownList4.SelectedValue = dt.Rows[0]["Property_Id"].ToString();
                   txtstate.Text = dt.Rows[0]["State_Name"].ToString();
                   txtcity.Text = dt.Rows[0]["City_Name"].ToString();
                   txtarea.Text = dt.Rows[0]["Area_Name"].ToString();
                   Session["lat"] = dt.Rows[0]["lat"].ToString();
                   Session["long"] = dt.Rows[0]["longt"].ToString();


                }
            }
       // }
        //catch
        //{
        //    ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('There is Network please contact website administrator');", true);
        //}
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel1.Visible = false;
        Panel2.Visible = false;
    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0,"---Select Parking Name--");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (Label5.Text == "")
        {

            if (FileUpload2.HasFile)
            {
                string abcd = "Gallery/" + FileUpload2.FileName;
             
                string abcde = "../Gallery/" + FileUpload2.FileName;
                FileUpload2.SaveAs(MapPath(abcde));
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();
                SqlCommand cmd = new SqlCommand("insert into Admin_parking_Image(Image,Parking_Id,Parking_Name)values(@Image,@Parking_Id,@Parking_Name)", sconn);
                cmd.Parameters.AddWithValue("@Image", abcd);
                cmd.Parameters.AddWithValue("@Parking_Id", DropDownList1.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Parking_Name", DropDownList1.SelectedItem.ToString());
                cmd.ExecuteNonQuery();
                GridView2.DataBind();
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Insert Successfull ');", true);
                Label5.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Enter Image ');", true);
            }

        }
        else
        {
            if (FileUpload2.HasFile)
            {
                string abcd = "Gallery/" + FileUpload2.FileName;
               
                string abcde = "../Gallery/" + FileUpload2.FileName;
                FileUpload2.SaveAs(MapPath(abcde));
                if (sconn.State == ConnectionState.Open)
                {
                    sconn.Close();
                }
                sconn.Open();
                SqlCommand cmd = new SqlCommand("Update Admin_parking_Image SET Image=@Image Where Id=@Id ", sconn);
                cmd.Parameters.AddWithValue("@Image", abcd);
                cmd.Parameters.AddWithValue("@Id", Label5.Text);
               
                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Update Successfull ');", true);
                GridView2.DataBind();
                Label5.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "Alert", "alert('Enter Image ');", true);
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Text = DropDownList1.SelectedValue.ToString();
    }
    protected void GridView2_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edits")
        {
            string abcds = e.CommandArgument.ToString();

            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = true;

            if (sconn.State == ConnectionState.Open)
            {
                sconn.Close();
            }
            sconn.Open();
            SqlCommand cmd = new SqlCommand("Select * from Admin_parking_Image where Id=@Id", sconn);
            cmd.Parameters.AddWithValue("Id", abcds);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count == 1)
            {
               Image1.ImageUrl = dt.Rows[0]["Image"].ToString();
                Label2.Text = dt.Rows[0]["Parking_Id"].ToString();
                DropDownList1.DataBind();
                DropDownList1.SelectedValue = Label2.Text;
                Label5.Text = dt.Rows[0]["Id"].ToString();

            }
        }
    }
   
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Web.UI.WebControls.Image Image1 = (System.Web.UI.WebControls.Image)e.Row.FindControl("Image2");
            Image1.ImageUrl = "../" + Image1.ImageUrl;
        }
    }
    
}
