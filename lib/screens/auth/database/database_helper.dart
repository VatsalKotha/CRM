import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static FirebaseFirestore? _firebaseFirestore;

  DatabaseHelper._() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  Future<void> addEvent(Event event) async {
    await _firebaseFirestore!.collection('Meetings').add(event.toMap());
  }

  Future<List<Event>> fetchEvents() async {
    final QuerySnapshot snapshot =
        await _firebaseFirestore!.collection('Meetings').get();
    return snapshot.docs
        .map((doc) => Event.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}

class Event {
  final String id;
  final String title;
  final String description;
  final String date;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
    );
  }
}
