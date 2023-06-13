
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants/image_string.dart';


class DealCardWidget extends StatefulWidget {
  const DealCardWidget({
    super.key,
    required this.dealName,
    required this.dealStatus,
    required this.dealClosingDate,
    required this.dealPriority,
    required this.dealCompanyName,
    required this.dealPersonName,
    this.orderDescription,
    this.onPressed,
  });

  final String dealPriority;
  final String dealName;
  final String dealClosingDate;
  final String dealCompanyName;
  final String dealPersonName;
  final String dealStatus;
  final String? orderDescription;
  final VoidCallback? onPressed;

  @override
  State<DealCardWidget> createState() => _DealCardWidgetState();
}

class _DealCardWidgetState extends State<DealCardWidget> {

  void onTap() {
    if (kDebugMode) {
      print("Card Widget was pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color dealPriorityColor, dealStatusColor;

    if (widget.dealPriority == "High") {
      dealPriorityColor = Colors.redAccent;
    } else if (widget.dealPriority == "Medium") {
      dealPriorityColor = Colors.orange;
    } else if (widget.dealPriority == "Low") {
      dealPriorityColor = Colors.yellow;
    } else {
      dealPriorityColor = Colors.grey;
    }

    if (widget.dealStatus == "Working") {
      dealStatusColor = Colors.blueAccent;
    } else if (widget.dealStatus == "Completed") {
      dealStatusColor = Colors.green;
    } else if (widget.dealStatus == "Lost") {
      dealStatusColor = Colors.red;
    } else {
      dealStatusColor = Colors.purple;
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

              // deal priority
              Container(
                color: dealPriorityColor,
                width: 6.0,
              ),

              // deal Details : deal name, closing date, company name, person name, description
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0),
                      // deal title
                      Text(
                        widget.dealName,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3.0),

                      // closing date
                      Text(
                        "Closing date : ${widget.dealClosingDate}",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                      // Company Name
                      Text(
                        widget.dealCompanyName,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                      // Person Name
                      Text(
                        widget.dealPersonName,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // order description
                      const SizedBox(height: 2.0),
                      Text(
                        widget.orderDescription ?? " ",
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

              //deal Status + Associated Sale's Person Profile
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // status of deal
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: dealStatusColor,
                    ),
                    child: Text(
                      widget.dealStatus,
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
                      image: DecorationImage(
                          image: AssetImage(jLeadCardProfileImage)),
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
