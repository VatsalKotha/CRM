// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppEvent {
  final String title;
  final String descriprion;
  final DateTime date;
  final String cfname;
  final String clname;
  final String salesPerson;
  final DateTime time;
  AppEvent({
    required this.title,
    required this.descriprion,
    required this.date,
    required this.cfname,
    required this.clname,
    required this.salesPerson,
    required this.time,
  });

  AppEvent copyWith({
    String? title,
    String? descriprion,
    DateTime? date,
    String? cfname,
    String? clname,
    String? salesPerson,
    DateTime? time,
  }) {
    return AppEvent(
      title: title ?? this.title,
      descriprion: descriprion ?? this.descriprion,
      date: date ?? this.date,
      cfname: cfname ?? this.cfname,
      clname: clname ?? this.clname,
      salesPerson: salesPerson ?? this.salesPerson,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'descriprion': descriprion,
      'date': date.millisecondsSinceEpoch,
      'cfname': cfname,
      'clname': clname,
      'salesPerson': salesPerson,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory AppEvent.fromMap(Map<String, dynamic> map) {
    return AppEvent(
      title: map['title'] as String,
      descriprion: map['descriprion'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      cfname: map['cfname'] as String,
      clname: map['clname'] as String,
      salesPerson: map['salesPerson'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  factory AppEvent.fromDS(String title, Map<String, dynamic> map) {
    return AppEvent(
      title: title,
      descriprion: map['descriprion'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      cfname: map['cfname'] as String,
      clname: map['clname'] as String,
      salesPerson: map['salesPerson'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }
  String toJson() => json.encode(toMap());

  factory AppEvent.fromJson(String source) =>
      AppEvent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppEvent(title: $title, descriprion: $descriprion, date: $date, cfname: $cfname, clname: $clname, salesPerson: $salesPerson, time: $time)';
  }

  @override
  bool operator ==(covariant AppEvent other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.descriprion == descriprion &&
        other.date == date &&
        other.cfname == cfname &&
        other.clname == clname &&
        other.salesPerson == salesPerson &&
        other.time == time;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        descriprion.hashCode ^
        date.hashCode ^
        cfname.hashCode ^
        clname.hashCode ^
        salesPerson.hashCode ^
        time.hashCode;
  }
}
