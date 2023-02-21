import 'package:flutter/material.dart';
import 'package:movie/modelMovieList.dart';

class MovieView extends StatelessWidget {
  Movie movies;

  MovieView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          color: Colors.red,
          child: SingleChildScrollView(
            child: Column(
                children: movies.results!
                    .map((e) => MovieListItem(
                          result: e,
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}

class MovieListItem extends StatelessWidget {
  Result result;
  MovieListItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(result.title),
    );
  }
}
