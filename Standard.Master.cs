using System;
using System.Collections.Specialized;
using System.Web;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.FrontEnd.masterpages
{
	public partial class Standard : System.Web.UI.MasterPage
	{
		#region properties

		public string MetaTitle { get; set; }
		public string MetaDescription { get; set; }
		public string MetaKeywords { get; set; }
		public int PageID { get; set; }

		#endregion
		protected void Page_Init(object sender, EventArgs e)
		{
			if (Session["bycookie"] == null)
			{
				Session["bycookie"] = 1;
				cookiepolicyagreediv.Visible = true;
			}
			else
			{
				cookiepolicyagreediv.Visible = false;
			}
		}
		protected void Page_Load(object sender, EventArgs e) 
		{
			string metaText = string.Empty, currentUrl;

			if (!string.IsNullOrEmpty(this.MetaTitle))
			{
				Page.Title = this.MetaTitle;
			}

			if (!string.IsNullOrEmpty(this.MetaDescription)) 
			{
				metaText += "<meta name=\"description\" content=\"" + this.MetaDescription + "\" />";
			}
			if (!string.IsNullOrEmpty(this.MetaKeywords))
			{
				metaText += "<meta name=\"keywords\" content=\"" + this.MetaKeywords + "\" />";
			}

			metadata.Text = metaText;

			currentUrl = HttpContext.Current.Request.RawUrl;

			if (currentUrl.IndexOf("utm_") != -1)
			{
				if (Session["utm"] == null)
				{
					Session["utm"] = "y";
				}
			}

			if (Session["utm"] != null || !string.IsNullOrEmpty(CommonFeatures.ReadCookie("utmc")))
			{
				string connectionString = string.Empty, utmSessionId = string.Empty;
				int index;

				// A returning utm visitor will have the utmc cookie
				utmSessionId = CommonFeatures.ReadCookie("utmc");

				// if its NOT a returning utm visitor
				if (string.IsNullOrEmpty(utmSessionId))
				{
					utmSessionId = Session.SessionID;
					CommonFeatures.WriteCookie("utmc", utmSessionId);
				}

				index = currentUrl.IndexOf("?");

				if (index != -1)
				{
					currentUrl = currentUrl.Replace("?", "?spg=1&");
				}

				NameValueCollection queryString = HttpUtility.ParseQueryString(currentUrl);

				if (Request.IsLocal)
				{
					connectionString = "Server=localhost;Database=almacantar;Uid=root;Pwd=jhp5uck5;Allow Zero Datetime=True;";
				}
				else
				{
					connectionString = "Server=mysql.surgesolutions.co.uk;Database=almacantar;Uid=almacantar_user;Pwd=*d3v3!0pm3nt5*;Allow Zero Datetime=True;";
				}

				CommonFeatures commonFeatures = new CommonFeatures(connectionString);

				UTMItem utmItem = new UTMItem();
				utmItem.Campaign = queryString["utm_campaign"];
				utmItem.Content = queryString["utm_content"];
				utmItem.Department = queryString["utm_department"];

				if (index == -1)
				{
					utmItem.PageUrl = "https://www.lyonsplace.co.uk" + currentUrl;
				}
				else
				{
					utmItem.PageUrl = "https://www.lyonsplace.co.uk" + currentUrl.Substring(0, index);
				}

				utmItem.PageName = this.MetaTitle;
				utmItem.MEID = string.Empty;
				utmItem.SessionID = utmSessionId;
				utmItem.Source = queryString["utm_source"];
				utmItem.Medium = queryString["utm_medium"];
				utmItem.QS = currentUrl;
				utmItem.DevelopmentID = "3";
				commonFeatures.RecordUTM(utmItem);	
			}
		}	
	}
}
