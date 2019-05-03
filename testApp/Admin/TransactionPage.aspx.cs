using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace testApp
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void generateWallet_Click(object sender, EventArgs e)
        {
            ManageWalletsDataSource.Insert();
            ManageWalletsDataSource.DataBind();
            Label1.ForeColor = System.Drawing.Color.Green;
            Label1.Text = "The wallet has been generated successfully";
        }

        protected void clearData_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            MasterBalance.Text = "";
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;




        }

        protected void BeginTransfer_Click(object sender, EventArgs e)
        {
            ManageWalletsDataSource.Update();
            ManageWalletsDataSource.DataBind();
            Label2.ForeColor = System.Drawing.Color.Green;
            Label2.Text = "The transaction has been successful";
        }

        protected void ResetData_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
         SourceWalletID.SelectedIndex = 0;
            DestinationWalletID.SelectedIndex = 0;

        }
    }
}
