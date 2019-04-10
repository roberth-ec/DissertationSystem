using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace testApp
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSupport_Click(object sender, EventArgs e)
        {

            try
            {
                if (Page.IsValid)
                {
                    string str = UserMessage.Text.Replace("\r\n", "<br>");
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress("roberthsteven1997@gmail.com");
                    mailMessage.To.Add("roberthsteven1997@gmail.com");

                    mailMessage.Subject = UserSubject.Text;
                    mailMessage.Body = "<b> Sender Name: </b>" + UserName.Text + "<br/>" +
                                       "<b> Sender Email: </b>" + UserEmail.Text + "<br/>" +
                                       "<b> Message: </b> <br> <br>" + str;
                    mailMessage.IsBodyHtml = true;


                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    client.EnableSsl = true;
                    client.Credentials = new System.Net.NetworkCredential("roberthsteven1997@gmail.com", "tecktonic1");
                    client.Send(mailMessage);
                    infolbl.ForeColor = System.Drawing.Color.Green;
                    infolbl.Text = "Your enquiry has been sent! A member of the team with be in touch with you shortly";
                }
            }
            catch (Exception ex)
            {

                infolbl.ForeColor = System.Drawing.Color.Red;
                infolbl.Text = ex.StackTrace;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            UserName.Text = "";
            UserEmail.Text = "";
            UserSubject.Text = "";
            UserMessage.Text = "";
            infolbl.Text = "";

        }
    }
}