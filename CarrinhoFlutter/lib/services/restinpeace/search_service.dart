//region imports
//author Bruno Tezine
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../codes/defines.dart';
import '../../codes/bool_helper.dart';
import '../../entities/restinpeace/esearch.dart';
import '../../entities/restinpeace/eproduct.dart';
//endregion

class SearchService{

	static Future<List<EProduct>> search(ESearch eSearch) async {
		final response = await http.post(Defines.RestBaseURL + '/v1/SSearch/Search',
				headers: {"Content-Type": "application/json", "Authorization": "Bearer "+Defines.JwtToken},
				body: json.encode(eSearch.toJson()));

		if (response.statusCode != 200) print('(SearchService)Search error. Status code: ${response.statusCode}');
		return (json.decode(response.body) as List).map((e) => new EProduct.fromJson(e)).toList();
	}

}
