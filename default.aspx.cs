using System;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;

namespace SurgeSolutions.FrontEnd
{
	public partial class _Default : System.Web.UI.Page
	{
		#region properties
		public string HPText { get; set; }
		public string Sectors { get; set; }
		public string Services { get; set; }
		public string OurApproach { get; set; }

		#endregion

		protected void Page_Load(object sender, EventArgs e)
		{
			Master.PageID = 1111;

			short siteId;
			SiteVariables vars = new SiteVariables();
			siteId = short.Parse(vars["siteid"]);

			PageTextPopulator pageTextPopulator;
			pageTextPopulator = new PageTextPopulator(1111, 1, siteId);
			this.HPText = pageTextPopulator.Body;
		}
	}
}
