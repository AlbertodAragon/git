using System;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.FrontEnd.UserControls
{
	public partial class ListBoxUC : System.Web.UI.UserControl
	{
		#region private variables


		#endregion

		#region properties

		public string TableName { get; set; }
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

            if (this.TableName == "homepagesection")
            {
                listBox.LoadHomepageSections();

                rptHomepageSection.DataSource = listBox.ListBoxItems;
                rptHomepageSection.DataBind();
            }
			else if (this.TableName == "team")
			{
				listBox.LoadTeam();

				rptTeam.DataSource = listBox.ListBoxItems;
				rptTeam.DataBind();
			}
			else if (this.TableName == "neighbourhood")
			{
				listBox.LoadNeoighbourSlides();

				rptNeighbour.DataSource = listBox.ListBoxItems;
				rptNeighbour.DataBind();
			}
			else if (this.TableName == "neighbours" || this.TableName == "mylocallife")
			{
				listBox.TableName = this.TableName;
				listBox.LoadNewNeoighbourSlides();

				rptNewNeighbour.DataSource = listBox.ListBoxItems;
				rptNewNeighbour.DataBind();
			}
			else
            {
            }
		}

		public string GetItemPositionClass(int index)
		{
			if ((index % 2) == 0)
			{
				return "neighimaleft";
			}
			else
			{
				return "neighimaright";
			}
		}
	}
}