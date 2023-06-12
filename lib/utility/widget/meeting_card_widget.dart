import 'package:crm/screens/home/report/meeting_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/image_string.dart';

class MeetingCardWidget extends StatelessWidget {
  final String salesPerson;
  final String meetingTitle;
  final String companyName;
  final String timeRange;
  final String description;

  const MeetingCardWidget({
    Key? key,
    required this.salesPerson,
    required this.meetingTitle,
    required this.companyName,
    required this.timeRange,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const MeetingDetailScreen()),
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.calendar_month_outlined),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      salesPerson,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      meetingTitle,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE47522),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    Text(
                      companyName,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      timeRange,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      description,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                // children: [
                //   const SizedBox(height: 65.0),
                //   Container(
                //     width: 30.5,
                //     height: 30.5,
                //     decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.yellow,
                //       image: DecorationImage(
                //         image: AssetImage(jLeadCardProfileImage),
                //       ),
                //     ),
                //   ),
                // ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
