import 'package:flutter/material.dart';

import 'DashboardRecentCompleted.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [SizedBox(height: 8.0), DashboardRecentCompleted()],
      ),
    );
  }
}
