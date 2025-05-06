import 'package:aysar_app/api/network/remote/dio_helper.dart';
import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/alert_dialogs_helper.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/helpers/lang_controller.dart';
import 'package:aysar_app/utils/enms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helpers/assets_helper.dart';

class LanguageChanger extends StatefulWidget {
  final Widget child;

  const LanguageChanger({
    required this.child,
    super.key,
  });

  @override
  State<LanguageChanger> createState() => _LanguageChangerState();
}

class _LanguageChangerState extends State<LanguageChanger>
    with ImageHelper, AlertDialogsHelper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageGetxController>(
      builder: (lang) => InkWell(
        onTap: () => _showLanguages(
          lang,
        ),
        child: widget.child,
      ),
    );
  }

  void _showLanguages(
    LanguageGetxController lang,
  ) {
    modalSheetTemplate(
      context,
      expanded: false,
      showClose: false,
      bottomPadding: 30,
      hPadding: 20,
      body: StatefulBuilder(
        builder: (context, setState) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                appSvgImage(AssetsHelper.langIcon, width: 20.w),
                12.width,
                Text(
                  appLocale.theLanguage,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            20.height,
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  _langItem(lang, AppLanguages.values[index], setState),
              separatorBuilder: (context, index) => SizedBox(height: 25.h),
              itemCount: AppLanguages.values.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _langItem(LanguageGetxController languageProvider,
      AppLanguages language, StateSetter setState) {
    bool selected = language.name == languageProvider.lang;
    return InkWell(
      onTap: () async {
        await languageProvider.changeLang(language);
        await DioHelper.init();
        setState(() {});
        await Future.delayed(
          const Duration(milliseconds: 1000),
        );
        // Get.find<SplashGetxcontroller>().getCountries();
        // Get.find<SplashGetxcontroller>().getIdentityType();
        // Get.find<ShareedGetxcontroller>()
        //     .changedefaultlanguage(lang: language.name);
      },
      child: Row(
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/${language.name == 'ar' ? 'sa' : 'us'}.png',
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            language.name == 'ar' ? appLocale.theArabic : appLocale.theEnglish,
          ),
          const Spacer(),
          Icon(
            selected ? Icons.check_circle_outline : Icons.radio_button_off,
            color: selected
                ? Theme.of(context).primaryColor
                : const Color(0xffF8F9FB),
            size: 24.h,
          ),
        ],
      ),
    );
  }
}
