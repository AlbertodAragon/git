using System;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;

namespace SurgeSolutions.FrontEnd.UserControls
{
	public partial class BlogDetails : System.Web.UI.UserControl
	{
        #region properties

        public string TableName { get; set; }
        public string LinkBack { get; set; }

        #endregion

		protected void Page_Load(object sender, EventArgs e)
		{
			string urlID = Request.QueryString["blog"];
			
			if (urlID != null)
			{
				/*DAL.BlogList blogList = new DAL.BlogList(new SiteData().ConnectionString, urlID);*/

                DAL.BlogList blogList = new DAL.BlogList(new SiteData().ConnectionString);
                blogList.TableName = this.TableName;
                blogList.UrlId = urlID;
                blogList.LoadByUrlId();

				if (blogList.Blogs.Count == 0)
				{
					Server.Transfer("/PageNotFound.aspx");
				}
				else
				{
					rptBlogs.DataSource = blogList.Blogs;
					rptBlogs.DataBind();

					SiteVariables vars = new SiteVariables();
					Page.Title = blogList.Blogs[0].Title + " - Blogs - " + vars["sitename"];
				}

                if (this.TableName == "stories")
                {
                    this.LinkBack = "Journey";
                }
                else
                {
                    this.LinkBack = this.TableName;
                }
			}			
		}
	}
}