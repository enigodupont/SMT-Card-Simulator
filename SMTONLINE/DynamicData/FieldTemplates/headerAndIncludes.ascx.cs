using System;
using System.Web;
using System.Web.UI;
using Npgsql;

namespace SMTONLINE.DynamicData.FieldTemplates
{

    public partial class headerAndIncludes : System.Web.DynamicData.FieldTemplateUserControl
    {
        
        public static string conString = System.Configuration.ConfigurationManager.ConnectionStrings["SMTDATABASE"].ConnectionString;
        NpgsqlConnection connection = new NpgsqlConnection(conString);


        public override Control DataControl
        {
            get
            {
                return Literal1;
            }
        }

        public void logOut(object sender, EventArgs e) {
            HttpContext.Current.Session["loggedIn"] = false;
            System.Diagnostics.Debug.Print("Logged Off");
        }

        public void verifyLogin(object sender, EventArgs e)
        {
            String userName = usernameField.Value, password = passwordField.Value;

            //System.Diagnostics.Debug.Print("This is the info user: " + userName + " pass: " + password);

            NpgsqlCommand cmd = new NpgsqlCommand(String.Format("SELECT password, crypt('{1}', '$2a$08$JX4BVPuNxcdRRg/fz4M76O') FROM Users where username='{0}'; ", userName,password), connection);
            connection.Open();
            NpgsqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                if(!reader.Read()) {

                    Console.WriteLine("An Error has Occurred");
                    return;
                }

                String dbPass = HttpUtility.HtmlEncode(reader.GetString(0));
                String userPass = HttpUtility.HtmlEncode(reader.GetString(1));
                //var hasher = System.Security.Cryptography.SHA256.Create();

                //byte[] userPassHash = hasher.ComputeHash(System.Text.Encoding.Unicode.GetBytes(password));
                //String userPass = System.Text.Encoding.Unicode.GetString(userPassHash);

                if (!userPass.Equals(dbPass)) {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password is incorrect');", true);
                    System.Diagnostics.Debug.Print("These pass's don't match - " + userPass + " & " + dbPass);
                }
                else {
                    HttpContext.Current.Session["loggedIn"] = true;
                    HttpContext.Current.Session["user"] = userName;
                }

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User was not found');", true);
                Console.WriteLine("No rows found.");
            }
            reader.Close();

            connection.Close();
        }
    }
}
