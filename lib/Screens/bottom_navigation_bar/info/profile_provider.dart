import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Common/string_constant.dart';
import '../login_view/login_model/login_model.dart';


class ProfileProvider extends ChangeNotifier {
  String fullName = "";
  String mobile = "";
  String email = "";
  String tshirt = "";
  String userBusinessName = "";
  String userWholesaler = "";
  String userWholesalerGroup = "";
  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? loginModelResponse = pref.getString(StringConstant.loginModelResponse);
    if (loginModelResponse != null) {
      Map<String, dynamic> loginModelMap = json.decode(loginModelResponse);
      LoginModel loginModel = LoginModel.fromJson(loginModelMap);
      String? firstName = loginModel.profile?.firstName;
      String? lastName = loginModel.profile?.lastName;
      fullName = "$firstName $lastName";
      mobile = loginModel.profile!.mobile!;
      email = loginModel.profile!.email!;
      tshirt = loginModel.profile!.tshirtSize!;
      userBusinessName = loginModel.business!.businessName!;
      userWholesaler = loginModel.wholesaler!.group!;
      userWholesalerGroup = loginModel.wholesaler!.branch!;
      print("User Name: $fullName");
      print("User mobile: $mobile");
      print("User email: $email");
      print("User tshirt: $tshirt");
      print("User userBusinessName: $userBusinessName");
      notifyListeners();
    }
    else {
      print("No data found in SharedPreferences");
    }
    notifyListeners();
  }

}