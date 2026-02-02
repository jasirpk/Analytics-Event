import 'package:event_new/pagees/page_two.dart';
import 'package:event_new/services/analytics_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final analytics = AnalyticsService();

  @override
  void initState() {
    // analytics.logScreen('home_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Journey Track", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/flight_img.jpg",),
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PageTwoScreen()));
                },
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text('Flight', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 2)),
                        SizedBox(width: 10,),
                        Icon(Icons.logout)
                      ],
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
}
