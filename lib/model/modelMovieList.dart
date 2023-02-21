class Movie {
  final int? page;
  final List<Result>? results;

  Movie({
    this.page,
    this.results,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      page: map['page'],
      results: map['results'] != null
          ? (map['results'] as List).map((e) => Result.fromMap(e)).toList()
          : null,
    );
  }
}

class Result {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      releaseDate: map['release_date'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }
}
