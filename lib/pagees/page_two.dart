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
  final TextEditingController originController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    analytics.logScreen('flight_search_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Search Flights', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            const Text('From', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextField(
              controller: originController,
              decoration: InputDecoration(
                hintText: 'Type Origin Airport (e.g. DEL)',
                prefixIcon: const Icon(Icons.flight_takeoff),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),

            const SizedBox(height: 16),

            const Text('To', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                hintText: 'Type Destination Airport (e.g. DXB)',
                prefixIcon: const Icon(Icons.flight_land),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Search Flights', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  final origin = originController.text.trim();
                  final dest = destinationController.text.trim();
                  analytics.logEvent('flight_search_performed');
                  analytics.logSearchEvent(origin,dest);

                  Navigator.push(context, MaterialPageRoute(builder: (_) => PageThreeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
