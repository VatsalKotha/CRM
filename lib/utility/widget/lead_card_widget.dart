import 'package:flutter/material.dart';
import '../../constants/image_string.dart';

class LeadCardWidget extends StatelessWidget {
   LeadCardWidget({
    super.key,
    required this.leadName,
    required this.leadClosingDate,
    required this.leadCompanyName,
    required this.leadPersonName,
    required this.leadDescription,
    required this.leadPriorityInt,
    required this.leadStatus,
  });

  int leadPriorityInt;
  String? leadName;
  String? leadClosingDate;
  String? leadCompanyName;
  String? leadPersonName;
  String? leadDescription;
  String? leadStatus;

  @override
  Widget build(BuildContext context) {
    Color leadPriorityColor, leadStatusColor;

    if (leadPriorityInt == 3) {
      leadPriorityColor = Colors.redAccent;
    } else if (leadPriorityInt == 2) {
      leadPriorityColor = Colors.orange;
    } else if (leadPriorityInt == 1) {
      leadPriorityColor = Colors.yellow;
    } else {
      leadPriorityColor = Colors.grey;
    }

    if (leadStatus == "New") {
      leadStatusColor = Colors.blueAccent;
    } else if (leadStatus == "Won") {
      leadStatusColor = Colors.green;
    } else if (leadStatus == "Lost") {
      leadStatusColor = Colors.red;
    } else {
      leadStatusColor = Colors.purple;
    }

    return SizedBox(
      height: 140.0,
      child: Card(
        elevation: 3.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Row(
          children: [
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
                      leadName!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3.0),

                    // closing date
                    Text(
                      "Closing date : $leadClosingDate",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // Company Name
                    Text(
                      leadCompanyName!,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // Person Name
                    Text(
                      leadPersonName!,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Description
                    const SizedBox(height: 2.0),
                    Text(
                      leadDescription!,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
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
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: leadStatusColor,
                  ),
                  child: Text(
                    leadStatus!,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),

                // sized box for
                const SizedBox(height: 35.0),

                // profile
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
    );
  }
}
