using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testApp
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Email"] = System.Web.HttpContext.Current.User.Identity.Name;

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[3].Text = string.Format("{0}", DataBinder.Eval(e.Row.DataItem, "ReportStatus"));
                e.Row.Cells[11].Text = string.Format("{0},{1},{2}{3},{4}", DataBinder.Eval(e.Row.DataItem, "FirstLineAddress"),  DataBinder.Eval(e.Row.DataItem, "SecondLineAddress"),Environment.NewLine,DataBinder.Eval(e.Row.DataItem, "PostCode"),DataBinder.Eval(e.Row.DataItem, "Town"));
            }
           
        }
    }
}