using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testApp
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            ItemCategoryDataSource.Insert();
            ItemCategoryDataSource.DataBind();
        }

        protected void Btn2_Click(object sender, EventArgs e)
        {
            ItemCategoryName.Text = "";
        }
    }
}