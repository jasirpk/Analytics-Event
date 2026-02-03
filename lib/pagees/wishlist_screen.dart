import 'package:event_new/pagees/paynow_screen.dart';
import 'package:event_new/services/analytics_service.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final analytics = AnalyticsService();
  List<bool> isWishListed = [true];
  @override
  void initState() {
    analytics.logScreen('cart_screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('CART')),
      body: ListView.builder(
        itemCount: !isWishListed[0] ? 0 : 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          bool isWishList = isWishListed[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PayNowScreen()));
              analytics.logEvent('Cart_result_page_clicked');
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: MediaQuery.sizeOf(context).height * 0.28,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.flight, size: 20),
                            SizedBox(width: 6),
                            Text("IndiGo", style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Text(
                          "₹ 4,299",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("DEL", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("Delhi", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Icon(Icons.arrow_right_alt, size: 32),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("DXB", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("Dubai", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          children: [
                            Text("10:30 AM", style: TextStyle(fontWeight: FontWeight.w600)),
                            Text("Departure", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("3h 40m", style: TextStyle(fontWeight: FontWeight.w600)),
                            Text("Non-stop", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("2:10 PM", style: TextStyle(fontWeight: FontWeight.w600)),
                            Text("Arrival", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),

                    const Spacer(),

                    Align(
                      alignment: Alignment.centerRight,
                      child: MaterialButton(
                        color: Colors.white,
                        minWidth: 40,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          setState(() {
                            isWishListed[index] = !isWishListed[index];
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Add To Cart"),
                            const SizedBox(width: 6),
                            isWishList ? Icon(Icons.favorite, color: Colors.red) : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
