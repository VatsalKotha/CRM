import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm/screens/auth/database/AddMeetings.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

import 'meetings_event.dart';

final CollectionReference meeting =
    FirebaseFirestore.instance.collection("Meetings");

final eventDBS = DatabaseService<AppEvent>(meeting as String,
    fromDS: (title, data) => AppEvent.fromDS(title, data!),
    toMap: (event) => event.toMap());
