import 'dart:developer';

import 'package:designers_app_ui/data/constants/constants.dart';
import 'package:designers_app_ui/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fontresoft/fontresoft.dart';

import '../widgets/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list = ['Designer', 'Category', 'Attention'];

  ColorScheme? color;

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).colorScheme;

    var tabs = list.map((String e) => buildTabs(e)).toList();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(112),
          child: Container(
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: color!.primary, blurRadius: 6)], gradient: buildLinearGradient()),
            child: AppBar(
              shadowColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(20, 5), bottomRight: Radius.elliptical(20, 5)),
              ),
              backgroundColor: Colors.transparent,
              leading: Icon(CupertinoIcons.arrow_left, color: color?.onPrimary),
              actions: [
                GestureDetector(
                  onTap: () => buildLaunch(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.menu, color: color?.onPrimary),
                  ),
                )
              ],
              bottom: TabBar(
                dividerColor: Colors.transparent,
                //indicatorPadding: const EdgeInsets.all(1),
                physics: const NeverScrollableScrollPhysics(),
                labelColor: color?.onPrimary,
                indicatorColor: Colors.white,
                onTap: (index) => log(index.toString()),
                labelPadding: const EdgeInsets.only(bottom: 18),
                unselectedLabelColor: color?.onInverseSurface,
                unselectedLabelStyle: Font.poppins(style: const TextStyle(fontSize: 14)),
                labelStyle: Font.poppins(style: const TextStyle(fontSize: 22)),
                splashFactory: NoSplash.splashFactory,
                tabs: tabs,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildContainer(),
            buildContainer(),
            buildContainer(),
          ],
        ),
      ),
    );
  }

  LinearGradient buildLinearGradient() {
    return const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomRight, colors: [
      Color(0xffd770e8),
      Color(0xffa94cf1),
    ]);
  }

  Text buildTabs(String e) {
    return Text(e);
  }

  SingleChildScrollView buildContainer() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(bottom: 14, left: 20, right: 20, top: 14),
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              CustomCard(name: 'David Borg', title: 'Flying wings', color: Colors.blue.shade300, number: 1, onClick: (_) => buildLaunch()),
              CustomCard(name: 'Lucy', title: 'Growing up trouble', color: Colors.orange.shade300, number: 2, onClick: onClickCard),
              CustomCard(name: 'Jerry Cool West', title: 'Sculptor\'s diary', color: Colors.red.shade300, number: 3, onClick: onClickCard),
              CustomCard(name: 'Bold', title: 'Illustration of little girl', color: Colors.purple.shade300, number: 4, onClick: onClickCard),
              CustomCard(name: 'David Borg', title: 'Flying wings', color: Colors.green.shade300, number: 5, onClick: onClickCard),
              CustomCard(name: 'Lucy', title: 'Growing up trouble', color: Colors.pink.shade300, number: 6, onClick: onClickCard),
              CustomCard(name: 'Jerry Cool West', title: 'Sculptor\'s diary', color: Colors.deepOrange.shade300, number: 7, onClick: onClickCard),
              CustomCard(name: 'Bold', title: 'Flying wings', color: Colors.teal.shade300, number: 8, onClick: onClickCard),
            ],
          ),
        ),
      ),
    );
  }

  buildLaunch() => launch(context, Constants.dashboard);

  onClickCard(String title) => log(title);
}
