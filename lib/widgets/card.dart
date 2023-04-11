import 'package:designers_app_ui/widgets/painter.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';

import '../data/constants/constants.dart';

class CustomCard extends StatelessWidget {
  //const CustomCard({})

  const CustomCard({required this.name, required this.title, required this.color, required this.number, Key? key, required this.onClick}) : super(key: key);

  final String name;
  final String title;
  final Color color;
  final int number;
  final Function(String title) onClick;

  @override
  Widget build(BuildContext context) {
    var colors2 = [
      Colors.purple.shade200,
      Colors.green.shade200,
      Colors.orange.shade200,
      Colors.blue.shade200,
      Colors.pink.shade200,
      Colors.red.shade200,
    ].multiply(times: 2);

    return GestureDetector(
      onTap: () => onClick(title),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 8,
        shadowColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: buildGradient(color: color)),
          child: CustomPaint(
            painter: CardPainter(color: color),
            child: Padding(
              padding: const EdgeInsets.only(right: 22, top: 12, left: 22, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: colors2[number - 1],
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(fit: BoxFit.cover, image: ExactAssetImage(Constants.profile)),
                      ),
                    ),
                  ),
                  10.spaceX(),
                  Expanded(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      20.spaceY(),
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      5.spaceY(),
                      Text('Title: $title', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      20.spaceY(),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Column(
                          children: const [
                            Text('2342', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                            Text('Popularity', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        13.spaceX(),
                        Column(
                          children: const [
                            Text('4736', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                            Text('Like', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        13.spaceX(),
                        Column(
                          children: const [
                            Text('136', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                            Text('followed', style: TextStyle(fontSize: 10)),
                          ],
                        )
                      ]),
                    ]),
                  ),
                  Column(
                    children: [
                      const Icon(Icons.more_horiz, color: Colors.white),
                      //30.spaceY(),
                      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        15.spaceY(),
                        Text('$number', style: const TextStyle(fontSize: 20)),
                        const Text('Ranking', style: TextStyle(fontSize: 12)),
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

LinearGradient buildGradient({required Color color}) => LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
      color.withAlpha(200),
      color,
    ]);
