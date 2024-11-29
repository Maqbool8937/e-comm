import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CarouselSliderWidget extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/pic1.png',
    'assets/images/pic2.png',
    'assets/images/pic3.png',
    'assets/images/pic4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            height: 200,
            width:450,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imgList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 200.0, // Height of the carousel
          autoPlay: true, // Auto-play the carousel
          enlargeCenterPage: true, // Enlarge the center item
          aspectRatio: 16/9, // Aspect ratio of the images
          viewportFraction: 0.8, // Fraction of the screen occupied by each item
        ),
      ),
    );
  }
}

