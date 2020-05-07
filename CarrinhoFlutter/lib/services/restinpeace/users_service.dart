//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/defines.dart';
import '../../codes/bool_helper.dart';
import '../../entities/restinpeace/euser.dart';
//endregion

class UsersService{

	static Future<List<EUser>> getAll(String companyID, {double listCount=-1, double pageNumber=0, String orderBy='id desc'}) async {
		final response = await http.get(Defines.RestBaseURL + '/v1/SUsers/GetAll/${companyID}',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(UsersService)GetAll error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EUser.fromJson(e)).toList();
	}

	static Future<EUser> getByID(String id) async {
		final response = await http.get(Defines.RestBaseURL + '/v1/SUsers/GetByID/${id}',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(UsersService)GetByID error. Status code: ${response.statusCode}');
		return EUser.fromJson(json.decode(response.body));
	}

	static Future<EUser> authenticate(EUser eAdminUser) async {
		final response = await http.post(Defines.RestBaseURL + '/v1/SUsers/Authenticate',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eAdminUser.toJson()));

		if (response.statusCode != 200) print('(UsersService)Authenticate error. Status code: ${response.statusCode}');
		return EUser.fromJson(json.decode(response.body));
	}

	static Future<String> save(EUser eClient) async {
		final response = await http.put(Defines.RestBaseURL + '/v1/SUsers/Save',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eClient.toJson()));

		if (response.statusCode != 200) print('(UsersService)Save error. Status code: ${response.statusCode}');
		return json.decode(response.body);
	}

	static Future<bool> remove(String id) async {
		final response = await http.delete(Defines.RestBaseURL + '/v1/SUsers/Remove/${id}',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},);

		if (response.statusCode != 200) print('(UsersService)Remove error. Status code: ${response.statusCode}');
		return BoolHelper.convertStringToBool(response.body);
	}

}
