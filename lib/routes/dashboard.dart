import 'package:designers_app_ui/data/constants/constants.dart';
import 'package:designers_app_ui/main.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/horizontal_card.dart';
import '../widgets/painter.dart';
import '../widgets/vertical_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  var list = ['Designer', 'Category', 'Attention'];
  var list2 = ['Illustration', 'Interface', 'Web Design', 'Technology'];
  //var list3 = [Constants.profile].multiply(times: 6);
  var list3 = [Constants.tech, Constants.web, Constants.spaceship, Constants.laptop, Constants.www, Constants.moon];
  var colors = [Colors.green.shade300, Colors.blue.shade300, Colors.orange.shade300, Colors.pink.shade300];
  var colors2 = [Colors.purple.shade200, Colors.green.shade200, Colors.orange.shade200, Colors.blue.shade200, Colors.teal.shade200, Colors.red.shade200];

  late AnimationController controller;

  ColorScheme? color;

  Animatable<Color?> anim(List<Color> colors) => TweenSequence<Color?>([
        for (var i = 0; i <= colors.length - 2; ++i) TweenSequenceItem(weight: 1.0, tween: ColorTween(begin: colors[i], end: colors[i + 1])),
      ]);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).colorScheme;

    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: AppBarPainter(color: color!.primary),
        child: Scaffold(
          backgroundColor: Colors.transparent,

          /// AppBar
          appBar:
              AppBar(scrolledUnderElevation: 0, leadingWidth: 56, backgroundColor: Colors.transparent, leading: Icon(CupertinoIcons.arrow_left, color: color?.onPrimary), actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(onTap: () => launch(context, Constants.home), child: Icon(Icons.menu, color: color?.onPrimary)),
            )
          ]),

          /// Body

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    /// Profile
                    Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedBuilder(
                        builder: (context, child) {
                          return Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: anim(colors2).evaluate(AlwaysStoppedAnimation(controller.value)),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                              image: const DecorationImage(fit: BoxFit.cover, image: ExactAssetImage(Constants.profile)),
                            ),
                            //duration: const Duration(seconds: 2),
                          );
                        },
                        animation: controller,
                      ),
                    ),
                    16.spaceX(),

                    /// Right
                    Expanded(
                      child: Column(children: [
                        /// Row 1
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              const Text('Kenneth', style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
                              3.spaceY(),
                              Row(children: [const Icon(Icons.location_on, size: 13, color: Colors.white), 5.spaceX(), const Text('China Beijing')])
                            ]),
                          ),
                          MaterialButton(
                            onPressed: () => launch(context, Constants.home),
                            color: Colors.white,
                            minWidth: 35,
                            height: 35,
                            elevation: 1,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Text('Follow', style: TextStyle(color: color?.primary, fontSize: 19, fontWeight: FontWeight.bold)),
                          )
                        ]),
                        30.spaceY(),

                        /// Row 2
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Column(
                            children: [
                              const Text('648', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                              5.spaceY(),
                              const Text('Follow', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('7', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                              5.spaceY(),
                              const Text('Bucket', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('1046', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                              5.spaceY(),
                              const Text('Followers', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ])
                      ]),
                    ),
                  ]),
                ]),
              ),

              50.spaceY(),

              /// BODY

              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Text("Buckets", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.black)),
              ),

              /// HORIZONTAL LIST

              SizedBox(
                height: 85,
                child: ListView.builder(
                    itemExtent: 150,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list2.length,
                    itemBuilder: (_, index) {
                      return HorizontalCard(index:index,color: colors[index], list: list2,);
                    }),
              ),

              10.spaceY(),

              /// ROW
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Shots", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.black)),
                  Row(
                    children: [buildIcon(), 5.spaceX(), buildIcon2()],
                  )
                ]),
              ),

              /// MAIN LIST
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: list3.length,
                    itemBuilder: (_, index) {
                      return VerticalCard(index: index, color: colors2[index], list: list3,);
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 130,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIcon() => Column(
        children: [
          Row(
            children: [buildIconContainer(), 1.spaceX(), buildIconContainer()],
          ),
          1.spaceY(),
          Row(
            children: [buildIconContainer(), 1.spaceX(), buildIconContainer()],
          )
        ],
      );

  Container buildIconContainer() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color!.primary.withAlpha(170), borderRadius: BorderRadius.circular(2)),
    );
  }

  Container buildIcon2() {
    return Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(3)),
    );
  }
}
