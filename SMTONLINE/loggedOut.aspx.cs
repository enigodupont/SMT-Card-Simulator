using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMTONLINE
{
    public partial class loggedOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["loggedIn"] == null | (bool)HttpContext.Current.Session["loggedIn"] == false)
            {
                Response.Redirect("~/default.aspx");
            }

            HttpContext.Current.Session["loggedIn"] = false;
            System.Diagnostics.Debug.Print("Logged Off");
        }
    }
}