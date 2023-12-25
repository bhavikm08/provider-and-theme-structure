import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstructure/Common/common_function.dart';
import 'package:providerstructure/Theme/theme_provider.dart';

import '../../../CustomWidgets/custom_widgets.dart';
import 'login_provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginProvider();
    return Consumer2<LoginProvider, ThemeProvider>(
      builder: (context, loginProvider, themeProvider, child) {
        return GestureDetector(
          onTap: () => CommonFunction().hideKeyboard(context),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: CustomWidget.commonText(
                  commonText: "Login",
                  color: Theme.of(context).textTheme.bodyLarge?.color),
              actions: [
                Switch(
                  value: themeProvider.themeModeSwitch,
                  // activeColor: themeProvider.themeData.switchTheme.thumbColor?.resolve({}),
                  activeColor: Theme.of(context).focusColor,
                  onChanged: (value) {
                    themeProvider.toggleSwitch(value: value);
                  },
                )
              ],
              centerTitle: true,
            ),
            body: Form(
                key: loginProvider.formKey,
                child: ListView(
                  children: [
                    if (loginProvider.isLoading)
                      const Center(child: CircularProgressIndicator()),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: CustomWidget.commonTextFormField(
                          context: context,
                          textFieldController: loginProvider.emailController,
                          textFieldInputColor:
                              Theme.of(context).textTheme.bodyLarge?.color,
                          prefixIcon: const Icon(CupertinoIcons.person,
                              color: Colors.blue),
                          hintText: "email"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomWidget.commonTextFormField(
                        context: context,
                        textFieldController: loginProvider.passwordController,
                        obscureText: loginProvider.isSecure,
                        textFieldInputColor:
                            Theme.of(context).textTheme.bodyLarge?.color,
                        prefixIcon: const Icon(
                          CupertinoIcons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            loginProvider.isSecure = !loginProvider.isSecure;
                            loginProvider.notifyListeners();
                            print('isSecure:--> ${loginProvider.isSecure}');
                          },
                          child: Icon(
                              color: Colors.blue,
                              loginProvider.isSecure
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye),
                        ),
                        textInputAction: TextInputAction.done,
                        hintText: "password"),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: CustomWidget.commonElevatedButton(
                          context: context,
                          buttonText: "Login",
                          buttonTextColor: Theme.of(context).textTheme.bodyLarge?.color?? Theme.of(context).focusColor,
                          onTap: () {
                            loginProvider.login(context: context);
                          }),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
