import 'package:aysar_app/modules/bnb/bnb_controller.dart';
import 'package:aysar_app/helpers/lang_controller.dart';
import 'package:aysar_app/helpers/style_comtroller.dart';
import 'package:aysar_app/modules/maintenance_requests/technical_suppotr_getx_controller.dart';
import 'package:aysar_app/modules/my_account/profile/profile_getxcontroller.dart';
import 'package:aysar_app/notifcation/notifcatio_controllere.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageGetxController(), fenix: true);
    Get.lazyPut(() => StyleGetxController(), fenix: true);
    Get.lazyPut(() => NotifcatioGEtxControllere(), fenix: true);
    Get.lazyPut(() => ProfileGetxcontroller(), fenix: true);
    Get.lazyPut(() => TechnicalSuppotrGetxController(), fenix: true);



    Get.put(BnbController());
  }
}
