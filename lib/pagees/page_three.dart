import 'package:event_new/services/analytics_service.dart';
import 'package:flutter/material.dart';

class PageThreeScreen extends StatefulWidget {
  const PageThreeScreen({super.key});

  @override
  State<PageThreeScreen> createState() => _PageThreeScreenState();
}

class _PageThreeScreenState extends State<PageThreeScreen> {
  final analytics = AnalyticsService();
  @override
  void initState() {
    analytics.logScreen('page_three');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('page three'),
      ),
      body: Center(child: Text('Page three')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        analytics.logLogin('third_button_clicked');
      }, tooltip: 'Increment', child: const Icon(Icons.add)),
    );
  }
}
