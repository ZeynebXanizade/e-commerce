import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PayMent extends StatefulWidget {
  const PayMent({super.key});

  @override
  State<PayMent> createState() => _PayMentState();
}

class _PayMentState extends State<PayMent> {
  Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(shape: BoxShape.rectangle),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
            onPressed: () {
              makePayment();
            },
            child: const Text("Pay",
                style: TextStyle(
                    fontSize: 23,
                    color: Color(0xfffe9ba1),
                    fontWeight: FontWeight.bold))));
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentInter('20', 'USD');
      var gPay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntentData?['client_secret'] ?? 'default_value',
              style: ThemeMode.dark,
              merchantDisplayName: "Zeyneb",
              googlePay: gPay));
      displayPayment();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> displayPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  createPaymentInter(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount).toString(),
        'currency': currency,
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51Oo2RrBL64c1fQmalxTEs6UE6MEEM6n4zbiuOKp9QPZCOyP4g1tlW06B3qHZgBptZpqoquGkNuCwXffb0N0A7ium00lQEUempk',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

      return jsonDecode(response.body);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price;
  }
}
