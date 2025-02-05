import 'package:education_app/models/category.dart';
import 'package:education_app/models/course.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'course_details_page.dart';

class CoursePage extends StatefulWidget {
  final Category category;
  const CoursePage({super.key, required this.category});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late List<Course> filteredCourses;

  @override
  void initState() {
    super.initState();
    filteredCourses = courses
        .where((myCourse) => myCourse.categoryName == widget.category.name)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                    height: 35,
                    width: 35,
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back),
                  ),
                  // Spacer(),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "Development",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: filteredCourses.length,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailsPage(course: course),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                course.image,
                                width: 70,
                                fit: BoxFit.cover,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Author ${course.author}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  LinearProgressIndicator(
                                    value: course.completedPercentage,
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.green,
                                    minHeight: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
