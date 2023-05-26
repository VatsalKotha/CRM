
import 'package:crm/screens/home/report/meeting_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/image_string.dart';

class MeetingCardWidget extends StatefulWidget {
  const MeetingCardWidget({Key? key}) : super(key: key);

  @override
  State<MeetingCardWidget> createState() => _MeetingCardWidgetState();
}

class _MeetingCardWidgetState extends State<MeetingCardWidget> {
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
          padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.calendar_month_outlined),
              const SizedBox(width: 8.0),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [

                    // Meeting Type
                    Text(
                      "Meeting Type",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // Lead title
                    Text(
                      "Meeting Title",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE47522),
                      ),
                    ),
                    SizedBox(height: 3.0),

                    // closing date

                    // Company Name
                    Text(
                      "Company Name",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    // Person Name
                    Text(
                      "10:00 to 11:30",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Description
                    SizedBox(height: 2.0),
                    Text(
                      "This is the sample This is the sample This is the sample This is the sample This is the sample ",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
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
                children: [
                  // sized box for
                  const SizedBox(height: 65.0),
                  // profile icon
                  Container(
                    width: 30.5,
                    height: 30.5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      image: DecorationImage(
                          image: AssetImage(jLeadCardProfileImage)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
