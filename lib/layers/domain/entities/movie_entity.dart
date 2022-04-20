class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String? backdropPath;
  final num voteAverage;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    this.backdropPath,
  });
}
