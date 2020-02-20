using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Web;
using SurgeSolutions.CodeLibrary.Config;
using SurgeSolutions.CodeLibrary.Logging;
using SurgeSolutions.CodeLibrary.Net;
using SurgeSolutions.FrontEnd.DAL;
using System.Text.RegularExpressions;
using SurgeSolutions.GlobalControls.Common;

namespace SurgeSolutions.Frontend
{
	public partial class ProcessForm : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string referer, subject;

			referer = Request.ServerVariables["http_referer"];
			subject = Request.Form["fsubject"];

			if (Request.IsLocal || (referer.IndexOf("lyons") > 0 && subject != null))
			{
				string body, outcome, fromName, logText = string.Empty, connectionString = string.Empty, notes;
				string title_id = string.Empty, source_id = string.Empty, country_id = string.Empty;
				string reason_id = string.Empty, applicantId, utmSessionId, utmSource = string.Empty, utmCampaign = string.Empty;
				CommonFeatures commonFeatures;

				if (Request.IsLocal)
				{
					connectionString = "Server=localhost;Database=almacantar;Uid=root;Pwd=jhp5uck5;Allow Zero Datetime=True;";
				}
				else
				{
					connectionString = "Server=mysql.surgesolutions.co.uk;Database=almacantar;Uid=almacantar_user;Pwd=*d3v3!0pm3nt5*;Allow Zero Datetime=True;";
				}
								
				if (string.IsNullOrEmpty(Request.Form["ftitle"]))
				{
					title_id = "0";
				}
				else
				{
					title_id = Request.Form["ftitle"].ToString().Split('|')[0];
				}

				if (string.IsNullOrEmpty(Request.Form["fenquiry-source"]))
				{
					source_id = "0";
				}
				else
				{
					source_id = Request.Form["fenquiry-source"].ToString().Split('|')[0];
				}

				if (string.IsNullOrEmpty(Request.Form["fcountry"]))
				{
					country_id = "0";
				}
				else
				{
					country_id = Request.Form["fcountry"].ToString().Split('|')[0];
				}

				if (string.IsNullOrEmpty(Request.Form["freason-for-purchase"]))
				{
					reason_id = "0";
				}
				else
				{
					reason_id = Request.Form["freason-for-purchase"].ToString().Split('|')[0];
				}

				SiteVariables vars = new SiteVariables();

				fromName = Request.Form["ffirst-name"] + " " + Request.Form["flast-name"];

				body = "<p>A User has sent the following " + subject + " Request From Lyons Place Website.</p>";

				foreach (String sItem in Request.Form)
				{
					if (!string.IsNullOrEmpty(sItem))
					{
						body += "<p>" + sItem.Substring(1).ToUpper() + ": " + Request.Form[sItem] + "</p>";
					}
					logText += "\"" + Request.Form[sItem] + "\",";					
				}

				commonFeatures = new CommonFeatures(connectionString);

				utmSessionId = CommonFeatures.ReadCookie("utmc");

				if (!string.IsNullOrEmpty(utmSessionId))
				{
					UTMItem utmItem = commonFeatures.GetUTMForExport(utmSessionId);

					if (!string.IsNullOrEmpty(utmItem.ID))
					{
						body += "<p>UTM Campaign: " + utmItem.Campaign + "</p>";
						logText += "\"" + utmItem.Campaign + "\",";

						// save utm
						utmItem.PageUrl = "ProcessForm.aspx";
						utmItem.PageName = "REGD";
						utmItem.SessionID = utmSessionId;
						utmItem.DevelopmentID = "3";
						commonFeatures.RecordUTM(utmItem);
						
						source_id = "38";
						utmSource = utmItem.Source;
						utmCampaign = utmItem.Campaign;
					}
				}

				LogFile logFile = new LogFile();
				logFile.LogFileName = "contact-us-" + DateTime.Now.ToString("dd-MM-yyyy") + ".txt";
				logFile.AddLine(logText + "\"" + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss") + "\"");

				notes = "Interested in " + Request.Form["interested"] + Environment.NewLine + Environment.NewLine
					+ Request.Form["fcomments"];

				List<string> applicant = new List<string>();
				applicant.Add(title_id);
				applicant.Add(Request.Form["ffirst-name"]);
				applicant.Add(Request.Form["flast-name"]);
				applicant.Add(Request.Form["fmobile"]);
				applicant.Add(Request.Form["femail"]);
				applicant.Add(source_id);
				applicant.Add(country_id);
				applicant.Add(reason_id);				
				applicant.Add(notes);				
				applicant.Add("3"); // development Id
				applicant.Add(utmSessionId);
				applicant.Add(utmSource);
				applicant.Add(utmCampaign);
				applicantId = commonFeatures.RecordApplicantInCRM(applicant);

				if (!Request.IsLocal)
				{
					GenFolders(fromName + "-" + applicantId);
				}

				Email oEmail = new Email();
				oEmail.SMTPServer = "smtp.socketlabs.com";
				oEmail.CredentialUsername = "server11125";
				oEmail.CredentialPassword = "Ea47Ldo5Y6Pte3T8X";
				oEmail.EnableSsl = false;

				oEmail.FromName = fromName;
				oEmail.EmailFrom = vars["emailfrom"];
				oEmail.ReplyToName = fromName;
				oEmail.ReplyTo = Request.Form["femail"];
				oEmail.ToName = vars["toname"];
				oEmail.EmailTo = vars["emailto"];
				oEmail.Subject = subject + " Request From Lyons Place website";   
				oEmail.IsBodyHtml = true;
				oEmail.Body = body;

				outcome = oEmail.SendEmail();

				body = "Hi James Guilfoyle,"
							+ "<br /><br />"
							+ "Please see the new lead below."
							+ "<br /><br />"
							+ "<strong>" + fromName + "</strong>: https://www.almacantar.surgesolutions.co.uk/applicant-profile/" + applicantId;

				oEmail.ToName = "James Guilfoyle";
				oEmail.EmailTo = "james.guilfoyle@almacantar.com";
				oEmail.Subject = "Lyons Place - New Lead";				
				oEmail.Body = body;

				outcome = oEmail.SendEmail();

				Response.Write("OK");
			}
		}

		private void GenFolders(string fullname)
		{
			string rootPath, currentPath, developmentName;
			string[] applicantsFolders;
			
			developmentName = "CentrePoint"; 

			rootPath = Request.IsLocal ? @"C:\Projects\almacantar\" + developmentName : @"D:\websites\almacantar\live\app_data\filemanager\" + developmentName;

			applicantsFolders = new string[] { };
			
			if (!string.IsNullOrEmpty(fullname))
			{
				currentPath = Path.Combine(rootPath, "applicants", SurgeSolutions.FrontEnd.DAL.CommonFeatures.ConvertNameToId(fullname));

				if (!Directory.Exists(currentPath))
				{
					Directory.CreateDirectory(currentPath);
				}
			}
		}		
	}
}
