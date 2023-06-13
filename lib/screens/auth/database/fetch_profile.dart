import 'package:cloud_firestore/cloud_firestore.dart';

class FetchProfile {
  final CollectionReference lead =
      FirebaseFirestore.instance.collection("Employee");

  Future getLeadList() async {
    List itemsList = [];

    try {
      await lead.get().then((querySnapshot) {
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
