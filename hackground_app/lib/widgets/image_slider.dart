import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  List<String> urlImages;
  ImageSlider({Key? key, required this.urlImages}) : super(key: key) {
    if (urlImages.length > 10) {
      urlImages = urlImages.sublist(0, 10);
    }
  }

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late final CarouselController controller;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
      child: Stack(children: [
        CarouselSlider.builder(
            itemCount: widget.urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = widget.urlImages[index];
              return buildImage(urlImage, index);
            },
            carouselController: controller,
            options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false,
                height: 230,
                onPageChanged: (index, reason) {
                  setState(() => activeIndex = index);
                })),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 87),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.previousPage();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6), borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/arrow_left_icon.svg',
                      color: Colors.white,
                      width: 8,
                      height: 14,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.nextPage();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6), borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/arrow_right_icon.svg',
                      color: Colors.white,
                      width: 8,
                      height: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 15,
            left: (MediaQuery.of(context).size.width - 24 * widget.urlImages.length + 8) / 2,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.urlImages.length,
              effect: ColorTransitionEffect(
                  dotColor: Colors.white.withOpacity(0.5), activeDotColor: Colors.white, strokeWidth: 2),
            ))
      ]),
    );
  }

  Widget buildImage(String urlImage, int index) => SizedBox(
        width: double.infinity,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: urlImage,
          progressIndicatorBuilder: (context, url, progress) =>
              Center(child: SpinKitSpinningLines(color: Theme.of(context).indicatorColor)),
        ),
      );
}
