import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providerstructure/Common/common_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../AuthRepository/auth_repository.dart';
import '../../../Common/api_constant.dart';
import '../../../Common/string_constant.dart';
import 'login_model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  LoginProvider() {
    emailController = TextEditingController(text: "jigargodasara@elsner.com.au");
    passwordController = TextEditingController(text: "domani_2023");
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _startLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    _isLoading = false;
    notifyListeners();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSecure = true;
  LoginModel? loginModel;
  final authRepository = AuthRepository();

  Future<void> login({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      try {
        CommonFunction().hideKeyboard(context);
        _startLoading();
        final response = await authRepository.callLogin(
            email: emailController.text.toLowerCase(),
            password: passwordController.text.trim());
        if (response.statusCode == 200) {
          _stopLoading();
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          loginModel = LoginModel.fromJson(responseBody);
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool(Constants.isLogin, true);
          pref.setString(StringConstant.loginModelResponse, json.encode(loginModel));
          print("Login successful");
          CommonFunction().showCustomSnackBar(
            context,
            "Login Success.",
          );
        } else if (response.statusCode == 403 ||
            response.statusCode == 400 ||
            response.statusCode == 401) {
          _stopLoading();
          CommonFunction.showErrorDialog(context, "Login Failed.");
          print("Unauthorized");
        } else {
          print("Something Went Wrong");
        }
      } catch (e) {
        _stopLoading();
        CommonFunction.showErrorDialog(context, "$e");
      } finally {
        notifyListeners();
      }
    }
  }
}
