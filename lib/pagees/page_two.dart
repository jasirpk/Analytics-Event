import 'package:event_new/pagees/page_three.dart';
import 'package:event_new/services/analytics_service.dart';
import 'package:flutter/material.dart';

class PageTwoScreen extends StatefulWidget {
  const PageTwoScreen({super.key});

  @override
  State<PageTwoScreen> createState() => _PageTwoScreenState();
}

class _PageTwoScreenState extends State<PageTwoScreen> {
  final analytics = AnalyticsService();
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    // analytics.logScreen('page_two');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('page two')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: .center,
          children: [
            Text('Fill From Details', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            TextField(
              controller: originController,
              decoration: InputDecoration(
                hintText: 'Type Origin Airport',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                hintText: 'Type Destination Airport',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(height: 60),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: Text('Search', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageThreeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
