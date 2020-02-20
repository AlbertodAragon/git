using System;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;
using SurgeSolutions.FrontEnd.DAL;

namespace SurgeSolutions.FrontEnd
{
	public partial class Contact : System.Web.UI.Page
	{
		#region properties

		public string Title { get; set; }
		public string BodyText { get; set; }
		public string NeighText { get; set; }
		public string TitleDropDown { get; set; }

		#endregion

		protected void Page_Load(object sender, EventArgs e)
		{
		

			/*Property property = new Property(new SiteData().ConnectionString);
			property.PropertyType = int.Parse(Request.QueryString["propertytype"]);
			property.LoadTypeInformation();

			PropertyItem mypropertyType = property.PropertyItems[0];

			this.Title = mypropertyType.Title;
			this.BodyText = mypropertyType.Standfirst;
			this.FloorplanImage = mypropertyType.Image;*/
			string ddHtml;
			ListBox listBox = new ListBox(new SiteData().ConnectionString);

			listBox.ListBoxItems.Clear();
			listBox.LoadTitles();

			ddHtml = "<select onchange=\"LabelAnimationSelect('ftitle')\" id=\"ftitle\"><option></option>";

			foreach (ListBoxItem itemlb in listBox.ListBoxItems)
			{
				ddHtml += "<option value=\"" + itemlb.ItemID + "|" + itemlb.Title + "\">" + itemlb.Title + "</option>";
			}

			ddHtml += "</select>";

			this.TitleDropDown = ddHtml;
		}
	}
}
