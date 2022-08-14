import 'package:flutter/material.dart';
import 'package:glarryapp/ApiDara/HttpRequest.dart';
import 'package:glarryapp/ApiDara/Model.dart';
import 'package:provider/provider.dart';

class GProvider with ChangeNotifier {
  List<GModel> modelList = [];
  late GModel userModel;

  getCategory() async {
    modelList = (await CustomHttpRequest().getGallary())!;
    notifyListeners();
  }
}
