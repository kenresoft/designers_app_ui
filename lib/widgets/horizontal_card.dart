import 'package:extensionresoft/helper.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({required this.index, required this.color, required this.list, Key? key}) : super(key: key);

  final int index;
  final Color color;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        margin: condition(
          index == 0,
          const EdgeInsets.only(left: 20),
          condition(
            index == 1,
            const EdgeInsets.symmetric(horizontal: 10),
            const EdgeInsets.only(right: 20),
          ),
        ),
        elevation: 3,
        shadowColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
          child: Text(list[index].toString(), style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
