import 'package:movies/layers/domain/entities/genre_entity.dart';

class GenrerDto {
  final int id;
  final String name;
  const GenrerDto({required this.id, required this.name});

  GenreEntity toEntity() => GenreEntity(
        id: id,
        name: name,
      );
      
  factory GenrerDto.fromJson(Map<String, dynamic> json) => GenrerDto(
        id: json['id'],
        name: json['name'],
      );

  static List<GenreEntity> fromJsonList(dynamic jsonList) {
    List<GenreEntity> genreEntities = [];

    for (int i = 0; i < jsonList.length; i++) {
      genreEntities.add(GenrerDto.fromJson(jsonList[i]).toEntity());
    }

    return genreEntities;
  }
}
