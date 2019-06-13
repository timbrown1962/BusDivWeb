using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management.Automation;
using System.Text;

namespace PswdChange
{
    public partial class Change : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack)) {
                Continue.Enabled = false;
            }
        }

        protected void ExecuteCode_Click(object sender, EventArgs e)
        {
            ResultBox.Text = string.Empty;

            StringBuilder sb = new StringBuilder();
            var shell = PowerShell.Create();

            //shell.AddScript(@"D:\inetpub\divadm\PowerShellScript.ps1 " + "-username " + UserName.Text + " -opwd " + OldPswd.Text + " -npwd " + NewPswd.Text);
            shell.AddScript(@"C:\scratch\PowerShellScript.ps1 " + "-username " + UserName.Text + " -opwd " + OldPswd.Text + " -npwd " + NewPswd.Text);
            var results = shell.Invoke();
            var errors = shell.Streams.Error.ReadAll();
            foreach (var result in results)
            {
                sb.AppendLine(result.ToString());
            }

            if (errors.Count > 0)
            {
               sb.AppendLine("Errors occurred:");
               foreach (var error in errors)
                {
                    sb.AppendLine(error.ToString());
                }
            }
            else
            {
                Session["user"] = UserName.Text;
                sb.AppendLine("Password change successful for " + Session["user"] + ". Click Continue to view ftp site");
                Continue.Enabled = true;
                Continue.Text = "ftp://10.31.5.1/" + Session["user"];
            }
            ResultBox.Text = Server.HtmlEncode(sb.ToString());

        }

        protected void Continue_Click(object sender, EventArgs e)
        {
                Response.Redirect("ftp://10.31.5.1/" + Session["user"]);

        }
    }
}