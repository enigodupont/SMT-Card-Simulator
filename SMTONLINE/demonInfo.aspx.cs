using System;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;

namespace SMTONLINE
{
    public partial class demonInfo : System.Web.UI.Page
    {

        public string curDemonPicURL;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = Request.QueryString["demon"];
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://megamitensei.wikia.com/wiki/" + Request.QueryString["demon"]);
            request.AutomaticDecompression = DecompressionMethods.GZip;
            
            string siteContent = String.Empty;

            // Wrap everything that can be disposed in using blocks... 
            // They dispose of objects and prevent them from lying around in memory...
            /* We are going to pull these images later.
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())  // Go query url
            using (Stream responseStream = response.GetResponseStream())               // Load the response stream
            using (StreamReader streamReader = new StreamReader(responseStream))       // Load the stream reader to read the response
            {
                siteContent = streamReader.ReadToEnd(); // Read the entire response and store it in the siteContent variable
            }

            Regex srcURLParser = new Regex("<img src=\"(https://.*)\".*alt.*class=\".*thumbimage.*\"");
            Match curMatch = srcURLParser.Match(siteContent);
            curDemonPicURL = curMatch.Groups[1].Value;
            */
        }
    }
}