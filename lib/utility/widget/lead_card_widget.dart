import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LeadCardWidget extends StatefulWidget {
  const LeadCardWidget({
    Key? key,
    required this.leadName,
    required this.leadClosingDate,
    required this.leadCompanyName,
    required this.leadPersonName,
    required this.leadPriorityInt,
    required this.leadStatus,
    required this.phoneNumber,
    required this.salesPersonName,
    this.onPressed,
    this.leadDescription,
  }) : super(key: key);

  final String? leadPriorityInt;
  final String? leadName;
  final String? leadClosingDate;
  final String? leadCompanyName;
  final String? leadPersonName;
  final String? leadStatus;
  final String? phoneNumber;
  final String? salesPersonName;
  final String? leadDescription;
  final VoidCallback? onPressed;

  @override
  State<LeadCardWidget> createState() => _LeadCardWidgetState();
}

class _LeadCardWidgetState extends State<LeadCardWidget> {
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = "";
    retrieveImage();
  }

  Future<void> retrieveImage() async {
    final images = {
      'Vatsal Kotha': 'Vatsal.jpg',
      'Jash Parmar' : 'jash.png'
      // Add more salesperson-image mappings as needed
    };

    final salespersonName = widget.salesPersonName ?? '';

    imageUrl = images.containsKey(salespersonName)
        ? images[salespersonName]!
        : '';

    if (imageUrl.isNotEmpty) {
      try {
        imageUrl = await FirebaseStorage.instance
            .ref()
            .child(imageUrl)
            .getDownloadURL();
      } catch (error) {
        print("Error retrieving image URL: $error");
        imageUrl = "";
      }
    }

    setState(() {});
  }

  void onTap() {
    if (kDebugMode) {
      print("Card Widget was pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color leadPriorityColor, leadStatusColor;

    if (widget.leadPriorityInt == "3") {
      leadPriorityColor = Colors.redAccent;
    } else if (widget.leadPriorityInt == "2") {
      leadPriorityColor = Colors.orange;
    } else if (widget.leadPriorityInt == "1") {
      leadPriorityColor = Colors.yellow;
    } else {
      leadPriorityColor = Colors.grey;
    }

    if (widget.leadStatus == "New") {
      leadStatusColor = Colors.blueAccent;
    } else if (widget.leadStatus == "Won") {
      leadStatusColor = Colors.green;
    } else if (widget.leadStatus == "Lost") {
      leadStatusColor = Colors.red;
    } else {
      leadStatusColor = Colors.purple;
    }

    return SizedBox(
      height: 140.0,
      child: GestureDetector(
        onTap: widget.onPressed ?? onTap,
        child: Card(
          elevation: 3.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: Row(
            children: [
              Container(
                color: leadPriorityColor,
                width: 6.0,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0),
                      Text(
                        widget.leadName!,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        "Closing date : ${widget.leadClosingDate}",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.leadCompanyName!,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.leadPersonName!,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.phoneNumber!,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.salesPersonName!,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 5.0,
                      bottom: 5.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: leadStatusColor,
                    ),
                    child: Text(
                      widget.leadStatus!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  Container(
                    width: 42.5,
                    height: 42.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      image: imageUrl.isNotEmpty
                          ? DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
