import 'dart:convert';

import 'package:fetching_api/models/user_model_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  User_Model_List? user_list;

  var isDataLoading = false.obs;

  getUserInformationFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://dummyapi.io/data/v1/user')!,
          headers: {'app-id': '6218809df11d1d412af5bac4'});
      print(response.body);
      if (response.statusCode == 200) {
        //data successfully

        var result = jsonDecode(response.body);
        user_list = User_Model_List.fromJson(result);
        print("succeed");
      } else {
        //error
        print("error");
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }
}
