import 'package:flutter/material.dart';
import 'package:mobile/ui/views/ebank/buyView/bankViewModel.dart';
import 'package:stacked/stacked.dart';

import 'dart:async';
import 'dart:math';

import 'package:cinetpay/cinetpay.dart';
import 'package:get/get.dart';


class BuyView extends StatefulWidget {
  final String abonement;
  final double prix;
  const BuyView({super.key, required this.abonement, required this.prix});

  @override
  State<BuyView> createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  TextEditingController amountController = TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  String? message;
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BuyViewModel>.reactive(
      viewModelBuilder: () => BuyViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
              child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          show ? Icon(icon, color: color, size: 150) : Container(),
                          show ? Text(message!) : Container(),
                          show ? const SizedBox(height: 50.0) : Container(),
                          Text(widget.abonement,
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40.0),
                          ElevatedButton(
                            child: const Text("Payer --avec CinetPay--"),
                            onPressed: () async {
                              // String amount = amountController.text;
                              // if (amount.isEmpty) {
                              //   // Mettre une alerte
                              //   return;
                              // }
                              // double _amount;
                              // try {
                              //   _amount = double.parse(amount);
                              //
                              //   if (_amount < 100) {
                              //     // Mettre une alerte
                              //     return;
                              //   }
                              //
                              //   if (_amount > 1500000) {
                              //     // Mettre une alerte
                              //     return;
                              //   }
                              // } catch (exception) {
                              //   return;
                              // }
                              //
                              // amountController.clear();

                              final String transactionId = Random()
                                  .nextInt(100000000)
                                  .toString(); // Mettre en place un endpoint à contacter côté serveur pour générer des ID unique dans votre BD

                              await Get.to(CinetPayCheckout(
                                title: 'Payment Checkout',
                                titleStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                titleBackgroundColor: Theme.of(context).colorScheme.primary,
                                configData: <String, dynamic>{
                                  'apikey': '412126359654bb6ed651509.14435556',
                                  'site_id': int.parse("5865665"),
                                  'notify_url': 'YOUR_NOTIFY_URL'
                                },
                                paymentData: <String, dynamic>{
                                  'transaction_id': transactionId,
                                  'amount': widget.prix.toInt(),
                                  'currency': 'XOF',
                                  'channels': 'ALL',
                                  'description': 'Payment test',
                                },
                                waitResponse: (data) {
                                  if (mounted) {
                                    setState(() {
                                      response = data;
                                      print(response);
                                      icon = data['status'] == 'ACCEPTED'
                                          ? Icons.check_circle
                                          : Icons.mood_bad_rounded;
                                      color = data['status'] == 'ACCEPTED'
                                          ? Colors.green
                                          : Colors.redAccent;
                                      show = true;
                                      Get.back();
                                    });
                                  }
                                },
                                onError: (data) {
                                  if (mounted) {
                                    setState(() {
                                      response = data;
                                      message = response!['description'];
                                      print(response);
                                      icon = Icons.warning_rounded;
                                      color = Colors.yellowAccent;
                                      show = true;
                                      Get.back();
                                    });
                                  }
                                },
                              ));
                            },
                          )
                        ],
                      ),
                    ],
                  )))
      ),
    );
  }
}
