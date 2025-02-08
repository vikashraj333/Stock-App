import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stock_dashboard/controllers/stocks_controller.dart';
import 'package:stock_dashboard/reusable_widgets/images.dart';

class AnimatedImages extends StatelessWidget {
  AnimatedImages({super.key});

  final StockController controller = Get.put(StockController());

  final List<String> imageUrls = [
    Images().image1,
    Images().image2,
    Images().image3,
    Images().image4
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // show animated images with sliding automatically
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                controller.updateCarouselIndex(index);
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            // show page indicator for images
            child: Obx(() => SmoothPageIndicator(
                  controller: PageController(
                      initialPage: controller.carouselIndex.value),
                  count: imageUrls.length,
                  effect: const WormEffect(),
                )),
          ),
        ],
      ),
    );
  }
}
