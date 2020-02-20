using System;
using System.Collections.Generic;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.FrontEnd.UserControls
{
    public partial class BlogCategory : System.Web.UI.UserControl
    {
        #region properties

        public int MaxRecords { get; set; }
        public string TableName { get; set; }

        #endregion
		protected void Page_Load(object sender, EventArgs e)
		{
			this.TableName = Request.QueryString["blogcategory"];

			if (string.IsNullOrEmpty(this.TableName))
			{
				this.TableName = "blog";
			}

			DAL.BlogList blogList = new DAL.BlogList(new SiteData().ConnectionString);
			blogList.MaxRecords = this.MaxRecords;
			blogList.CategId = this.TableName;
            blogList.LoadBlogCategories();

			rptBlogs.DataSource = blogList.Blogs;
			rptBlogs.DataBind();
		}

		public int GetItemPosition(int index)
		{
			return index % 3;
		}
	}
}