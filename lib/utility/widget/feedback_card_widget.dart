import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/image_string.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FeedbackCardWidget extends StatefulWidget {
  const FeedbackCardWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.description,
      required this.feedbackcname,
      required this.rating,
      required this.phoneNumber,
      this.feedbkrate});

  final String? rating;
  final String? title;
  final String? date;
  final String? description;
  final String? feedbackcname;
  final String? phoneNumber;
  final String? feedbkrate;

  @override
  State<FeedbackCardWidget> createState() => _FeedbackCardWidgetState();
}

class _FeedbackCardWidgetState extends State<FeedbackCardWidget> {
  final CollectionReference lead =
      FirebaseFirestore.instance.collection("Feedback");

  @override
  Widget build(BuildContext context) {
    Color feedbkrate;

    if (widget.rating == "5") {
      feedbkrate = Colors.green;
    } else if (widget.rating == "4") {
      feedbkrate = Colors.orange;
    } else if (widget.rating == "3") {
      feedbkrate = Colors.yellow;
    } else if (widget.rating == "2") {
      feedbkrate = Colors.yellowAccent;
    } else {
      feedbkrate = Colors.red;
    }

    return SizedBox(
      height: 140.0,
      child: Card(
        elevation: 3.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Row(
          children: [
            Container(
              color: feedbkrate,
              width: 6.0,
            ),

            // Lead Details : lead name, closing date, company name, person name, description
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
                    // Lead title
                    Text(
                      widget.title!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3.0),

                    // closing date
                    Text(
                      "Date : ${widget.date}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // Company Name
                    Text(
                      widget.feedbackcname!,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // Person Name
                    Text(
                      widget.rating!,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Phone Number
                    Text(
                      widget.phoneNumber!,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.description!,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 18.0),
          ],
        ),
      ),
    );
  }
}
