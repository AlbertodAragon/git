using System;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;
using SurgeSolutions.FrontEnd.DAL;

namespace SurgeSolutions.FrontEnd
{
	public partial class Neighbourhood : System.Web.UI.Page
	{
		#region properties

		public string Title { get; set; }
		public string BodyText { get; set; }
		public string NeighText { get; set; }

		#endregion

		protected void Page_Load(object sender, EventArgs e)
		{
			short siteId;
			SiteVariables vars = new SiteVariables();
			siteId = short.Parse(vars["siteid"]);

			PageTextPopulator pageTextPopulator;
			pageTextPopulator = new PageTextPopulator(585, 1, siteId);
			this.NeighText = pageTextPopulator.Body;

			/*Property property = new Property(new SiteData().ConnectionString);
			property.PropertyType = int.Parse(Request.QueryString["propertytype"]);
			property.LoadTypeInformation();

			PropertyItem mypropertyType = property.PropertyItems[0];

			this.Title = mypropertyType.Title;
			this.BodyText = mypropertyType.Standfirst;
			this.FloorplanImage = mypropertyType.Image;*/
		}
	}
}
