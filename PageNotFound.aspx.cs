using System;
using System.Web.UI;
using SurgeSolutions.GlobalControls.Navigation;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;

namespace SurgeSolutions.FrontEnd
{
	public partial class PageNotFound : System.Web.UI.Page
	{		
		protected void Page_Load(object sender, EventArgs e)
		{            
            Response.TrySkipIisCustomErrors = true;
            Response.Buffer = false;			
            Response.Status = "404 Page Not Found";
		}
	}
}
