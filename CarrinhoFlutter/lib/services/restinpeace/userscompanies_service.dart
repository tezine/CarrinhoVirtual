//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/defines.dart';
import '../../codes/bool_helper.dart';
import '../../entities/restinpeace/eusercompany.dart';
//endregion

class UsersCompaniesService{

	static Future<List<EUserCompany>> getAllByUserID(String userID) async {
		final response = await http.get(Defines.RestBaseURL + '/v1/SUsersCompanies/GetAllByUserID/${userID}',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(UsersCompaniesService)GetAllByUserID error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EUserCompany.fromJson(e)).toList();
	}

	static Future<EUserCompany> addCompany(EUserCompany eUserCompany) async {
		final response = await http.post(Defines.RestBaseURL + '/v1/SUsersCompanies/AddCompany',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eUserCompany.toJson()));

		if (response.statusCode != 200) print('(UsersCompaniesService)AddCompany error. Status code: ${response.statusCode}');
		return EUserCompany.fromJson(json.decode(response.body));
	}

}
