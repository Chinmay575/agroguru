// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class GovtSchemes {
  String name;
  String description;
  String relatedDocument;
  String publishDate;
  String link;
  GovtSchemes({
    required this.name,
    required this.description,
    required this.relatedDocument,
    required this.publishDate,
    required this.link,
  });

  GovtSchemes copyWith({
    String? name,
    String? description,
    String? relatedDocument,
    String? publishDate,
    String? link,
  }) {
    return GovtSchemes(
      name: name ?? this.name,
      description: description ?? this.description,
      relatedDocument: relatedDocument ?? this.relatedDocument,
      publishDate: publishDate ?? this.publishDate,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'relatedDocument': relatedDocument,
      'publishDate': publishDate.toString(),
      'link': link,
    };
  }

  factory GovtSchemes.fromMap(Map<String, dynamic> map) {
    return GovtSchemes(
      name: map['Title'] as String,
      description: '',
      relatedDocument: (map['Details']['Download Link'] as List).isNotEmpty
          ? (map['Details']['Download Link'] as List)[0]
          : '',
      publishDate: map['Publish Date'] as String,
      link: (map['Details']['link'] as List).isNotEmpty
          ? (map['Details']['link'] as List)[0]
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GovtSchemes.fromJson(String source) =>
      GovtSchemes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GovtSchemes(name: $name, description: $description, relatedDocument: $relatedDocument, publishDate: $publishDate, link: $link)';
  }

  @override
  bool operator ==(covariant GovtSchemes other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.relatedDocument == relatedDocument &&
        other.publishDate == publishDate &&
        other.link == link;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        relatedDocument.hashCode ^
        publishDate.hashCode ^
        link.hashCode;
  }
}
