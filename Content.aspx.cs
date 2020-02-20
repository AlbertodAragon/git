using System;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;

namespace SurgeSolutions.FrontEnd
{
	public partial class Content : System.Web.UI.Page
	{
		#region properties

		public string PageTitle { get; set; }
		public string BodyText { get; set; }		
      

		#endregion

		protected void Page_Load(object sender, EventArgs e)
		{
			short siteId;
			string defaultSectionUrl, defaultPageUrl, section, page;

			page = Request.QueryString["page"];
			section = Request.QueryString["section"];
			
			SiteVariables vars;
			PageTextPopulator pageTextPopulator = null;			

			vars = new SiteVariables();
			siteId = short.Parse(vars["siteid"]);
			defaultSectionUrl = vars["defaultsectionurl"];
			defaultPageUrl = vars["defaultpageurl"];
	
			// if no default section/page url then show default page
			if (section == null && page == null)
            {
                Server.Transfer("/PageNotFound.aspx");
			}			            
            else if (page == null)
            {                
				pageTextPopulator = new PageTextPopulator(section, 1, siteId, string.Empty);
			}			
			else
            {                
				pageTextPopulator = new PageTextPopulator(page, 1, siteId, section);
			}

            if (pageTextPopulator.PageId == 0)
            {
                Server.Transfer("/PageNotFound.aspx");
            }
            else
            {                
                Page.Title = pageTextPopulator.PageTitle + " - " + vars["sitename"];
				this.PageTitle = pageTextPopulator.PageTitle;
				this.BodyText = pageTextPopulator.Body;				

				Master.MetaTitle = string.IsNullOrEmpty(pageTextPopulator.SeoTitle) ? pageTextPopulator.PageTitle : pageTextPopulator.SeoTitle;
                Master.MetaDescription = pageTextPopulator.SeoDesc;
                Master.MetaKeywords = pageTextPopulator.SeoKeywords;
				Master.PageID = pageTextPopulator.PageId;

				Slideshow.ParentID = pageTextPopulator.PageId;
            }
		}
	}
}
