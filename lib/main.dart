import 'package:aysar_app/api/network/local/cashe_helper.dart';
import 'package:aysar_app/api/network/remote/dio_helper.dart';
import 'package:aysar_app/app/app_binding.dart';
import 'package:aysar_app/app/app_routs.dart';
import 'package:aysar_app/cache/cache_controller.dart';
import 'package:aysar_app/helpers/lang_controller.dart';
import 'package:aysar_app/utils/enms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Shared Preferences
  await CacheController().initSharedPreferences();
  if (CacheController().getter(key: CacheKeys.language) == null) {
    await CacheController().setter(key: CacheKeys.language, value: 'ar');
  }
  await CacheHelper.init();
  await DioHelper.init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FbNotifications.initNotifications();
  // FirebaseMessaging.instance.getToken().then(
  //   (value) async {
  //     if (kDebugMode) {
  //       print('Fcm ==> $value');
  //     }
  //     await CacheController()
  //         .setter(value: value ?? '', key: CacheKeys.fcmToken);
  //   },
  // );

  /// App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LanguageGetxController());
    final ThemeData theme = ThemeData();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: 'Action Point',
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        getPages: appRoutes,
        supportedLocales: AppLanguages.values
            .map(
              (language) => Locale(language.name),
            )
            .toList(),
        theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            bodyLarge: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
            bodyMedium: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
            bodySmall: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w300, color: Colors.black),
            displayLarge: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w900, color: Colors.black),
            displayMedium: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
            displaySmall: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
            headlineLarge: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black),
            headlineMedium: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
            headlineSmall: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black),
            labelLarge: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            labelMedium: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
            labelSmall: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
            titleLarge: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
            titleSmall: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          fontFamily: "MontserratArabic",
          primaryColor: const Color(0xff0B629C),
          secondaryHeaderColor: const Color(0XFF26ADBC),
          hintColor: const Color(0xff858585),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          dividerColor: Colors.grey.shade300,
          colorScheme: theme.colorScheme.copyWith(
            primary: const Color(0xff0B629C),
            secondary: const Color(0xff26ADBC),
          ),
          scaffoldBackgroundColor: const Color(0xffF8F8F8),
          shadowColor: Colors.grey.shade200,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: Locale(Get.find<LanguageGetxController>().lang),
        // home: const SplashScreen(),
      ),
    );
  }
}
