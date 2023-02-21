import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/model/apiMovieList.dart';
import 'package:movie/model/modelMovieList.dart';
import 'package:movie/movie_list/movie_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;
  const MyHomePage({super.key, this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Movie? movies;

  @override
  void initState() {
    fetchMovies();
    // TODO: implement initState
    super.initState();
  }

  void fetchMovies() async {
    final response = await apiMovieList();
    setState(() {
      movies = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: () {
            Get.to(
              () => MovieView(
                movies: movies!,
              ),
            );
          },
          child: Center(
            child: Text(widget.title!),
          ),
        ),
      ),
    );
  }
}
