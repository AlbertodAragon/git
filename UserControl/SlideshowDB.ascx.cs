using System;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.FrontEnd.UserControls
{
	public partial class SlideshowDB : System.Web.UI.UserControl
    {
        #region properties
		
		public int ParentID { get; set; }
		public bool LoadDefault { get; set; }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
			if (this.ParentID > 0)
			{
				Slideshow slideshow = new Slideshow(new SiteData().ConnectionString);
				slideshow.ParentID = this.ParentID;
				slideshow.LoadDefault = this.LoadDefault;
				slideshow.Load();

				rptSlideshow.DataSource = slideshow.Banners;
				rptSlideshow.DataBind();
			}
			
        }
	}
}