import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../model/category-word.model.dart';
import '../model/main-category.model.dart';


class MainCarouselSlider extends StatefulWidget {
  final List<Category> categories;
  late int pageIndex;
  MainCarouselSlider({super.key, required this.categories, this.pageIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return _MainCarouselSlider();
  }

}

class _MainCarouselSlider extends State<MainCarouselSlider> {

  @override
  Widget build(BuildContext context) {
    List<Widget> categorySliders = widget.categories.map((category) =>
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(category.imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  bottom: 20,
                  child: Text(category.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
            ),
          ),
        )
    ).toList();
    return CarouselSlider(
        items: categorySliders,
        options: CarouselOptions(
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged : (index, reason){
              setState(() {
                widget.pageIndex = index;
              });
            }
        ),
    );
  }
}

class LearnCarouselSlider extends StatefulWidget {
  final List<Word>? words;
  int pageIndex;
  LearnCarouselSlider({super.key, required this.words, required this.pageIndex});

  @override
  State<StatefulWidget> createState() => _LearnCarouselSliderState();
}

class _LearnCarouselSliderState extends State<LearnCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    List<Widget> learnSliders = widget.words!.map((word) =>
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  bottom: 20,
                  child: Text(word.english, style: const TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
                ),
              ],
            ),
          ),
        )
    ).toList();

    return CarouselSlider(
      items: learnSliders,
      options: CarouselOptions(
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          autoPlay: true,
          onPageChanged: (index, reason) {
            widget.pageIndex;
          }
      ),
    );
  }
}