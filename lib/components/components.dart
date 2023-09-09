import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

void NavigatorTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

Widget line() => SliverToBoxAdapter(
      child: DottedLine(
        lineThickness: 5,
        dashGradient: [
          Colors.grey,
          Colors.amber,
        ],
        dashGapLength: 0,
      ),
    );
Widget advertisementsContainer() => SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.grey,
        ),
      ),
    );
