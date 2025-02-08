import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_dashboard/screens/details_screen.dart';
// card widget which can expand and collapse
class CollapsibleCardWidget extends StatefulWidget {
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

  const CollapsibleCardWidget({
    super.key,
    required this.title,
    required this.symbol,
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
  _CollapsibleCardWidgetState createState() => _CollapsibleCardWidgetState();
}

class _CollapsibleCardWidgetState extends State<CollapsibleCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            DetailScreen(
              symbol: widget.symbol,
              title: widget.title,
              price: widget.price.toDouble(),
              change: widget.change,
              marketCap: widget.marketCap,
              open: widget.open,
              previousClose: widget.previousClose,
              peRatio: widget.peRatio,
              percentageChange: widget.percentageChange,
              volume: widget.volume,
            ),
            transition: Transition.rightToLeft);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ListTile(
              leading: Text(widget.symbol),
              title: Text(widget.title),
              subtitle: Text(widget.price.toString()),
              trailing: Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${widget.title}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Current Price: \$${widget.price}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Percentage Change: ${widget.percentageChange} %'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Volume: ${widget.volume}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
