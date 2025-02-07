import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text("Flutter is a free, open-source framework for building apps for multiple platforms. It's developed by Google and is based on the Dart programming language.", style: TextStyle(

      ),),
    );
  }
}
