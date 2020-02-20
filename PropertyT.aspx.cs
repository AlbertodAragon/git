using System;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;
using SurgeSolutions.FrontEnd.DAL;

namespace SurgeSolutions.FrontEnd
{
	public partial class PropertyT : System.Web.UI.Page
	{
		#region properties

		public string Title { get; set; }
		public string BodyText { get; set; }
		public string FloorplanImage { get; set; }

		#endregion

		protected void Page_Load(object sender, EventArgs e)
		{
			Property property = new Property(new SiteData().ConnectionString);
			property.PropertyType = int.Parse(Request.QueryString["propertytype"]);
			property.LoadTypeInformation();

			PropertyItem mypropertyType = property.PropertyItems[0];

			this.Title = mypropertyType.Title;
			this.BodyText = mypropertyType.Standfirst;
			this.FloorplanImage = mypropertyType.Image;

			switch(property.PropertyType)
			{
				case 1:
					Slideshow.ParentID = 1123;
					break;
				case 2:
					Slideshow.ParentID = 1119;
					break;
				case 3:
					Slideshow.ParentID = 1120;
					break;
			}
		}
	}
}
