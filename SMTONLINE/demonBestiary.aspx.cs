using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Npgsql;
using System.Windows.Forms;

namespace SMTONLINE
{
    public partial class demonBestiary : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void adjustSearch(object sender, EventArgs e) {
            
            bestiarySource1.SelectParameters["filterDemonName"].DefaultValue = "%" + searchQuery.Text + "%";
        }
    }
}