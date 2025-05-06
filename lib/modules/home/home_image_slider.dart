import 'package:aysar_app/helpers/image_helper.dart';
import 'package:aysar_app/utils/temp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> sliderList = [
  tempImage,
  tempImage,
  tempImage,
];

class HomeImageSlider extends StatefulWidget {
  const HomeImageSlider({super.key});

  @override
  _HomeImageSliderState createState() => _HomeImageSliderState();
}

class _HomeImageSliderState extends State<HomeImageSlider> with ImageHelper {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 160.h,
            autoPlay: false,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: sliderList
              .map(
                (item) => buildImageSliderItem(item, context),
              )
              .toList(),
        ),
        Positioned(
          bottom: 0.h,
          left: 0,
          right: 0,
          child: buildIndicator(),
        ),
      ],
    );
  }

  Widget buildImageSliderItem(String image, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 160.h,
      child: appCachedImage(image, fit: BoxFit.cover),
    );
  }

  // Build the circle indicator
  Widget buildIndicator() {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: _current,
        count: sliderList.length,
        effect: ExpandingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Theme.of(context).primaryColor,
          dotColor: Colors.grey.shade300,
        ),
        onDotClicked: (index) {
          _carouselController.animateToPage(index);
        },
      ),
    );
  }
}
