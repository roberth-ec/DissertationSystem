using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testApp
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MasterBalanceDataSource.Insert();
            MasterBalanceDataSource.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MasterBalanceDataSource.Update();
            MasterBalanceDataSource.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
        }
    }
}