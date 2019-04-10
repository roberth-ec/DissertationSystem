using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace testApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void btn1_Click(object sender, EventArgs e)
        {
            RolesDataSource.Insert();
            RolesDataSource.DataBind();
        }
        protected void btn2_Click(object sender, EventArgs e)
        {
            RoleID.Text="";
            RoleName.Text = "";
        }
    }
}