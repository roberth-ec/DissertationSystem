using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testApp
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Email"] = System.Web.HttpContext.Current.User.Identity.Name;
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            ReportsDataSource.Insert();
            ReportsDataSource.DataBind();
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "Your report has been submitted successfully!"+" To check the status access manage my report page";
            Button1.Visible = true;
            Button2.Visible = true;
        }
    }
}