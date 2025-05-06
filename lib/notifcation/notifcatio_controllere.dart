

import 'package:get/get.dart';

class NotifcatioGEtxControllere extends GetxController {}
  // @override
  // void onInit() {
  //   getNotifcationAll();
  //   // getUnReadNotifcation();

  //   scrollController.addListener(
  //     () {
  //       if (scrollController.position.pixels ==
  //           scrollController.position.maxScrollExtent) {
  //         // Trigger load more when reaching the bottom of the list
  //         if (!isLoading && hasNextPage) {
  //           loadMoreNotifcation();
  //         }
  //       }
  //     },
  //   );
  //   super.onInit();
  // }

  // final ScrollController scrollController = ScrollController();
  // bool isLoading = false;
  // int currentPage = 1; // Track current page
  // bool hasNextPage = true; // Track if there's more data to load
  // // final List<NotifcationData> _notificationList = [];
  // // List<NotifcationData> get notificationList => _notificationList;
  // // NotifcationModel? notifcationModel;

  // int _count = 0;
  // int get count => _count;

  // getNotifcationAll({
  //   bool isLoadMore = false,
  // }) async {
  //   if (isLoadMore && !hasNextPage)
  //     return; // No need to load more if there are no more pages
  //   if (!isLoadMore) {
  //     // Reset page and list if not loading more
  //     currentPage = 1;
  //     _notificationList.clear();
  //   }
  //   isLoading = true;
  //   update();
  //   notifcationModel = await ShareedRepo.getnotifcation(page: currentPage);
  //   // Check if we have more pages
  //   hasNextPage = await notifcationModel!.pagination!.hasNext!;
  //   // Append new data to the existing list
  //   _notificationList.addAll(notifcationModel!.data!);

  //   isLoading = false;
  //   update();
  // }

  // // Method to load more data
  // Future<void> loadMoreNotifcation() async {
  //   if (hasNextPage) {
  //     currentPage++;
  //     getNotifcationAll(isLoadMore: true);
  //   }
  // }

  // UnReadNotifcation? unReadNotifcation;
  // getUnReadNotifcation() async {
  //   isLoading = true;
  //   update();
  //   unReadNotifcation = await ShareedRepo().getUnReadNotifcation();
  //   if (unReadNotifcation!.status!) {
  //     _count = unReadNotifcation?.data?.count ?? 0;
  //   }
  //   isLoading = false;
  //   update();
  // }

  // BaseApiResponce? baseApiResponse;
  // markAsReadNotifcation() async {
//     baseApiResponse = await ShareedRepo().markAsReadNotifcation();
//     getUnReadNotifcation();
//     update();
//   }
// }
