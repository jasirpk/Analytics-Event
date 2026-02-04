import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logLogin(String method) async {
    await analytics.logLogin(loginMethod: method);
  }

  Future<void> logEvent(String buttonName) async {
    await analytics.logEvent(name: 'button_click', parameters: {"button_name": buttonName});
  }

  Future<void> logSearchEvent(String origin, String destination) async {
    await analytics.logEvent(
      name: 'flight_search',
      parameters: {
        'origin': origin.toUpperCase(),
        'destination': destination.toUpperCase(),
      },
    );
  }


  Future<void> logFlightEvent({
    required double amount,
    required String currency,
    required String airline,
    required String flightNumber,
    required String origin,
    required String destination,
    required String departTime,
    required String arriveTime,
  }) async {
    await analytics.logEvent(
      name: 'flight_purchase',
      parameters: {
        'amount': amount,
        'currency': currency,
        'airline': airline,
        'flight_no': flightNumber,
        'origin': origin,
        'destination': destination,
        'depart_time': departTime,
        'arrive_time': arriveTime,
      },
    );
  }


  Future<void> logScreen(String screenName) async {
    await analytics.logScreenView(screenName: screenName);
  }

  Future<void> logFlightPurchase() async {
    await analytics.logPurchase(
      value: 4299.0,
      currency: 'INR',
      transactionId: 'TXN_${DateTime.now().millisecondsSinceEpoch}',
      items: [
        AnalyticsEventItem(
          itemId: '6E-214',
          itemName: 'IndiGo Flight DEL-DXB',
          itemCategory: 'flight',
          price: 4299.0,
          quantity: 1,
          itemBrand: 'IndiGo',
        ),
      ],
    );
  }
}
