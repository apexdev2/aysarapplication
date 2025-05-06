import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/modules/compamies/company_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompaniesScreen extends StatelessWidget with ImageHelper {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "appLocale.companies",
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 20.h,
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) => CompanyCard(company: companies[index]),
        separatorBuilder: (context, index) => 15.height,
        itemCount: companies.length,
      ),
    );
  }
}

// List of company data
final List<Map<String, dynamic>> companies = [
  {
    'name': 'شركة ديار ناسا',
    'phone': '9661234567890',
    'email': 'diar@gmail.com',
    'logo': 'assets/diar_logo.png', // Replace with actual logo path
    'logoColor': Colors.green,
  },
  {
    'name': 'شركة إلمام العقارية',
    'phone': '9661234567890',
    'email': 'itmam@gmail.com',
    'logo': 'assets/itmam_logo.png', // Replace with actual logo path
    'logoColor': Colors.green.shade300,
  },
  {
    'name': 'شركة ديار ناسا',
    'phone': '9661234567890',
    'email': 'diar@gmail.com',
    'logo': 'assets/diar_logo.png', // Replace with actual logo path
    'logoColor': Colors.green,
  },
];
