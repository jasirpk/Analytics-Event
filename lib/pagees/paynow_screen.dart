import 'package:event_new/pagees/payment_success_screen.dart';
import 'package:event_new/services/analytics_service.dart';
import 'package:flutter/material.dart';

class PayNowScreen extends StatefulWidget {
  const PayNowScreen({super.key});

  @override
  State<PayNowScreen> createState() => _PayNowScreenState();
}

class _PayNowScreenState extends State<PayNowScreen> {
  final analytics = AnalyticsService();
  int selectedMethod = -1;

  @override
  void initState() {
    analytics.logScreen('pay_now_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Flight Summary Card
            _flightSummary(),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            _paymentTile(0, Icons.account_balance_wallet, "UPI"),
            _paymentTile(1, Icons.credit_card, "Credit / Debit Card"),
            _paymentTile(2, Icons.account_balance, "Net Banking"),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedMethod == -1 ? Colors.grey : Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: selectedMethod == -1
                    ? null
                    : () {
                  analytics.logEvent('Pay_Now_Clicked');
                  analytics.logFlightPurchase(
                    amount: 4299.00,
                    currency: "INR",
                    airline: "IndiGo",
                    flightNumber: "6E-214",
                    origin: "DEL",
                    destination: "DXB",
                    departTime: "10:30 AM",
                    arriveTime: "2:10 PM",
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PaymentSuccessScreen()),
                  );
                },
                child: const Text(
                  "Pay ₹ 4,299",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _flightSummary() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Flight Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("IndiGo 6E-214"),
              Text("₹ 4,299",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("DEL → DXB"),
              Text("10:30 AM - 2:10 PM"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentTile(int index, IconData icon, String title) {
    final bool isSelected = selectedMethod == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected)
                const Icon(Icons.check_circle, size: 18, color: Colors.green),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ),
      ),
    );
  }
}

