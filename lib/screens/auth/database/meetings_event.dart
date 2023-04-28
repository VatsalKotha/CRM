// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppEvent {
  final String title;
  final String id;
  final String descriprion;
  final DateTime date;
  final bool public;
  AppEvent({
    required this.title,
    required this.id,
    required this.descriprion,
    required this.date,
    required this.public,
  });

  AppEvent copyWith({
    String? title,
    String? id,
    String? descriprion,
    DateTime? date,
    bool? public,
  }) {
    return AppEvent(
      title: title ?? this.title,
      id: id ?? this.id,
      descriprion: descriprion ?? this.descriprion,
      date: date ?? this.date,
      public: public ?? this.public,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'descriprion': descriprion,
      'date': date.millisecondsSinceEpoch,
      'public': public,
    };
  }

  factory AppEvent.fromMap(Map<String, dynamic> map) {
    return AppEvent(
      title: map['title'] as String,
      id: map['id'] as String,
      descriprion: map['descriprion'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      public: map['public'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppEvent.fromJson(String source) => AppEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppEvent(title: $title, id: $id, descriprion: $descriprion, date: $date, public: $public)';
  }

  @override
  bool operator ==(covariant AppEvent other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.id == id &&
      other.descriprion == descriprion &&
      other.date == date &&
      other.public == public;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      id.hashCode ^
      descriprion.hashCode ^
      date.hashCode ^
      public.hashCode;
  }
}
