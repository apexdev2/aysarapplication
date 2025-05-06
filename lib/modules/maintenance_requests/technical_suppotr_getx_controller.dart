import 'dart:io';

import 'package:aysar_app/helpers/data_checker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:dio/dio.dart' as dio;

class TechnicalSuppotrGetxController extends GetxController
    with DataCheckerHelper {
  AppLocalizations appLocale = AppLocalizations.of(Get.context!)!;

  @override
  void onInit() {
    noteController = TextEditingController();
    titleController = TextEditingController();
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     // Trigger load more when reaching the bottom of the list

    //     if (!isLoading && hasNextPage) {
    //       loadMoreTickets();
    //     }
    //   }
    // });
    // getTicketsAll();
    super.onInit();
  }

  @override
  void onClose() {
    noteController.dispose();
    titleController.dispose();

    attachment = null;
    super.onClose();
  }

  late TextEditingController noteController;
  late TextEditingController titleController;

  bool isLoading = false;

  File? attachment;

  final ScrollController scrollController = ScrollController();

  bool looadingMessage = false;
  int currentPage = 1; // Track current page
  bool hasNextPage = true; // Track if there's more data to load
  // final List<TicketData> _ticketslist = [];
  // List<TicketData> get ticketslist => _ticketslist;
  // TicketsModel? ticketsModel;
  // getTicketsAll({
  //   bool isLoadMore = false,
  //   dynamic dateRequest,
  //   String? statuse,
  //   bool? withquery,
  //   String? searchtext,
  // }) async {
  //   if (isLoadMore && !hasNextPage)
  //     return; // No need to load more if there are no more pages
  //   if (!isLoadMore) {
  //     // Reset page and list if not loading more
  //     currentPage = 1;
  //     _ticketslist.clear();
  //   }
  //   isLoading = true;
  //   update();
  //   ticketsModel = await TicketsRepo().getTickets(
  //       withquery: withquery,
  //       statuse: statuse,
  //       dateRequest: dateRequest,
  //       searchtext: searchtext,
  //       page: currentPage);
  //   // Check if we have more pages
  //   hasNextPage = await ticketsModel!.pagination!.hasNext!;
  //   // Append new data to the existing list
  //   _ticketslist.addAll(ticketsModel!.data!);

  //   isLoading = false;
  //   update();
  // }

  // Method to load more data
  // Future<void> loadMoreTickets() async {
  //   if (hasNextPage) {
  //     currentPage++;
  //     getTicketsAll(isLoadMore: true);
  //   }
  // }

  // BaseApiResponce? storeTicketResponce;
  // Future<BaseApiResponce?> storeTicket(
  //     // required String? description,
  //     // required String? title,
  //     ) async {
  //   isLoading = true;
  //   update();

  //   dio.MultipartFile? attachmentToSend;
  //   if (attachment != null) {
  //     attachmentToSend = await dio.MultipartFile.fromFile(
  //       attachment!.path,
  //     );
  //   } else {
  //     attachmentToSend = null;
  //   }

  //   dio.FormData formData = dio.FormData.fromMap(
  //     {
  //       'attachments[0]': attachmentToSend,
  //       'description': noteController.text,
  //       'title': titleController.text,
  //     },
  //   );
  //   var body = {
  //         'description': noteController.text,
  //         'title': titleController.text,
  //       },
  //       storeTicketResponce = await TicketsRepo()
  //           .storeTicket(body: attachmentToSend == null ? body : formData);
  //   if (storeTicketResponce?.status != false) {
  //     getTicketsAll();
  //   }
  //   isLoading = false;
  //   update();
  //   return storeTicketResponce;
  // }

  // TickitsDetailsModel? tickitsDetails;
  // getTickitsDetails({
  //   required int id,
  // }) async {
  //   isLoading = true;
  //   update();
  //   tickitsDetails = await TicketsRepo().getTickitsDetails(id: id);
  //   isLoading = false;
  //   update();
  // }

  // getTickitsDetails2({
  //   required int id,
  // }) async {
  //   tickitsDetails = await TicketsRepo().getTickitsDetails(id: id);
  //   update();
  // }

  // BaseApiResponce? sendMessageResponceResponce;
  // Future<BaseApiResponce?> sendMessageTicket({
  //   required int id,
  //   required File? attachment,
  //   required String? content,
  // }) async {
  //   looadingMessage = true;
  //   update();

  //   dio.MultipartFile? attachmentToSend;
  //   if (attachment != null) {
  //     attachmentToSend = await dio.MultipartFile.fromFile(
  //       attachment.path,
  //     );
  //   } else {
  //     attachmentToSend = null;
  //   }

  //   dio.FormData formData = dio.FormData.fromMap(
  //     {
  //       'attachments[0]': attachmentToSend,
  //       "content": content,
  //     },
  //   );
  //   var body = {
  //     "content": content,
  //   };
  //   sendMessageResponceResponce = await TicketsRepo().sendMessageTicket(
  //     body: attachmentToSend == null ? body : formData,
  //     id: id,
  //   );
  //   if (sendMessageResponceResponce?.status != false) {
  //     getTickitsDetails2(id: id);
  //   }
  //   looadingMessage = false;
  //   update();
  //   return sendMessageResponceResponce;
  // }

  updateAttachments({required File selectedFile}) {
    attachment = selectedFile;
    update();
  }

  bool get checkData =>
      checkText(
        text: titleController.text,
        errorMessage: appLocale.enterTitleEx,
      ) &&
      checkText(
        text: noteController.text,
        errorMessage: appLocale.enterYourNotesEx,
      );
}
