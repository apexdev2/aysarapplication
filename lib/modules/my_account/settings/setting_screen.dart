import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/alert_dialogs_helper.dart';
import 'package:aysar_app/helpers/assets_helper.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/language/language_changer.dart';

import 'package:aysar_app/widgets/custom_container.dart';
import 'package:aysar_app/widgets/my_alert_button.dart';
import 'package:aysar_app/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with ImageHelper, AlertDialogsHelper {
  bool activateNotifcation = true;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            appLocale.theSettings,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
          child: CustomContainer(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
            
                LanguageChanger(
                  child: MyListTile(
                    icon: AssetsHelper.langIcon,
                    leading: appLocale.theLanguage,
                    // onTap: () => _showLanguages(),
                    divider: true,
                  ),
                ),

              
                Container(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    children: [
                      appSvgImage(
                        AssetsHelper.notificationsettings,
                      ),
                      12.width,
                      Expanded(
                        child: Text(appLocale.theNotifications),
                      ),
                      Switch.adaptive(
                        activeColor: Colors.greenAccent,
                        inactiveThumbColor: Colors.white,
                        autofocus: false,
                        inactiveTrackColor: const Color(0xffEAEAEA),
                        value: activateNotifcation,
                        //  controller.profileModel?.data?.notifiable ??
                        //     activateNotifcation,
                        onChanged: (value) async {
                          setState(() {
                            activateNotifcation = value;
                            // controller.activateNotification(
                            //     activatestatuse: value ? 1 : 0);
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 10.h,
                  thickness: 0.5,
                ),
                MyListTile(
                  icon: AssetsHelper.deleteaccount,
                  leading: appLocale.deleteAccount,
                  onTap: () => _openConfirmDialog(
                      context,
                      () {},
                      // () => Get.find<AuthGetxcontroller>().deleteAccount(),
                      false),
                  //
                  // return Get.toNamed(Routes.profileScreen);
                ),
              ],
            ),
          ),
        ));
  }

  _openConfirmDialog(
      BuildContext context, Function() filledAction, bool loading) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return alertDialogTemplate(
      context,
      backgroundColor: Colors.white,
      showClose: false,
      body: StatefulBuilder(
        builder: (context, newState) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 76.h,
                width: 76.w,
                child: appSvgImage(AssetsHelper.deleteaccount),
              ),
            ),
            20.height,
            Text(
              appLocale.sureWantDeleteAccount,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ),
            15.height,
            Row(
              children: [
                MyAlertButton(
                  text: appLocale.confirm,
                  filled: false,
                  action: filledAction,
                  loading: loading,
                ),
                SizedBox(width: 20.w),
                MyAlertButton(
                  text: appLocale.no,
                  filled: true,
                  action: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
