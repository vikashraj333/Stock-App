import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_dashboard/controllers/stocks_controller.dart';
import 'package:stock_dashboard/reusable_widgets/animated_images.dart';
import 'package:stock_dashboard/reusable_widgets/custom_app_bar.dart';
import 'package:stock_dashboard/reusable_widgets/collapsible_card.dart';

class StockListPage extends StatelessWidget {
  final StockController stockController = Get.put(StockController());

  StockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Stocks App',
        isBackButton: false,
      ),
      body: SafeArea(
        child: Obx(() {
          if (stockController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(children: [
            AnimatedImages(),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              // crerating a list of card showing stocks which some details
              child: ListView.builder(
                itemCount: stockController.stocks.length,
                itemBuilder: (context, index) {
                  final stock = stockController.stocks[index];
                  return CollapsibleCardWidget(
                    title: stock.companyName,
                    symbol: stock.symbol,
                    price: stock.price,
                    change: stock.change,
                    marketCap: stock.marketCap,
                    open: stock.open,
                    previousClose: stock.previousClose,
                    peRatio: stock.peRatio,
                    percentageChange: stock.percentageChange,
                    volume: stock.volume,
                  );
                },
              ),
            ),
          ]);
        }),
      ),
    );
  }
}
