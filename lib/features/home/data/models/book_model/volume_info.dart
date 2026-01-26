import 'package:hive/hive.dart';
import 'image_links.dart';

part 'volume_info.g.dart';

@HiveType(typeId: 1)
class VolumeInfo extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  List<String>? authors;
  @HiveField(2)
  String? publisher;
  @HiveField(3)
  String? publishedDate;
  @HiveField(4)
  String? description;
  @HiveField(5)
  int? pageCount;
  @HiveField(6)
  List<String>? categories;
  @HiveField(7)
  num? averageRating;
  @HiveField(8)
  num? ratingsCount;
  @HiveField(9)
  ImageLinks? imageLinks;
  @HiveField(10)
  String? language;
  @HiveField(11)
  String? previewLink;
  @HiveField(12)
  String? infoLink;

  VolumeInfo({
    required this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String,
    authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
    publisher: json['publisher'] as String?,
    publishedDate: json['publishedDate'] as String?,
    description: json['description'] as String?,
    pageCount: json['pageCount'] as int?,
    categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
    averageRating: json['averageRating'] as num?,
    ratingsCount: json['ratingsCount'] as num?,
    imageLinks: json['imageLinks'] == null
        ? null
        : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    language: json['language'] as String?,
    previewLink: json['previewLink'] as String?,
    infoLink: json['infoLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'authors': authors,
    'publisher': publisher,
    'publishedDate': publishedDate,
    'description': description,
    'pageCount': pageCount,
    'categories': categories,
    'averageRating': averageRating,
    'ratingsCount': ratingsCount,
    'imageLinks': imageLinks?.toJson(),
    'language': language,
    'previewLink': previewLink,
    'infoLink': infoLink,
  };
}
