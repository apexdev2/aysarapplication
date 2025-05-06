
import 'package:aysar_app/extensions/sized_box_extension.dart';
import 'package:aysar_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AboutPage extends StatelessWidget {
  const AboutPage(
      {super.key, required this.appbarTitle, required this.description});
  final String appbarTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          appbarTitle,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: 
      // GetBuilder<SplashGetxcontroller>(
      //   builder: (controller) => controller.isLoading
      //       ? const Center(
      //           child: CircularProgressIndicator(),
      //         )
      //       : 
            SingleChildScrollView(
                child: CustomContainer(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // HtmlWidget(controller.pageModel?.data?.content ?? "")

                       Text(description),
                      
                     
                      20.height,
                    ],
                  ),
                ),
              ),
      
    );
  }
}
