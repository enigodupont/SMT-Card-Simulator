using System;
using System.Web;
using System.Web.UI;
using Npgsql;

namespace SMTONLINE.DynamicData.FieldTemplates {
    public partial class signUp : System.Web.UI.Page
    {

        public static string conString = System.Configuration.ConfigurationManager.ConnectionStrings["SMTDATABASE"].ConnectionString;
        NpgsqlConnection connection = new NpgsqlConnection(conString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["loggedIn"] != null && (bool)HttpContext.Current.Session["loggedIn"] == true)
            {
                Response.Redirect("~/default.aspx");
            }
        }

        protected void registerUser(object sender, EventArgs e)
        {
            String fName = firstName.Value;
            String lName = lastName.Value;
            String phoneNum = phone.Value;
            String eMail = email.Value;
            String user = username.Value;
            String pass = password.Value;

            //System.Diagnostics.Debug.Print("USER&PASS:" + user + ":" + pass);

            NpgsqlCommand cmd = new NpgsqlCommand(String.Format("SELECT * FROM Users where username='{0}'; ", user), connection);
            connection.Open();
            NpgsqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                if (!reader.Read())
                {

                    Console.WriteLine("An Error has Occurred");
                    return;
                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username is unavailable');", true);

            }
            else
            {
                reader.Close();
                cmd = new NpgsqlCommand(String.Format("insert into Users (username,password,first_name,last_name,email,phone) VALUES ('{0}',crypt('{1}', '$2a$08$JX4BVPuNxcdRRg/fz4M76O'),'{2}','{3}','{4}','{5}'); ", user, pass, fName, lName, eMail, phoneNum), connection);
                reader = cmd.ExecuteReader();

                reader.Close();
                connection.Close();

                Response.Redirect("~/signedUp.aspx");

            }
            reader.Close();
            connection.Close();
        }
    }
}