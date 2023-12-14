import 'package:flutter/material.dart';
import 'package:tela/models/abonnement.dart';
import 'package:tela/models/abonnementType.dart';
import 'package:tela/models/transactions.dart';
import 'package:tela/ui/views/ebank/buyView/buyViewModel.dart';
import 'package:stacked/stacked.dart';

import 'dart:async';
import 'dart:math';

import 'package:cinetpay/cinetpay.dart';
import 'package:get/get.dart';


class BuyView extends StatefulWidget {
  final AbonnementType abonement;
  const BuyView({super.key, required this.abonement});

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
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text('Payement',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white
              ),
            ),
            elevation: 5,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          ),
          body: SafeArea(
              child: FutureBuilder<String>(
                future: model.getTransactioNumber(),
                builder: (context, snapshot) {
                  switch(snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                    case ConnectionState.active:
                    return Center(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                show ? Icon(icon, color: color, size: 150) : Container(),
                                show ? Text(message!) : Container(),
                                show ? const SizedBox(height: 50.0) : Container(),
                                Text('${widget.abonement.title} ${widget.abonement.type} : ${widget.abonement.price} FCFA',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  child: Text('Payer ${widget.abonement.price} FCFA avec CinetPay'),
                                  onPressed: () async {

                                    final String transactionId = Random()
                                        .nextInt(100000000)
                                        .toString(); // Mettre en place un endpoint à contacter côté serveur pour générer des ID unique dans votre BD



                                    print('Payement..................................');
                                    /// send abonnement
                                    TelaTransaction _transaction = TelaTransaction(
                                      id: 0,
                                      type: widget.abonement.type,
                                      paymentWay: 'Orange',
                                      transactionNumber: snapshot.data!,
                                      operationId: 'ggggg',
                                      amount: widget.abonement.price.toDouble(),
                                      date: DateTime.now(),
                                    );


                                    await model.pushTransaction(_transaction, widget.abonement);
                                    // await Get.to(CinetPayCheckout(
                                    //   title: 'Payment Tela',
                                    //   titleStyle: const TextStyle(
                                    //       fontSize: 20, fontWeight: FontWeight.bold),
                                    //   titleBackgroundColor: Theme.of(context).colorScheme.primary,
                                    //   configData: <String, dynamic>{
                                    //     'apikey': '412126359654bb6ed651509.14435556',
                                    //     'site_id': int.parse("5865665"),
                                    //   },
                                    //   paymentData: <String, dynamic>{
                                    //     'transaction_id': transactionId,
                                    //     'amount': widget.abonement.price,
                                    //     'currency': 'XOF',
                                    //     'channels': 'ALL',
                                    //     'description': 'Payment test',
                                    //     'customer_name': model.user!.nom,
                                    //     'customer_surname':  model.user!.prenom,
                                    //     'customer_phone_number': model.user!.phone,
                                    //   },
                                    //   waitResponse: (data) async {
                                    //     if (mounted) {
                                    //       print('Payement..................................');
                                    //       response = data;
                                    //       /// send abonnement
                                    //       TelaTransaction _transaction = TelaTransaction(
                                    //           id: 0,
                                    //           type: widget.abonement.type,
                                    //           paymentWay: data['payment_method ']??'Orange',
                                    //           transactionNumber: transactionId,
                                    //           operationId: data['operator_id']??'',
                                    //           amount: double.parse(data['amount']??widget.abonement.price),
                                    //           date: data['date']??'2023-10-26'
                                    //       );
                                    //
                                    //       Abonnement ab = Abonnement(
                                    //           id: 0,
                                    //           type: widget.abonement.type,
                                    //           userId: model.user!.id,
                                    //           transactionId: int.parse(transactionId),
                                    //           abonnementTypeID: widget.abonement.id,
                                    //           start: DateTime.now(),
                                    //           end: DateUtils.addMonthsToMonthDate(DateTime.now(), 1),
                                    //           abonnementType: widget.abonement
                                    //       );
                                    //
                                    //       await model.pushTransaction(_transaction, ab);
                                    //
                                    //       if (data['status'] == 'ACCEPTED') {
                                    //         /// create transaction
                                    //
                                    //
                                    //         /// save transaction to server and pop out after dialog
                                    //
                                    //       }
                                    //       setState(() {
                                    //         print(response);
                                    //         icon = data['status'] == 'ACCEPTED'
                                    //             ? Icons.check_circle
                                    //             : Icons.mood_bad_rounded;
                                    //         color = data['status'] == 'ACCEPTED'
                                    //             ? Colors.green
                                    //             : Colors.redAccent;
                                    //         show = true;
                                    //         Get.back();
                                    //       });
                                    //     }
                                    //   },
                                    //   onError: (data) {
                                    //     if (mounted) {
                                    //       print('Error Payement');
                                    //       setState(() {
                                    //         response = data;
                                    //         message = response!['description'];
                                    //         print(response);
                                    //         icon = Icons.warning_rounded;
                                    //         color = Colors.yellowAccent;
                                    //         show = true;
                                    //         Get.back();
                                    //       });
                                    //     }
                                    //   },
                                    // ));
                                  },
                                )
                              ],
                            ),
                          ],
                        ));
                    case ConnectionState.done:
                    return Center(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                show ? Icon(icon, color: color, size: 150) : Container(),
                                show ? Text(message!) : Container(),
                                show ? const SizedBox(height: 50.0) : Container(),
                                Text('${widget.abonement.title} ${widget.abonement.type} : ${widget.abonement.price} FCFA',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  child: Text('Payer ${widget.abonement.price} FCFA avec CinetPay'),
                                  onPressed: () async {

                                    final String transactionId = Random()
                                        .nextInt(100000000)
                                        .toString(); // Mettre en place un endpoint à contacter côté serveur pour générer des ID unique dans votre BD



                                    print('Payement..................................');
                                    /// send abonnement
                                    TelaTransaction _transaction = TelaTransaction(
                                      id: 0,
                                      type: widget.abonement.type,
                                      paymentWay: 'Orange',
                                      transactionNumber: transactionId,
                                      operationId: 'ggggg',
                                      amount: widget.abonement.price.toDouble(),
                                      date: DateTime.now(),
                                    );


                                    await model.pushTransaction(_transaction, widget.abonement);
                                    // await Get.to(CinetPayCheckout(
                                    //   title: 'Payment Tela',
                                    //   titleStyle: const TextStyle(
                                    //       fontSize: 20, fontWeight: FontWeight.bold),
                                    //   titleBackgroundColor: Theme.of(context).colorScheme.primary,
                                    //   configData: <String, dynamic>{
                                    //     'apikey': '412126359654bb6ed651509.14435556',
                                    //     'site_id': int.parse("5865665"),
                                    //   },
                                    //   paymentData: <String, dynamic>{
                                    //     'transaction_id': transactionId,
                                    //     'amount': widget.abonement.price,
                                    //     'currency': 'XOF',
                                    //     'channels': 'ALL',
                                    //     'description': 'Payment test',
                                    //     'customer_name': model.user!.nom,
                                    //     'customer_surname':  model.user!.prenom,
                                    //     'customer_phone_number': model.user!.phone,
                                    //   },
                                    //   waitResponse: (data) async {
                                    //     if (mounted) {
                                    //       print('Payement..................................');
                                    //       response = data;
                                    //       /// send abonnement
                                    //       TelaTransaction _transaction = TelaTransaction(
                                    //           id: 0,
                                    //           type: widget.abonement.type,
                                    //           paymentWay: data['payment_method ']??'Orange',
                                    //           transactionNumber: transactionId,
                                    //           operationId: data['operator_id']??'',
                                    //           amount: double.parse(data['amount']??widget.abonement.price),
                                    //           date: data['date']??'2023-10-26'
                                    //       );
                                    //
                                    //       Abonnement ab = Abonnement(
                                    //           id: 0,
                                    //           type: widget.abonement.type,
                                    //           userId: model.user!.id,
                                    //           transactionId: int.parse(transactionId),
                                    //           abonnementTypeID: widget.abonement.id,
                                    //           start: DateTime.now(),
                                    //           end: DateUtils.addMonthsToMonthDate(DateTime.now(), 1),
                                    //           abonnementType: widget.abonement
                                    //       );
                                    //
                                    //       await model.pushTransaction(_transaction, ab);
                                    //
                                    //       if (data['status'] == 'ACCEPTED') {
                                    //         /// create transaction
                                    //
                                    //
                                    //         /// save transaction to server and pop out after dialog
                                    //
                                    //       }
                                    //       setState(() {
                                    //         print(response);
                                    //         icon = data['status'] == 'ACCEPTED'
                                    //             ? Icons.check_circle
                                    //             : Icons.mood_bad_rounded;
                                    //         color = data['status'] == 'ACCEPTED'
                                    //             ? Colors.green
                                    //             : Colors.redAccent;
                                    //         show = true;
                                    //         Get.back();
                                    //       });
                                    //     }
                                    //   },
                                    //   onError: (data) {
                                    //     if (mounted) {
                                    //       print('Error Payement');
                                    //       setState(() {
                                    //         response = data;
                                    //         message = response!['description'];
                                    //         print(response);
                                    //         icon = Icons.warning_rounded;
                                    //         color = Colors.yellowAccent;
                                    //         show = true;
                                    //         Get.back();
                                    //       });
                                    //     }
                                    //   },
                                    // ));
                                  },
                                )
                              ],
                            ),
                          ],
                        ));
                  }

                }
              ))
      ),
    );
  }
}
