import 'package:education_app/models/course.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:education_app/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';

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
                    width: 108,
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
              SizedBox(height: 25,),
              MyVideoPlayer(),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}
