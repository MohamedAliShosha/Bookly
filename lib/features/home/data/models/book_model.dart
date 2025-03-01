import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final int? number;
  final String? title;
  final String? originalTitle;
  final String? releaseDate;
  final String? description;
  final int? pages;
  final String? cover;
  final int? index;

  const BookModel({
    this.number,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.description,
    this.pages,
    this.cover,
    this.index,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        number: json['number'] as int?,
        title: json['title'] as String?,
        originalTitle: json['originalTitle'] as String?,
        releaseDate: json['releaseDate'] as String?,
        description: json['description'] as String?,
        pages: json['pages'] as int?,
        cover: json['cover'] as String?,
        index: json['index'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'title': title,
        'originalTitle': originalTitle,
        'releaseDate': releaseDate,
        'description': description,
        'pages': pages,
        'cover': cover,
        'index': index,
      };

  @override
  List<Object?> get props {
    return [
      number,
      title,
      originalTitle,
      releaseDate,
      description,
      pages,
      cover,
      index,
    ];
  }
}
