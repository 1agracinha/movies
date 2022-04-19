import 'package:movies/layers/domain/entities/genrer_entity.dart';

class GenrerDto {
  final int id;
  final String name;
  const GenrerDto({required this.id, required this.name});
  GenrerEntity toEntity() => GenrerEntity(
        id: id,
        name: name,
      );
  factory GenrerDto.fromJson(Map<String, dynamic> json) => GenrerDto(
        id: json['id'],
        name: json['name'],
      );
}
