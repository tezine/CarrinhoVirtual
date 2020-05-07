//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/defines.dart';
import '../../codes/bool_helper.dart';
import '../../entities/restinpeace/eadminuser.dart';
//endregion

class AdminUsersService{

	static Future<EAdminUser> getByID(String id) async {
		final response = await http.get(Defines.RestBaseURL + '/v1/SAdminUsers/GetByID/${id}',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(AdminUsersService)GetByID error. Status code: ${response.statusCode}');
		return EAdminUser.fromJson(json.decode(response.body));
	}

	static Future<EAdminUser> authenticate(EAdminUser eAdminUser) async {
		final response = await http.post(Defines.RestBaseURL + '/v1/SAdminUsers/Authenticate',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eAdminUser.toJson()));

		if (response.statusCode != 200) print('(AdminUsersService)Authenticate error. Status code: ${response.statusCode}');
		return EAdminUser.fromJson(json.decode(response.body));
	}

	static Future<String> save(EAdminUser eAdminUser) async {
		final response = await http.put(Defines.RestBaseURL + '/v1/SAdminUsers/Save',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eAdminUser.toJson()));

		if (response.statusCode != 200) print('(AdminUsersService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		final response = await http.delete(Defines.RestBaseURL + '/v1/SAdminUsers/Remove/${id}',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(AdminUsersService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
