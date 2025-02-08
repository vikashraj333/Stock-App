import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_dashboard/reusable_widgets/animated_images.dart';
import 'package:stock_dashboard/reusable_widgets/custom_app_bar.dart';
import 'package:stock_dashboard/reusable_widgets/reusable_row.dart';
import 'package:stock_dashboard/screens/payment.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String symbol;
  final double price;
  final double change;
  final double marketCap;
  final double open;
  final double previousClose;
  final double peRatio;
  final double percentageChange;
  final int volume;

  const DetailScreen({
    super.key,
    required this.symbol,
    required this.title,
    required this.price,
    required this.change,
    required this.marketCap,
    required this.open,
    required this.previousClose,
    required this.peRatio,
    required this.percentageChange,
    required this.volume,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        isBackButton: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImages(),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .067),
              child: Card(
                child: Column(
                  children: [
                    //name of the stock
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // more details of stock
                    ReusableRow(
                      title: 'Price',
                      value: widget.price.toString(),
                    ),
                    ReusableRow(
                      title: 'Symbol',
                      value: widget.symbol,
                    ),
                    ReusableRow(
                        title: 'Opening Price',
                        value: '\$ ${widget.open.toString()}'),
                    ReusableRow(
                        title: 'Previous Close',
                        value: '\$ ${widget.previousClose.toString()}'),
                    ReusableRow(
                        title: 'Market Cap',
                        value: '\$ ${widget.marketCap.toString()}'),
                    ReusableRow(
                        title: 'Percentage Change',
                        value: '${widget.percentageChange.toString()} %'),
                    ReusableRow(
                        title: 'Volume', value: widget.volume.toString()),
                    ReusableRow(
                        title: 'PE Ratio', value: widget.peRatio.toString()),
                    // buy button
                    ElevatedButton(
                        onPressed: () {
                          Get.to(PaymentScreen(price: widget.price),
                              transition: Transition.rightToLeft);
                        },
                        child: Text('Buy at ${widget.price}')),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
