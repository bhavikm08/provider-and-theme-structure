import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstructure/Common/font_constant.dart';
import 'package:providerstructure/Screens/bottom_navigation_bar/info/profile_provider.dart';
import 'package:providerstructure/Screens/bottom_navigation_bar/info/profile_widgets.dart';

import '../../../CustomWidgets/custom_widgets.dart';

class ProfileScreen extends StatelessWidget with ProfileWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileProvider>().getData();
    ProfileScreen profileScreen = const ProfileScreen();
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: CustomWidget.commonText(
                commonText: "Profile",
                fontFamily: FontFamilyConstant.rubikScribble,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 28, right: 227, bottom: 32),
                  child: CustomWidget.commonText(
                      commonText: 'My Details',
                      fontFamily: FontFamilyConstant.lato,
                      fontSize: 32,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.bold),
                ),
                profileScreen.detailsWidget(
                    text: 'Personal Details',
                    titleColor: Theme.of(context).textTheme.bodyLarge?.color,
                    textName: "Name: ${provider.fullName}",
                    textMobile: "Mobile: ${provider.mobile}",
                    textEmail: "Email: ${provider.email}",
                    textTShirt: "T-shirt Size: ${provider.tshirt}"),
                const Divider(
                  height: 40,
                  color: Color(0xFF565656),
                  indent: 0,
                  endIndent: 20,
                ),
                profileScreen.detailsWidget(
                    text: 'Business Details  & Shipping Address',
                    titleColor: Theme.of(context).textTheme.bodyLarge?.color,
                    textName: "Name: ${provider.userBusinessName}",
                    textMobile: "Mobile: ${provider.mobile}",
                    textEmail: "Email: ${provider.email}",
                    textTShirt: "T-shirt Size: ${provider.tshirt}"),
                const Divider(
                  height: 40,
                  color: Color(0xFF565656),
                  indent: 0,
                  endIndent: 20,
                ),
                CustomWidget.commonText(
                  commonText: 'Nominated  Wholesaler Branch',
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomWidget.commonText(
                  commonText: 'Wholesaler: ${provider.userWholesaler}',
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamilyConstant.poppins,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
                CustomWidget.commonText(
                  commonText: 'Branch: ${provider.userWholesalerGroup}',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                Container(
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(left: 0, top: 25, right: 253),
                  child: CustomWidget.commonText(
                      commonText: 'Edit Details',
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
