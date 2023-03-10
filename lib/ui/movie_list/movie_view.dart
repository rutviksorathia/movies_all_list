import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/model/modelMovieList.dart';
import 'package:movie/ui/movie_list/movie_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MovieView extends StatelessWidget {
  Movie movies;

  MovieView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieViewModel>.reactive(
      viewModelBuilder: () => MovieViewModel(movies: movies),
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                Text(
                  'Movies List',
                  style: GoogleFonts.elsie(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 20,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: movies.results!
                          .map((e) => MovieListItem(
                                result: e,
                                model: model,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MovieListItem extends StatelessWidget {
  Result result;
  MovieViewModel model;
  MovieListItem({
    super.key,
    required this.result,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: model.fetchMovies,
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.grey.shade200,
          ),
          child: Stack(
            children: [
              Image.network(
                  'https://image.tmdb.org/t/p/w500${result.backdropPath}'),
              Text(
                result.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
