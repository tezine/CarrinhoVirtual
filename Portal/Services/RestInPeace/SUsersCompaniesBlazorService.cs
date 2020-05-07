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
	public class SUsersCompaniesBlazorService {
		HttpClient httpClient;

		public SUsersCompaniesBlazorService(HttpClient client) {
			httpClient = client;
		}

		public async Task<List<EUserCompany>> GetAllByUserID(string userID)  {
			SDefines.Loading = true;
			HttpRequestMessage req = new HttpRequestMessage(HttpMethod.Get, $"api/v1/SUsersCompanies/GetAllByUserID/{userID}");
			req.Headers.Add("Authorization", $"bearer {SDefines.Token}");
			var response = await httpClient.SendAsync(req);
			SDefines.Loading = false;
			if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)throw new UnauthorizedAccessException();
			response.EnsureSuccessStatusCode();
			string responseBody = await response.Content.ReadAsStringAsync();
			List<EUserCompany> result = JsonConvert.DeserializeObject<List<EUserCompany>>(responseBody);
			return result;
		}

		public async Task<EUserCompany> AddCompany(EUserCompany eUserCompany)  {
			SDefines.Loading = true;
			HttpRequestMessage req = new HttpRequestMessage(HttpMethod.Post, $"api/v1/SUsersCompanies/AddCompany");
			req.Headers.Add("Authorization", $"bearer {SDefines.Token}");
			req.Content = new StringContent(JsonConvert.SerializeObject(eUserCompany), Encoding.UTF8, "application/json");
			var response = await httpClient.SendAsync(req);
			SDefines.Loading = false;
			if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized)throw new UnauthorizedAccessException();
			response.EnsureSuccessStatusCode();
			string responseBody = await response.Content.ReadAsStringAsync();
			EUserCompany result = JsonConvert.DeserializeObject<EUserCompany>(responseBody);
			return result;
		}

	}
}
