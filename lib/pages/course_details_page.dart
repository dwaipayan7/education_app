import 'package:education_app/models/course.dart';
import 'package:education_app/utils/color.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:education_app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';

import '../widgets/description.dart';
import '../widgets/my_tab_view.dart';
import '../widgets/playlist.dart';

class CourseDetailsPage extends StatefulWidget {
  final Course course;
  const CourseDetailsPage({
    super.key,
    required this.course,
  });

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                    height: 40,
                    width: 40,
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: 102,
                  ),
                  Text(
                    "Flutter",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              MyVideoPlayer(),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.course.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "Author: ${widget.course.author}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: Colors.black45,
                  ),
                  Text(
                    "4.8",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  Text(
                    "   72 Hours",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                  Spacer(),
                  Text(
                    "\$50",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: primaryColor1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              MyTabView(
                changeTab: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                 currentIndex: selectedIndex,
              ),

              selectedIndex == 0 ? Playlist() : Description(),

            ],
          ),
        ),
      ),
    );
  }
}
