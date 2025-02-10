import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_sir_pandi/services/datasources/data_renungan_response_models.dart';

class DataRenunganRemoteDatasources {
  Future<List<DataRenunganModels>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://renungan.net/wp-json/custom/v1/posts'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);

      return jsonList
          .map((jsonItem) => DataRenunganModels.fromJson(jsonItem))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
