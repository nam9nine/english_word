
import 'package:english_world/model/main-category.model.dart';
import 'package:english_world/repository/word-repository.dart';
import 'package:english_world/views/home_page/home-main.page.dart';
import 'package:english_world/views/incorrect_page/incorrect-main.page.dart';
import 'package:english_world/views/learning_page/learning-main.page.dart';
import 'package:english_world/views/quiz_page/quiz-main.page.dart';
import 'package:flutter/material.dart';
import 'db/db.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( const EnglishWordApp());
}

class EnglishWordApp extends StatelessWidget {
  const EnglishWordApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English World App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});
  @override
  State<StatefulWidget> createState() => _MainViewState();
}
class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Category> categories = List.empty(growable: true);
  late WordRepository repository;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    //repository 객체 생성
    repository = WordRepository(DatabaseHelper());
    // 초기 카테고리 목록 및 유틸적인 요소 생성
    categories.add(Category(
        name: '여행',
        imagePath: 'assets/images/travel_banner.jpg',
        iconPath: Icons.flight_rounded,
    ));
    categories.add(Category(
        name: '식당',
        imagePath: 'assets/images/restaurant_banner.jpg',
        iconPath: Icons.restaurant_rounded,
    ));
    categories.add(Category(
        name: '일상생활',
        imagePath: 'assets/images/daily-life_banner.jpg',
        iconPath: Icons.home_rounded
    ));
    categories.add(Category(
        name: '가족',
        imagePath: 'assets/images/family_banner.jpg',
        iconPath: Icons.family_restroom_rounded,
    ));
    categories.add(Category(
        name: '학교',
        imagePath: 'assets/images/school_banner.jpg',
        iconPath: Icons.school_rounded
    ));
    categories.add(Category(
        name: '교통',
        imagePath: 'assets/images/car_banner.jpg',
        iconPath: Icons.car_crash_rounded
    ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          HomePage(categories: categories, repository : repository),
          LearnMainPage(categories : categories, repository: repository),
          QuizMainPage(categories : categories, repository: repository),
          IncorrectMainPage(repository: repository),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Colors.teal[800],
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.book)),
          Tab(icon: Icon(Icons.question_answer)),
          Tab(icon: Icon(Icons.error_outline)),
        ],
      ),
    );
  }
}