using System;
using SurgeSolutions.GlobalControls.Navigation;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;

namespace SurgeSolutions.FrontEnd.UserControls
{
	public partial class Header : System.Web.UI.UserControl
    {
		#region properties		

		#endregion

		#region methods

		protected void Page_Load(object sender, EventArgs e)
		{			
			short siteId;

			SiteVariables vars = new SiteVariables();
			siteId = short.Parse(vars["siteid"]);

			NavPopulator navPopulator = new NavPopulator(ref navigation, siteId, 0, "", "", false);
            //NavPopulator navPopulator = new NavPopulator(ref navigation, siteId, 0, "", "", false);
		}

		#endregion        
    }
}