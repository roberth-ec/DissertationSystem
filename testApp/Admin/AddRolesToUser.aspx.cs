using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testApp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            GridViewDataSource.Insert();
            GridViewDataSource.DataBind();
        }

        protected void Btn2_Click(object sender, EventArgs e)
        {
            User.SelectedIndex = 0;
            role.SelectedIndex = 0;
        }
    }
}