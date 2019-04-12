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
            if (UserGridView.Rows.Count==1) {
                btn1.Visible = false;
            }
            else
            {
                btn1.Visible = true;
                btn3.Visible = false;
            }
           

    
        }


        protected void btn1_Click(object sender, EventArgs e)

        {
                CustomerRegisterDataSource.Insert();
                CustomerRegisterDataSource.DataBind();
                btn1.Visible = false;
                btn3.Visible = true;
 
        }
    
    protected void btn2_Click(object sender, EventArgs e)
    {
        UserFName.Text = "";
        UserSName.Text = "";
        UserPassword.Text = "";
    }

        protected void btn3_Click(object sender, EventArgs e)
        {
            CustomerRegisterDataSource.Update();
            CustomerRegisterDataSource.DataBind();
        }
    }
    }


