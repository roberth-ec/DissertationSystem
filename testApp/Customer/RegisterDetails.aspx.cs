using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace testApp
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Email"] = System.Web.HttpContext.Current.User.Identity.Name;
            UserEmail.Text = Session["Email"].ToString();

        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            CustomerRegisterDataSource.Insert();
            CustomerRegisterDataSource.DataBind();
        }
    
    protected void btn2_Click(object sender, EventArgs e)
    {
        UserFName.Text = "";
        UserSName.Text = "";
        UserPassword.Text = "";
    }
}
}


