import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstructure/Screens/bottom_navigation_bar/info/profile_provider.dart';
import 'package:providerstructure/Screens/bottom_navigation_bar/settings/setting_provider.dart';

import 'Screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'Screens/bottom_navigation_bar/login_view/login_provider.dart';
import 'Theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadTheme();
  runApp(const MyApp());
}

Future<void> loadTheme() async {
  ThemeProvider();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider(),
          ),
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider<SettingProvider>(
            create: (context) => SettingProvider(),
          ),
          ChangeNotifierProvider<ProfileProvider>(
            create: (context) => ProfileProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeProvider.themeData,
              home: const BottomTabScreen(),
            );
          },
        ));
  }
}
