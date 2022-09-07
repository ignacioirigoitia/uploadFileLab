

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/default_api.dart';
import '../models/default_model.dart';

class DefaultProvider extends ChangeNotifier {

  

  Future<GenerateUrlResponse?> generateUrl(String fileName, String fileExtension, String type) async {
    //notifyListeners();
    var rng = Random();
    var random = rng.nextInt(1000000).toString();
    final fileNameToSend = random + fileName;
    final data = {
      "name": fileNameToSend,
      "extension": fileExtension,
      "type": type
    };
    try {
      final Response response = await DefaultApi.post('https://developers-api.com/generateURL', data);
      final resp = GenerateUrlResponse.fromJson(response.data);
      print('---------------------------------');
      print('//   URL WHERE THE FILE LIVES // ');
      print(resp.fileUrl);
      print('//   PATH TO UPLOAD THE FILE  // ');
      print(resp.uploadUrl);
      print('---------------------------------');
      notifyListeners();
      return resp;
    } on DioError catch (e) {
      notifyListeners();
      print("imprimiendo e.error: ${e.error}");
      print("imprimiendo e.message: ${e.message}");
      return null;
    }
  }

  Future<String?> generateTempUrl(String url) async {
    try {
      final resp = await DefaultApi.httpGet('https://developers-api.com/getTempURL?url=$url');
      return TempUrlResponse.fromJson(resp).tempUrl;
    } on DioError catch (e) {
      print("imprimiendo e.error: ${e.error}");
      print("imprimiendo e.message: ${e.message}");
      return null;
    }
  }

}