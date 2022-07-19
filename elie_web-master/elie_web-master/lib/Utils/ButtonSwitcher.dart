import 'package:elie_web/Utils/Constants.dart';
import 'package:elie_web/Utils/GradientDivider.dart';
import 'package:flutter/material.dart';

class ButtonSwitcher extends StatefulWidget {
  const ButtonSwitcher({Key? key}) : super(key: key);

  @override
  State<ButtonSwitcher> createState() => _ButtonSwitcherState();
}

class _ButtonSwitcherState extends State<ButtonSwitcher>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final style =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 21, fontFamily: 'NT');

    final labelStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 21, fontFamily: 'NT');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GradientDivider(width: MediaQuery.of(context).size.width),
          TabBar(
            controller: tabController,
            isScrollable: false,
            onTap: (t) {},
            indicator: BoxDecoration(
              gradient: LinearGradient(
                  colors: [highLcolorLight, highLcolorDark],
                  stops: [0.5, 1],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            unselectedLabelStyle: style,
            unselectedLabelColor: Colors.grey.shade600,
            labelColor: Colors.black,
            labelStyle: labelStyle,
            tabs: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'At Home',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'At Salon',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
