import 'package:education_app/utils/color.dart';
import 'package:flutter/material.dart';

class MyTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int currentIndex;

  const MyTabView({
    super.key,
    required this.changeTab,
    required this.currentIndex,
  });

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  static const _tabs = ['Playlist (22)', 'Description'];
  static const _unselectedTextColor = Color(0xFF616161);
  static const _tabBorderRadius = 10.0;
  static const _containerBorderRadius = 12.0;

  Widget _buildTabItem(int index) {
    final isSelected = widget.currentIndex == index;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(_tabBorderRadius),
          onTap: () => widget.changeTab(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: isSelected ? primaryColor1 : Colors.transparent,
              borderRadius: BorderRadius.circular(_tabBorderRadius),
            ),
            child: Text(
              _tabs[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : _unselectedTextColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(_containerBorderRadius),
      ),
      child: Row(
        children: List.generate(
          _tabs.length,
              (index) => _buildTabItem(index),
        ),
      ),
    );
  }
}