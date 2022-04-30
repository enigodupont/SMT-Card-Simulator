using Npgsql;
using System;
using System.Web;

namespace SMTONLINE {
    public partial class playerCreate : System.Web.UI.Page {

        public static string conString = System.Configuration.ConfigurationManager.ConnectionStrings["SMTDATABASE"].ConnectionString;
        NpgsqlConnection connection = new NpgsqlConnection(conString);
        private string curUser = String.Empty;

        protected void Page_Load(object sender, EventArgs e) {
            if (HttpContext.Current.Session["loggedIn"] == null || (bool)HttpContext.Current.Session["loggedIn"] != true) {
                Response.Redirect("~/Default.aspx");
            } else {
                curUser = (String)HttpContext.Current.Session["user"];
            }
        }

        protected void createPlayer(object sender, EventArgs e) {

            if(playerName.Value.Length <= 0) {
                return;
            }

            NpgsqlCommand cmd = new NpgsqlCommand("SELECT user_id FROM Users where username = @ID;",connection);
            cmd.Parameters.AddWithValue("@ID", curUser);
            connection.Open();
            NpgsqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows) {
                if (!reader.Read()) {
                    Console.WriteLine("PlayerCreate: An Error has Occurred");
                }
                int userId = reader.GetInt32(0);
                reader.Close();


                cmd = new NpgsqlCommand("INSERT INTO Players (name,user_id) VALUES(@pName,@ID);", connection);
                cmd.Parameters.AddWithValue("@ID", userId);
                cmd.Parameters.AddWithValue("@pName", playerName.Value);
                cmd.ExecuteNonQuery();
            }else {
                reader.Close();
            }
            connection.Close();
            Response.Redirect("~/playerCard.aspx");
        }
    }
}