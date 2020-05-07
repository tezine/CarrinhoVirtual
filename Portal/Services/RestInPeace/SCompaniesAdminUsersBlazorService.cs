#region Imports
using Newtonsoft.Json;
using CarrinhoVirtual.Entities;
using CarrinhoVirtual.Codes;
using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
#endregion

namespace Frontend.Services {
	public class SCompaniesAdminUsersBlazorService {
		HttpClient httpClient;

		public SCompaniesAdminUsersBlazorService(HttpClient client) {
			httpClient = client;
		}

		public async Task<List<ECompanyAdminUser>> GetAll(string companyID, int listCount=-1, int pageNumber=0, string orderBy="id desc")  {
			SDefines.Loading = true;
			HttpRequestMessage req = new HttpRequestMessage(HttpMethod.Get, $"api/v1/SCompaniesAdminUsers/GetAll/{companyID}?listCount={listCount}&pageNumber={pageNumber}&orderBy={orderBy}");
			req.Headers.Add("Authorization", $"bearer {SDefines.Token}");
			var response = await httpClient.SendAsync(req);
			SDefines.Loading = false;
			if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)throw new UnauthorizedAccessException();
			response.EnsureSuccessStatusCode();
			string responseBody = await response.Content.ReadAsStringAsync();
			List<ECompanyAdminUser> result = JsonConvert.DeserializeObject<List<ECompanyAdminUser>>(responseBody);
			return result;
		}

		public async Task<ECompanyAdminUser> GetByID(string id)  {
			SDefines.Loading = true;
			HttpRequestMessage req = new HttpRequestMessage(HttpMethod.Get, $"api/v1/SCompaniesAdminUsers/GetByID/{id}");
			req.Headers.Add("Authorization", $"bearer {SDefines.Token}");
			var response = await httpClient.SendAsync(req);
			SDefines.Loading = false;
			if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)throw new UnauthorizedAccessException();
			response.EnsureSuccessStatusCode();
			string responseBody = await response.Content.ReadAsStringAsync();
			ECompanyAdminUser result = JsonConvert.DeserializeObject<ECompanyAdminUser>(responseBody);
			return result;
		}

		public async Task<ECompanyAdminUser> Authenticate(ECompanyAdminUser eCompanyAdminUser)  {
			SDefines.Loading = true;
			HttpRequestMessage req = new HttpRequestMessage(HttpMethod.Post, $"api/v1/SCompaniesAdminUsers/Authenticate");
			req.Headers.Add("Authorization", $"bearer {SDefines.Token}");
			req.Content = new StringContent(JsonConvert.SerializeObject(eCompanyAdminUser), Encoding.UTF8, "application/json");
			var response = await httpClient.SendAsync(req);
			SDefines.Loading = false;
			if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)throw new UnauthorizedAccessException();
			response.EnsureSuccessStatusCode();
			string responseBody = await response.Content.ReadAsStringAsync();
			ECompanyAdminUser result = JsonConvert.DeserializeObject<ECompanyAdminUser>(responseBody);
			return result;
		}

		public async Task<string> Save(ECompanyAdminUser eCompanyAdminUser)  {
			SDefines.Loading = true;
			HttpRequestMessage req = new HttpRequestMessage(HttpMethod.Put, $"api/v1/SCompaniesAdminUsers/Save");
			req.Headers.Add("Authorization", $"bearer {SDefines.Token}");
			req.Content = new StringContent(JsonConvert.SerializeObject(eCompanyAdminUser), Encoding.UTF8, "application/json");
			var response = await httpClient.SendAsync(req);
			SDefines.Loading = false;
			if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)throw new UnauthorizedAccessException();
			response.EnsureSuccessStatusCode();
			string responseBody = await response.Content.ReadAsStringAsync();
			return responseBody;
		}

		public async Task<bool> Remove(string id)  {
			SDefines.Loading = true;
			HttpRequestMessage req = new HttpRequestMessage(HttpMethod.Delete, $"api/v1/SCompaniesAdminUsers/Remove/{id}");
			req.Headers.Add("Authorization", $"bearer {SDefines.Token}");
			var response = await httpClient.SendAsync(req);
			SDefines.Loading = false;
			if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)throw new UnauthorizedAccessException();
			response.EnsureSuccessStatusCode();
			string responseBody = await response.Content.ReadAsStringAsync();
			return bool.Parse(responseBody);
		}

	}
}
