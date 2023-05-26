import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants/image_string.dart';
import '';

class LeadCardWidget extends StatefulWidget {
  const LeadCardWidget(
      {super.key,
      required this.leadName,
      required this.leadStatus,
      required this.leadClosingDate,
      required this.leadPriority,
      required this.leadCompanyName,
      required this.leadPersonName,
      this.leadDescription,
      this.onPressed,
      this.salesPersonName});

  final String leadPriority;
  final String leadName;
  final String leadClosingDate;
  final String leadCompanyName;
  final String leadPersonName;
  final String leadStatus;
  final String? leadDescription;
  final VoidCallback? onPressed;
  final String? salesPersonName;

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
      'Jash Parmar': 'jash.png'
      // Add more salesperson-image mappings as needed
    };

    final salespersonName = widget.salesPersonName ?? '';

    imageUrl =
        images.containsKey(salespersonName) ? images[salespersonName]! : '';

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

    if (widget.leadPriority == "High") {
      leadPriorityColor = Colors.redAccent;
    } else if (widget.leadPriority == "Medium") {
      leadPriorityColor = Colors.orange;
    } else if (widget.leadPriority == "Low") {
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
              // Lead priority
              Container(
                color: leadPriorityColor,
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
                        widget.leadName,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3.0),

                      // closing date
                      Text(
                        "Closing date : ${widget.leadClosingDate}",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                      // Company Name
                      Text(
                        widget.leadCompanyName,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                      // Person Name
                      Text(
                        widget.leadPersonName,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // Description
                      const SizedBox(height: 2.0),
                      Text(
                        widget.leadDescription!,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 18.0),

              //Lead Status + Associated Sale's Person Profile
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // status of lead
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: leadStatusColor,
                    ),
                    child: Text(
                      widget.leadStatus,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // sized box for
                  const SizedBox(height: 35.0),

                  // profile icon
                  Container(
                    width: 42.5,
                    height: 42.5,
                    decoration: const BoxDecoration(
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
