import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

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
    final List<String> urlImages = [
      'https://i.pinimg.com/564x/da/e2/0d/dae20d24b66d4c366f1f0b66f889fa31.jpg',
      'https://i.pinimg.com/564x/a3/66/a5/a366a5c8a799284abfccdf93d57d2877.jpg',
      'https://i.pinimg.com/564x/f1/5f/b5/f15fb5e583374a090295279ef4053be9.jpg',
      'https://i.pinimg.com/564x/99/e8/1a/99e81a18547175d9c3729e5d962449ff.jpg'
    ];
    return Stack(children: [
      CarouselSlider.builder(
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
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
          left: (MediaQuery.of(context).size.width - 90) / 2,
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: urlImages.length,
            effect: ColorTransitionEffect(
                dotColor: Colors.white.withOpacity(0.5), activeDotColor: Colors.white, strokeWidth: 2),
          ))
    ]);
  }

  Widget buildImage(String urlImage, int index) => ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
        child: Container(
          color: Colors.grey,
          width: double.infinity,
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}
