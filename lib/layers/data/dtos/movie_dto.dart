import 'package:movies/layers/domain/entities/movie_entity.dart';

class MovieDto {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final num voteAverage;

  MovieDto({
    required this.id,
    required this.title,
    required this.overview,
    required this.voteAverage,
    this.posterPath,
    this.backdropPath,
  });

  MovieEntity toEntity() => MovieEntity(
        id: id,
        title: title,
        overview: overview,
        backdropPath: backdropPath,
        posterPath: posterPath ?? '',
        voteAverage: voteAverage,
      );
  factory MovieDto.fromEntity(MovieEntity entity) => MovieDto(
        id: entity.id,
        title: entity.title,
        overview: entity.overview,
        backdropPath: entity.backdropPath ?? '',
        posterPath: entity.posterPath,
        voteAverage: entity.voteAverage,
      );

  factory MovieDto.fromJson(Map<String, dynamic> json) => MovieDto(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average'],
      );

  static List<MovieEntity> fromJsonList(dynamic jsonList) {
    List<MovieEntity> movieEntities = [];

    for (int i = 0; i < jsonList.length; i++) {
      movieEntities.add(MovieDto.fromJson(jsonList[i]).toEntity());
    }

    return movieEntities;
  }
}
