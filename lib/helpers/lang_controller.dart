import 'package:aysar_app/api/network/remote/dio_helper.dart';
import 'package:aysar_app/cache/cache_controller.dart';
import 'package:aysar_app/utils/enms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageGetxController extends GetxController {
  String lang = CacheController().getter(key: CacheKeys.language) ?? 'ar';

  String languageName({AppLanguages? locale}) {
    String lan = locale?.name ?? lang;
    switch (lan) {
      case 'ar':
        return 'العربية';
      case 'en':
        return 'English';
    }

    return '';
  }

  bool appDirectionRtl = true;
  Future<void> changeLang(AppLanguages language) async {
    lang = language.name;
    switch (language) {
      case AppLanguages.ar:
        appDirectionRtl = true;

        break;
      case AppLanguages.en:
        appDirectionRtl = false;
        break;
    }
    await CacheController().setter(
      key: CacheKeys.language,
      value: lang,
    );
    Future.delayed(
      const Duration(seconds: 2),
      () => DioHelper.init(),
    );
    Get.updateLocale(Locale(lang));
    update();
  }

  Future<void> changeLangLocale(String language) async {
    lang = language;
    switch (language) {
      case 'ar':
        appDirectionRtl = true;
        break;
      case 'en':
        appDirectionRtl = false;
        break;
    }
    await CacheController().setter(
      key: CacheKeys.language,
      value: lang,
    );
    update();
  }
}
