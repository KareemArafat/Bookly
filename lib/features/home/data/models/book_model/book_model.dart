import 'package:hive/hive.dart';
import 'volume_info.dart';
part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  String? kind;
  @HiveField(1)
  String id;
  @HiveField(2)
  VolumeInfo volumeInfo;

  BookModel({this.kind, required this.id, required this.volumeInfo});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json['kind'] as String?,
    volumeInfo: VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    id: json['id'] as String,
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'volumeInfo': volumeInfo.toJson(),
  };
}
