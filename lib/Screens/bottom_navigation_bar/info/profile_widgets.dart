import 'package:flutter/cupertino.dart';

import '../../../CustomWidgets/custom_widgets.dart';

mixin ProfileWidget {
   Widget detailsWidget({
    required String text,
    String? textName,
    String? textMobile,
    String? textEmail,
    String? textTShirt,
    String? wholesaler,
     Color? titleColor,
    String? branch,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomWidget.commonText(
            commonText: text,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: titleColor,
            maxLines: 2,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomWidget.commonText(
            commonText: textName!,
            fontWeight: FontWeight.w400,
            fontSize: 16,
        ),
        CustomWidget.commonText(
            commonText: textMobile!,
            fontWeight: FontWeight.w400,
            fontSize: 16,
        ),
        CustomWidget.commonText(
            commonText: textEmail!,
            fontWeight: FontWeight.w400,
            fontSize: 16,
         ),
        CustomWidget.commonText(
            commonText: textTShirt!,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            ),
      ],
    );
  }
}
