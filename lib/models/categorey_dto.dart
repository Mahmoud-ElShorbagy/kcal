// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryDTO {
  final String content;
  final String imageUrl;
  final String? titleButton;
  const CategoryDTO(
      {this.titleButton, required this.content, required this.imageUrl});

  @override
  bool operator ==(covariant CategoryDTO other) {
    if (identical(this, other)) return true;

    return other.content == content &&
        other.titleButton == titleButton &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode =>
      content.hashCode ^ titleButton.hashCode ^ imageUrl.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'imageUrl': imageUrl,
      'titleButton': titleButton,
    };
  }

  factory CategoryDTO.fromMap(Map<String, dynamic> map) {
    return CategoryDTO(
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      titleButton:
          map['titleButton'] != null ? map['titleButton'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDTO.fromJson(String source) =>
      CategoryDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CategoryRecipeDTO extends Equatable {
  final String image;
  final String textTime;
  final String serve;
  final String title;
  final String content;

  const CategoryRecipeDTO(
      {required this.image,
      required this.textTime,
      required this.serve,
      required this.title,
      required this.content});
  @override
  List<Object> get props => [image, textTime, serve, title, content];
  @override
  bool operator ==(covariant CategoryRecipeDTO other) {
    if (identical(this, other)) return true;
    return other.image == image &&
        other.textTime == textTime &&
        other.serve == serve &&
        other.title == title &&
        other.content == content &&
        other.hashCode == hashCode;
  }

  @override
  int get hashCode {
    return Object.hash(
      image,
      textTime,
      serve,
      title,
      content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'textTime': textTime,
      'serve': serve,
      'title': title,
      'content': content,
    };
  }

  factory CategoryRecipeDTO.fromMap(Map<String, dynamic> map) {
    return CategoryRecipeDTO(
      image: map['image'] as String,
      textTime: map['textTime'] as String,
      serve: map['serve'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryRecipeDTO.fromJson(String source) =>
      CategoryRecipeDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
