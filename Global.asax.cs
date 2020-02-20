using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using SurgeSolutions.CodeLibrary.Parsing;

namespace SurgeSolutions.FrontEnd
{
	public class Global : System.Web.HttpApplication
	{

		protected void Application_Start(object sender, EventArgs e)
		{
				
		}

		protected void Session_Start(object sender, EventArgs e)
		{

		}

		void Application_BeginRequest(Object sender, EventArgs e)
		{
			if (Request.IsLocal)
			{
				String strCurrentPath, sURL;				

				strCurrentPath = Request.Path;
				strCurrentPath = strCurrentPath.ToLower();

				Htaccess htaccess = new Htaccess(Server.MapPath("/.htaccess"));

				if (htaccess.checkMatch(strCurrentPath) != null)
				{
					sURL = htaccess.checkMatch(strCurrentPath);
					Context.RewritePath(sURL);
				}
			}
		}

		protected void Application_AuthenticateRequest(object sender, EventArgs e)
		{

		}

		protected void Application_Error(object sender, EventArgs e)
		{

		}

		protected void Session_End(object sender, EventArgs e)
		{

		}

		protected void Application_End(object sender, EventArgs e)
		{

		}
	}
}