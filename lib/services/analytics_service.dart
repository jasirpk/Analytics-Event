import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logLogin(String method) async {
    await analytics.logLogin(loginMethod: method);
  }

  Future<void> logButtonClick(String buttonName) async {
    await analytics.logEvent(name: 'button_click', parameters: {"button_name": buttonName});
  }

  Future<void> logPurchase(double amount, String currency) async {
    await analytics.logPurchase(value: amount, currency: currency);
  }

  Future<void> logScreen(String screenName) async {
    await analytics.logScreenView(screenName: screenName);
  }
}
