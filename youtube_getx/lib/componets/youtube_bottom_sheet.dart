import 'package:flutter/material.dart';

class YoutubeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        height: 200,
        color: Colors.white,
      ),
    );
  }
}
