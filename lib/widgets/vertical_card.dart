import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({required this.index, required this.color, required this.list, Key? key}) : super(key: key);

  final int index;
  final Color color;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(85),
          image: DecorationImage(fit: BoxFit.contain, image: ExactAssetImage(list[index])),
        ),
      ),
    );
  }
}
