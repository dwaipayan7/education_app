import 'package:education_app/models/lesson.dart';
import 'package:education_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ListOfLessons extends StatelessWidget {
  static const _iconSize = 40.0;
  static const _statusIconSize = 30.0;
  static const _spacing = 15.0;
  static const _textOpacity = 0.6;

  final Lesson lesson;

  const ListOfLessons({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final isActive = lesson.isPlaying || lesson.isCompleted;
    final textColor = isActive ? Colors.black : Colors.black.withOpacity(_textOpacity);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPlayIcon(),
          const SizedBox(width: _spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lesson.duration,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: _spacing),
          _buildStatusIcon(),
        ],
      ),
    );
  }

  Widget _buildPlayIcon() {
    return Icon(
      lesson.isPlaying ? Iconsax.play_circle : Iconsax.play_circle5,
      color: lesson.isPlaying
          ? primaryColor1
          : primaryColor1.withOpacity(_textOpacity),
      size: _iconSize,
    );
  }

  Widget _buildStatusIcon() {
    return Icon(
      lesson.isCompleted ? Iconsax.tick_circle : Iconsax.lock,
      color: lesson.isCompleted ? Colors.green : Colors.amber[700],
      size: _statusIconSize,
    );
  }
}