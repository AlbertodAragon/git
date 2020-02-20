using System;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.FrontEnd.UserControls
{
	public partial class PropertySlides : System.Web.UI.UserControl
    {
        #region properties
		
		public int ParentID { get; set; }
		public bool LoadDefault { get; set; }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
			Property property = new Property(new SiteData().ConnectionString);
			property.PropertyType = int.Parse(Request.QueryString["propertytype"]);
			property.Load();

			rptPropertySlides.DataSource = property.PropertyItems;
			rptPropertySlides.DataBind();
        }
	}
}