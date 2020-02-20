using System;
using SurgeSolutions.GlobalControls.Navigation;
using SurgeSolutions.GlobalControls.Common;
using SurgeSolutions.CodeLibrary.Config;
using SurgeSolutions.FrontEnd.DAL;

namespace SurgeSolutions.FrontEnd.UserControls
{
	public partial class Footer : System.Web.UI.UserControl
    {
		#region properties

		public string CountryDropDown { get; set; }
		public string ReasonPurchaseDropDown { get; set; }
		public string EnquirySourceDropDown { get; set; }
		public string TitleDropDown { get; set; }


		public string CoockieContent { get; set; }
		public string DisclaimerContet { get; set; }
		public string PrivacyContent { get; set; }
		public bool UTMSession { get; set; }

		#endregion

		#region methods

		protected void Page_Load(object sender, EventArgs e)
		{			
			short siteId;
			string ddHtml;

			if (Session["utm"] != null || !string.IsNullOrEmpty(CommonFeatures.ReadCookie("utmc")))
			{
				this.UTMSession = true;
			}
			else
			{
				this.UTMSession = false;
			}

			SiteVariables vars = new SiteVariables();
			siteId = short.Parse(vars["siteid"]);			

			NavPopulator navPopulator;
            
            navPopulator = new NavPopulator(ref footernav, siteId, 0, "", "", "", 2);

            currentyear.Text = DateTime.Now.Year.ToString();


			//country of residence

			ListBox listBox = new ListBox(new SiteData().ConnectionString);
			listBox.LoadCountryOfResidence();

			ddHtml = "<select onchange=\"LabelAnimationSelect('fcountry')\" id=\"fcountry\"><option></option>";

			foreach(ListBoxItem itemlb in listBox.ListBoxItems)
			{
				ddHtml += "<option value=\"" + itemlb.ItemID + "|" + itemlb.Title + "\">" + itemlb.Title + "</option>";
			}

			ddHtml += "</select>";

			this.CountryDropDown = ddHtml;

			//Reason of purchase

			listBox.ListBoxItems.Clear();
			listBox.LoadReasonOfPurchase();

			ddHtml = "<select onchange=\"LabelAnimationSelect('freason-for-purchase')\" id=\"freason-for-purchase\"><option></option>";

			foreach (ListBoxItem itemlb in listBox.ListBoxItems)
			{
				ddHtml += "<option value=\"" + itemlb.ItemID + "|" + itemlb.Title + "\">" + itemlb.Title + "</option>";
			}

			ddHtml += "</select>";

			this.ReasonPurchaseDropDown = ddHtml;

			//enquiry Source

			listBox.ListBoxItems.Clear();
			listBox.LoadEnquirySource();

			ddHtml = "<select onchange=\"LabelAnimationSelect('fenquiry-source')\" id=\"fenquiry-source\"><option></option>";

			foreach (ListBoxItem itemlb in listBox.ListBoxItems)
			{
				ddHtml += "<option value=\"" + itemlb.ItemID + "|" + itemlb.Title + "\">" + itemlb.Title + "</option>";
			}

			ddHtml += "</select>";

			this.EnquirySourceDropDown = ddHtml;

			//title dropdown

			listBox.ListBoxItems.Clear();
			listBox.LoadTitles();

			ddHtml = "<select onchange=\"LabelAnimationSelect('ftitle')\" id=\"ftitle\"><option></option>";

			foreach (ListBoxItem itemlb in listBox.ListBoxItems)
			{
				ddHtml += "<option value=\"" + itemlb.ItemID + "|" + itemlb.Title + "\">" + itemlb.Title + "</option>";
			}

			ddHtml += "</select>";

			this.TitleDropDown = ddHtml;



			/*****  Footer nav content *****/
			
			PageTextPopulator pageTextPopulator;
			pageTextPopulator = new PageTextPopulator(1129, 1, siteId);
			this.CoockieContent = "<h1 class=\"footetputitle\">" + pageTextPopulator.PageTitle + "</h1>" + pageTextPopulator.Body;
			
			pageTextPopulator = new PageTextPopulator(1130, 1, siteId);
			this.DisclaimerContet = "<h1 class=\"footetputitle\">" + pageTextPopulator.PageTitle + "</h1>" + pageTextPopulator.Body;

			pageTextPopulator = new PageTextPopulator(1131, 1, siteId);
			this.PrivacyContent = "<h1 class=\"footetputitle\">" + pageTextPopulator.PageTitle + "</h1>" + pageTextPopulator.Body;


			/*********** session cookie policy ******/

			//string aaaa = Context.Session["lp-cookie"].ToString();



		}

		#endregion        
    }
}