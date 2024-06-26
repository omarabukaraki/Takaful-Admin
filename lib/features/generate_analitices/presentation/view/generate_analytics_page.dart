import 'package:flutter/material.dart';
import 'widget/monthly_post_analysis_component.dart';
import 'widget/monthly_request_analysis_component.dart';
import 'widget/monthly_users_analysis_component.dart';

class GenerateAnalyticsPage extends StatefulWidget {
  const GenerateAnalyticsPage({super.key});

  @override
  State<GenerateAnalyticsPage> createState() => _GenerateAnalyticsPageState();
}

class _GenerateAnalyticsPageState extends State<GenerateAnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MonthlyPostAnalysisComponent(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MonthlyRequestAnalysisComponent(),
                MonthlyUsersAnalysisComponent(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
