using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace testApp
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendbtn_Click(object sender, EventArgs e)
        {
            try { 
            MailMessage message = new MailMessage(totxt.Text, fromtxt.Text, subjecttxt.Text, body.Text);
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("roberthsteven1997@gmail.com", "tecktonic1");
            client.Send(message);
            status.Text = "Mail Was sent successfuly";
            } catch(Exception ex)
            {
                status.Text = ex.StackTrace;
            }





        }
    }
}