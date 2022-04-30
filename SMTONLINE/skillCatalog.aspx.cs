using System;
namespace SMTONLINE {
    public partial class skillCatalog : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void adjustSearch(object sender, EventArgs e) {
            
            skillSource1.SelectParameters["filterSkillName"].DefaultValue = "%" + searchQuery.Text + "%";
        }
    }
}