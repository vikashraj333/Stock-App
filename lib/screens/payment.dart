import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:stock_dashboard/controllers/stocks_controller.dart';
import 'package:stock_dashboard/reusable_widgets/custom_app_bar.dart';

class PaymentScreen extends StatefulWidget {
  final double price;
  const PaymentScreen({super.key, required this.price});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay razorpay;
  late var amount;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSucess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_7Fr5XbAUfsAYdY',
      'amount': amount * 100,
      'name': 'Payment',
      'currency': 'USD',
      'description': 'You have to pay',
      'external': {
        'wallets': ['Paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  // succesfull payment
  void handlerPaymentSucess(PaymentSuccessResponse response) {
    debugPrint('Payment Succes');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Payment Success"),
          content: Text("Payment ID: ${response.paymentId}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  //failed payment
  void handlerError(PaymentFailureResponse response) {
    debugPrint('Payment Failed');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Payment Failed"),
          content: Text("Error: ${response.message}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void handlerExternalWallet() {
    debugPrint('External Wallet');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Payment ',
          isBackButton: true,
        ),
        body: GetBuilder<StockController>(
          builder: ((controller) {
            amount = widget.price;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: Text(
                      'Are you Sure to pay',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                        child: Text(
                      'Rs.${widget.price}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              openCheckout();
                            },
                            child: const Text('Proceed to pay'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(' Go Back')),
                        ],
                      ),
                    )
                  ]),
            );
          }),
        ));
  }
}
