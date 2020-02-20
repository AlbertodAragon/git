using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Google.Apis.AnalyticsReporting.v4;
using Google.Apis.AnalyticsReporting.v4.Data;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Services;
using Google.Apis.Util.Store;

namespace SurgeSolutions.FrontEnd
{
	public partial class TTest : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{			
			string credFile, filePath, csvFile, fromDate, toDate;

			fromDate = Request.QueryString["fromDate"];
			toDate = Request.QueryString["toDate"];

			if (string.IsNullOrEmpty(fromDate) || string.IsNullOrEmpty(toDate))
			{
				Response.Write("Date range not specified. Must be in format yyyy-mm-dd");
			}
			else
			{
				if (Request.IsLocal)
				{
					filePath = "C:\\Projects\\lyonsplace\\website\\FrontEnd\\App_Data\\";
					credFile = "bryanston.json";
				}
				else
				{
					filePath = "D:\\websites\\lyonsplace\\live\\App_Data\\";
					credFile = "lyonsplace.json";
				}

				csvFile = DateTime.Now.ToString("yyyyMMddHHmmss") + ".csv";

				try
				{
					// These are the scopes of permissions you need. It is best to request only what you need and not all of them
					string[] scopes = new string[] { AnalyticsReportingService.Scope.Analytics };             // View your Google Analytics data

					GoogleCredential credential;
					using (var stream = new FileStream(filePath + credFile, FileMode.Open, FileAccess.Read))
					{
						credential = GoogleCredential.FromStream(stream)
								.CreateScoped(scopes);
					}

					// Create the Analytics service.
					AnalyticsReportingService svc = new AnalyticsReportingService(new BaseClientService.Initializer()
					{
						HttpClientInitializer = credential,
						ApplicationName = "Almacantar",
					});

					var dateRange = new DateRange
					{
						StartDate = fromDate,
						EndDate = toDate
					};
					var metric = new Metric
					{
						Expression = "ga:pageviews",
						Alias = "Sessions"
					};

					List<Dimension> dimensions = new List<Dimension>();
					dimensions.Add(new Dimension { Name = "ga:source" });
					dimensions.Add(new Dimension { Name = "ga:medium" });
					dimensions.Add(new Dimension { Name = "ga:adContent" });
					dimensions.Add(new Dimension { Name = "ga:userAgeBracket" });
					dimensions.Add(new Dimension { Name = "ga:userGender" });
					dimensions.Add(new Dimension { Name = "ga:country" });
					dimensions.Add(new Dimension { Name = "ga:language" });
					dimensions.Add(new Dimension { Name = "ga:userType" });

					var reportRequest = new ReportRequest
					{						
						Dimensions = dimensions,
						Metrics = new List<Metric> { metric },
						ViewId = "150454507" //lyons place = 183611330, almacantar = "150454507"
					};

					var getReportsRequest = new GetReportsRequest
					{
						ReportRequests = new List<ReportRequest> { reportRequest }
					};

					var batchRequest = svc.Reports.BatchGet(getReportsRequest);
					var response = batchRequest.Execute();

					StringBuilder sb = new StringBuilder();

					// csv header
					sb.Append("source,medium,adContent,age,gender,country,language,userType,pageViews" + Environment.NewLine);

					foreach (var x in response.Reports.First().Data.Rows)
					{
						sb.Append(string.Join(",", x.Dimensions) + "," + string.Join(", ", x.Metrics.First().Values) + "<br/>");
					}

					Response.Write(sb.ToString());

					#region write to file
					/*
					StreamWriter sw = File.CreateText(filePath + csvFile);
					sw.WriteLine(sb.ToString());
					sw.Close();

					Response.ContentType = "text/csv";
					Response.AppendHeader("Content-Disposition", "attachment; filename=" + csvFile);
					Response.TransmitFile(filePath + csvFile);
					Response.End();
					*/
					#endregion
				}
				catch (Exception ex)
				{

				}
			}
		}
	}
}