using Npgsql;
using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace SMTONLINE {
    public partial class playerCard : System.Web.UI.Page {
        public static string conString = System.Configuration.ConfigurationManager.ConnectionStrings["SMTDATABASE"].ConnectionString;
        NpgsqlConnection connection = new NpgsqlConnection(conString);

        protected void Page_Load(object sender, EventArgs e) {
            if (HttpContext.Current.Session["loggedIn"] == null || (bool)HttpContext.Current.Session["loggedIn"] != true) {
                Response.Redirect("~/Default.aspx");
            } else {
                string curUser = (String)HttpContext.Current.Session["user"];
                Page.Title = curUser;
                loadPlayerInfo(curUser);
            }
        }

        private void loadPlayerInfo(string curUser) {
            //Grab user info from DB and display here.
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT user_id FROM Users where username= @uName; ", connection);
            cmd.Parameters.AddWithValue("@uName", curUser);
            connection.Open();
            NpgsqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows) {
                if (!reader.Read()) {
                    Console.WriteLine("An Error has Occurred");
                    return;
                }

                int userId = reader.GetInt32(0);
                reader.Close();
                loadPlayerCard(userId);
            } else {
                playerCardError("Username not found!");
                reader.Close();
            }
            connection.Close();
        }
        
        private void loadPlayerCard(int userId) {
            if (userId < 0) {
                playerCardError("UserID not found!");
                return;
            } else {

                playerSource1.SelectParameters[0].DefaultValue = userId.ToString();
                playerSource1.DataBind();
                playerCardView.DataBind();

                /*
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM Players where user_id= @ID; ", connection);
                cmd.Parameters.AddWithValue("@ID", userId);
                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows) {
                    if (!reader.Read()) {
                        Console.WriteLine("An Error has Occurred");
                        return;
                    }
                    //Show that player.

                    playerCardView.DataSource = reader;
                    playerCardView.DataBind();
                    Page.Title += " - " + reader.GetString("name");

                } else {
                    //User has no card, let's create one.
                    Response.Redirect("~/playerCreate.aspx");
                }
                */
            }
        }

        private void playerCardError(string e) {
            Console.WriteLine("An Error has Occurred: " + e);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + e + " Are you goofing us?');", true);
        }

        protected void Edit_PlayerCard(object sender, EventArgs e) {
            //Edit Card Mode
            
        }
    }
}