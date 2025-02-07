import 'package:education_app/models/lesson.dart';
import 'package:education_app/widgets/list_of_lessons.dart';
import 'package:flutter/material.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context,index){
            return ListOfLessons(lesson: lessonList[index]);
          },
          separatorBuilder: (_, __){
            return SizedBox(height: 20);
          },
          itemCount: lessonList.length,
        padding: EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
      ),
    );
  }
}
