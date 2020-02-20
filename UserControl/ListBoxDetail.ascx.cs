using System;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.FrontEnd.UserControls
{
    public partial class ListBoxDetail : System.Web.UI.UserControl
	{
		#region private variables


		#endregion

		#region properties

        public string TableName { get; set; }
        public string DetailUrlID { get; set; }
		public string LinkTo { get; set; }
		public DALEnum.OrderBy OrderBy { get; set; }
		public DALEnum.OrderByDirection OrderByDirection { get; set; }
		public int MaxRecords { get; set; }
		public int ParentID { get; set; }
		public bool Featured { get; set; }

		#endregion

		protected void Page_Load(object sender, EventArgs e)
		{
			ListBox listBox = new ListBox(new SiteData().ConnectionString);
			listBox.TableName = this.TableName;
			listBox.UrlID = this.DetailUrlID;
            listBox.LoadByUrlId();

			rptBlogs.DataSource = listBox.ListBoxItems;
            rptBlogs.DataBind();

            this.LinkTo = this.TableName.Replace("_", " ").Replace("blog", "news");
            this.TableName = this.TableName.Replace("case_study", "case-study");
		}		
	}
}