import 'dart:developer';
import 'package:glarryapp/ApiDara/Model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CustomHttpRequest {
  Future<List<GModel>?> getGallary() async {
    try {
      var url = Uri.parse(
          'https://picsum.photos/v2/list?fbclid=IwAR1N3HFTF1lAwuEZhdOXxAy8327z8CtA4RDi4Jw_9YbtjVvVrISGMjoOVno');
      var response = await http.get(url);
      headers:
      await CustomHttpRequest();

      if (response.statusCode == 200) {
        List<GModel> _model = GModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
