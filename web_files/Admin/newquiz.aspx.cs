﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_newquiz : System.Web.UI.Page
{
    string quizdetailstable = "quizdetails";
    DateTime updatedate = new DateTime();

    protected void Page_Load(object sender, EventArgs e)
    {
        updatedate = DateTime.Now;

        //add javascript event
        submitquiz.Attributes.Add("onclick", "javascript: if ( Page_ClientValidate() ){" + submitquiz.ClientID + ".disabled=true; " + submitquiz.ClientID + ".value='Wait...';}" + ClientScript.GetPostBackEventReference(submitquiz, ""));


        SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["quizConnectionString"].ConnectionString);
        string query;
        try
        {
            query = "SELECT distinct [title] FROM [quiz_questions]";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                CheckBoxList1.DataSource = ds;
                CheckBoxList1.DataTextField = "title";
                CheckBoxList1.DataValueField = "title";
                CheckBoxList1.DataBind();
            }
            else
            {
                Response.Write("No Results found");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<br>" + ex);
        }
        finally
        {
            con.Close();
        }

    }




    //protected void LoadQuestions(object sender, EventArgs e)
    //{



    //}

    //start new quiz
    protected void submitquiz_click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string name = txtname.Text.Trim();
            string description = txtdescription.Text.Trim();
            string completiondesc = txtcompletiondescription.Text.Trim();
            string start = txtstartdate.Text;
            string end = txtenddate.Text;
            DateTime startdate = new DateTime();
            startdate = Convert.ToDateTime(start);
            DateTime enddate = new DateTime();
            enddate = Convert.ToDateTime(end);
            enddate = enddate.AddHours(23).AddMinutes(59).AddSeconds(59);
            string quizterms = txtterms.Text;

            if ((startdate > enddate) || (startdate < updatedate))
            {
                lblalert.Visible = true;
                lblalert.Text = "Please check Start date and End date!";
            }
            else
            {
                SqlCommand insertnew = new SqlCommand("insert into " + quizdetailstable + " (name, description, completiondescription, startdate, enddate, termsandconditions, lastupdated) values (@name, @description, @completiondescription, @startdate, @enddate, @termsandconditions, @lastupdated)");
                insertnew.Parameters.AddWithValue("name", name);
                insertnew.Parameters.AddWithValue("description", description);
                insertnew.Parameters.AddWithValue("completiondescription", completiondesc);
                insertnew.Parameters.AddWithValue("startdate", startdate);
                insertnew.Parameters.AddWithValue("enddate", enddate);
                insertnew.Parameters.AddWithValue("termsandconditions", quizterms);
                insertnew.Parameters.AddWithValue("lastupdated", updatedate);

                db insertnewquiz = new db();
                insertnewquiz.ExecuteQuery(insertnew);

                Response.Redirect("viewquiz", false);
            }
        }
        else
        {
            lblalert.Visible = true;
            lblalert.Text = "Please enter the complusory fields and try again!";
        }
    }



}