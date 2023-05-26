import 'package:cloud_firestore/cloud_firestore.dart';

class FetchFeedback {
  final CollectionReference feedback =
      FirebaseFirestore.instance.collection("Feedback");

  Future getFeedbackList() async {
    List itemsList = [];

    try {
      await feedback.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
