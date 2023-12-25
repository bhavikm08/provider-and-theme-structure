import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstructure/CustomWidgets/custom_widgets.dart';
import 'package:providerstructure/Screens/bottom_navigation_bar/settings/setting_provider.dart';
import 'package:providerstructure/Theme/theme_provider.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Color? selectedColor;
  int defaultContainerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, SettingProvider>(
      builder: (context, themeProvider, settingProvider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomWidget.commonText(
              commonText: "Colour Theme",
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30, left: 15),
                child: CustomWidget.commonText(
                  commonText: "Pick Theme Color -",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListTile(
                title: CustomWidget.commonText(
                    commonText: "Accent Color",
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
                subtitle: CustomWidget.commonText(
                    commonText: "The Accent Theme Color", fontSize: 15),
                trailing: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).focusColor,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: CustomWidget.commonText(
                            commonText: "Accent Theme",
                            color: Theme.of(context).textTheme.bodyLarge?.color),
                        elevation: 0,
                        content: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              colorPickerContainer(color: Colors.orange, containerIndex: 1),
                              colorPickerContainer(color: Colors.purpleAccent, containerIndex: 2),
                              colorPickerContainer(color: Colors.amber, containerIndex: 3),
                              colorPickerContainer(color: Colors.deepOrange, containerIndex: 4),
                              colorPickerContainer(color: Colors.pink, containerIndex: 5),
                              colorPickerContainer(color: Colors.green, containerIndex: 6),
                              colorPickerContainer(color: Colors.grey, containerIndex: 7),
                              colorPickerContainer(color: Colors.brown, containerIndex: 8),
                              colorPickerContainer(color: Colors.red, containerIndex: 9),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              await themeProvider.applyTheme(
                                  selectedColor: selectedColor,
                              );
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  colorPickerContainer({required Color color, required int containerIndex}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
          defaultContainerIndex = containerIndex;
          print("selectedColor $color");
          print("defaultContainerIndex ::- $defaultContainerIndex");
        });
      },
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Theme.of(context).focusColor == color
              ? Border.all(
                  width: 1.5,
                  color: Colors.black,
                )
              : null,
          color: color,
        ),
      ),
    );
  }
}
