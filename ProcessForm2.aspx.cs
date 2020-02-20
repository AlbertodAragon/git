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

namespace SurgeSolutions.Frontend
{
	public partial class ProcessForm2 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string referer, subject;

			referer = Request.ServerVariables["http_referer"];
			subject = "Event";

			if (Request.IsLocal || (referer.IndexOf("lyons") > 0 && subject != null))
			{
				string body, outcome, fromName, logText = string.Empty, connectionString = string.Empty, notes;
				string title_id = string.Empty, source_id = string.Empty, country_id = string.Empty;
				string reason_id = string.Empty, applicantId;

		/*		if (string.IsNullOrEmpty(Request.Form["ftitle_id"]))
				{
					title_id = "0";
				}
				else
				{
					title_id = Request.Form["ftitle_id"].ToString().Split('|')[0];
				}
				*/
			
 
				SiteVariables vars = new SiteVariables();

				fromName = Request.Form["ffirst-name"] + " " + Request.Form["flast-name"];

				body = "<p>A User has sent the following " + subject + " Request From Lyons Place Website.</p>";

				foreach (String sItem in Request.Form)
				{
					body += "<p>" + sItem.Substring(1).ToUpper() + ": " + Request.Form[sItem] + "</p>";

					logText += "\"" + Request.Form[sItem] + "\",";					
				}

				LogFile logFile = new LogFile();
				logFile.LogFileName = "contact-us.txt";
				logFile.AddLine(logText);

				notes = "Interested in " + Request.Form["finterested"] + Environment.NewLine + Environment.NewLine
					+ Request.Form["fcomments"];

				List<string> applicant = new List<string>();
				//applicant.Add(title_id);
				applicant.Add(Request.Form["ffirst-name"]);
				applicant.Add(Request.Form["flast-name"]);
				applicant.Add(Request.Form["fmobile"]);
				applicant.Add(Request.Form["femail"]);
				applicant.Add(Request.Form["fguestnumber"]);
			
				applicant.Add("3"); // development Id

				if (Request.IsLocal)
				{
					connectionString = "Server=localhost;Database=almacantar;Uid=root;Pwd=jhp5uck5;Allow Zero Datetime=True;";
				}
				else
				{
					connectionString = "Server=mysql.surgesolutions.co.uk;Database=almacantar;Uid=almacantar_user;Pwd=*d3v3!0pm3nt5*;Allow Zero Datetime=True;";
				}

				//CommonFeatures commonFeatures = new CommonFeatures(connectionString);
				//applicantId = commonFeatures.RecordApplicantInCRM(applicant);

				if (!Request.IsLocal)
				{
			//		GenFolders(fromName + "-" + applicantId);
				}

				Email oEmail = new Email();
				oEmail.SMTPServer = "smtp.socketlabs.com";
				oEmail.CredentialUsername = "server11125";
				oEmail.CredentialPassword = "Ea47Ldo5Y6Pte3T8X";
				oEmail.EnableSsl = false;

				oEmail.FromName = vars["fromname"];
				oEmail.EmailFrom = vars["emailfrom"];
				//oEmail.ReplyToName = fromName;
				//oEmail.ReplyTo = Request.Form["femail"];
				oEmail.ToName = vars["toname"];
				oEmail.EmailTo = vars["emailto2"];
				oEmail.Subject = subject + " Request From Lyons Place website";   
				oEmail.IsBodyHtml = true;
				oEmail.Body = body;

				outcome = oEmail.SendEmail();
                //outcome = "EMAIL SENT";

				if (outcome == "EMAIL SENT")
				{
					Response.Write("OK");
				}
				else
				{
					Response.Write("f");
				}
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
