import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getxproductsss/Modell/Phonez.dart';
import 'package:getxproductsss/Modell/Products.dart';
import 'package:http/http.dart' as http;


class PhonezGetx extends GetxController {
  RxList<Products> products = <Products>[].obs;


  Future<void> fetchPhonez() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      var getPhonezData = json.decode(response.body.toString());
     var s=Phonez.fromJson(getPhonezData);
     var list=s.products;
      products.assignAll(list as Iterable<Products>);
      update();
    } else {
      throw Exception('Failed to load quotes');
    }
  }}
