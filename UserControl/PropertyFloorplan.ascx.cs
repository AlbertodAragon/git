using System;
using SurgeSolutions.FrontEnd.DAL;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.FrontEnd.UserControls
{
	public partial class PropertyFloorplan : System.Web.UI.UserControl
    {
		private string pepo;
        #region properties
		
		public int ParentID { get; set; }
		public bool LoadDefault { get; set; }
		public string AcordeonCode { get; set; }
		public int PropertyTypeId { get; set; }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
			string acordeonClass = string.Empty, ptypeholding = Request.QueryString["propertytype"], titleToUse = string.Empty;
			int ptypetouse = 0;
			bool isFirst;

			if (!string.IsNullOrEmpty(ptypeholding))
			{
				ptypetouse = int.Parse(ptypeholding);
				acordeonClass = "subtitleacordeon";
			}
			else
			{
				ptypetouse = this.PropertyTypeId;
				acordeonClass = "subtitleacordeon2";
			}

			Property propertyst = new Property(new SiteData().ConnectionString);
			propertyst.PropertyType = ptypetouse; /*int.Parse(Request.QueryString["propertytype"]);*/
			propertyst.LoadSubType();

			AcordeonCode = "";

			int mainloopcounter = 1;
			
			foreach(PropertyItem propertysubtype in propertyst.PropertyItems)
			{
				string tableheadname = "apartment";

				if (ptypetouse == 0)
				{
					titleToUse = propertysubtype.Title;
					if (titleToUse == "townhouse") { titleToUse = "townhouses"; }
					else if (titleToUse == "duplex penthouse") { titleToUse = "duplex penthouses"; }
				}
				else
				{
					switch (ptypetouse)
					{
						case 1:
							titleToUse = propertysubtype.Title + " FloorPlans";
							break;
						default:
							titleToUse = "FloorPlans";
							break;						
					}
				}

				if (ptypetouse == 2)
				{
					tableheadname = "townhouse";
				}

				if (ptypetouse == 0 && (titleToUse == "1 bedroom" || titleToUse == "2 bedroom" ))
				{
					titleToUse = titleToUse + " apartments";
				}


				Property propertydeta = new Property(new SiteData().ConnectionString);
				propertydeta.PropertyType = propertysubtype.ItemId;
				propertydeta.LoadProperty();

				this.AcordeonCode += "<h1><a class=\"titleacordeon\" href=\"javascript:OpenAcordeon(" + mainloopcounter + ");\" id=\"tacordeon" + mainloopcounter + "\">"
					+ titleToUse + "</a></h1><div class=\"contentacordeon\" id=\"acordeon" + mainloopcounter + "\">"
					+ "<div class=\"contentacordeoninside\">";

				int internalloopcounter = 1;
				isFirst = true;

				this.AcordeonCode += "<div class=\"tableheadings\"><span>" + tableheadname + "</span><span>Floor</span><span>Price</span><span>INTERNAL AREA</span><span>Terrace</span><span>PARKING</span></div>";

				foreach (PropertyItem propertyitem in propertydeta.PropertyItems)
				{
					int subacordeonid = (mainloopcounter * 100) + internalloopcounter;

					string parkingvariable = propertyitem.Parking;
					string parkingimg = "";

					if (parkingvariable == "1")
					{
						parkingimg = "<i class=\"fas fa-check\"></i>";
					}
					else
					{
						parkingimg = "<i class=\"fas fa-minus\"></i>";
					}


					if (isFirst)
					{
						/*if (ptypetouse == 0) // currently released page, show header row
						{
							this.AcordeonCode += "<a class=\"titleacordeon subtitlehead\">"
								+ "<span>Apartment No.</span><span></span><span></span><span></span></a>";
						}
						isFirst = false;*/
					}

                    this.AcordeonCode += "<a class=\"titleacordeon " + acordeonClass + "\" href=\"javascript:OpenSubAcordeon(" + subacordeonid + "," + mainloopcounter
                        + ");\" id=\"tacordeon" + subacordeonid + "\">"
						+ "<span>" + propertyitem.Title + "</span><span>" + propertyitem.Floor + "</span><span>" + propertyitem.Price
						+ "</span><span>" + propertyitem.TotalArea + "</span><span>" + propertyitem.TerraceArea + "</span><span class=\"noparking\">" + parkingimg + "</span>";

					if (ptypetouse == 0) // currently released page, show header row
					{
						this.AcordeonCode += "<span>Floorplan</span>";
					}

					this.AcordeonCode += "</a>"
                        + "<div class=\"contentacordeon contentsubacordeon\" id=\"acordeon" + subacordeonid + "\">"
                            + "<div class=\"contentacordeoninside subcontentacordeoninside\">"
                                + "<img src=\"/img/db/property/" + propertyitem.Image + "\" class=\"imagemap\"  usemap=\"#floorplanzone" + subacordeonid + "\"/>"
                                + "<map name=\"floorplanzone" + subacordeonid + "\">";

                    // floorplan zones

                    Property propertyfloorplanzone = new Property(new SiteData().ConnectionString);
                    propertyfloorplanzone.ParentID = propertyitem.ItemId;
                    propertyfloorplanzone.LoadFloorplanZones();

                    string FloorplanZoneDivs = "";
                    int areacounter = 1;

                    foreach (PropertyItem propertyitemfpzone in propertyfloorplanzone.PropertyItems)
                    {
                        string areaid = propertyitem.ItemId + "x" + areacounter;

                        this.AcordeonCode += "<area href=\"/\" id=\"mapzone" + areaid + "\" alt=\"aaa\" title=\"bbbb\" shape=\"poly\" coords=\"" + propertyitemfpzone.Coordenates + "\" "
                        + " onmouseover=\"OverFloorplan('" + areaid + "')\" onmouseout=\"OutFloorplan('" + areaid + "')\">";

                        FloorplanZoneDivs += "<div class=\"areazone\" id=\"area" + areaid + "\"><div class=\"areatitle\"><h2>" + propertyitemfpzone.ZoneDetails + "</h2></div>"
                            + "<img src=\"/img/db/property/" + propertyitemfpzone.ExtraImage + "\"/></div>";

                        areacounter++;
                    }

					string path = Request.CurrentExecutionFilePath.ToString();
					string pepo = "";
					if (path == "/Releases.aspx")
					{
						pepo = "";
					}
					else
					{
					pepo = "<a href=\"/currently-released\">Currently Released</a>";
					}

                                this.AcordeonCode += "</map>"
                                    + FloorplanZoneDivs
                                    + "<div class=\"optionbuttons\">"									
									+ pepo + "<a href=\"#contactform\">Register</a>"
									+ "<a href=\"/pdf/" + propertyitem.Image.Replace(".jpg", ".pdf") + "\" target=\"_blank\">Download</a>"
								+ "</div>"
							+ "</div>"
						+ "</div>";

					internalloopcounter++;
				}

				this.AcordeonCode += "</div></div>";

				mainloopcounter++;
			}



        }
	}
}