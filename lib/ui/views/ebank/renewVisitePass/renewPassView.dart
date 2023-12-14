import 'package:flutter/material.dart';
import 'package:tela/models/abonnement.dart';
import 'package:tela/models/abonnementType.dart';
import 'package:tela/models/transactions.dart';
import 'package:tela/ui/views/ebank/renewVisitePass/renewPassViewModel.dart';
import 'package:stacked/stacked.dart';

import 'dart:async';
import 'dart:math';

import 'package:cinetpay/cinetpay.dart';
import 'package:get/get.dart';


class RenewPassView extends StatefulWidget {
  final PassType pass;
  final PassVisite passVisite;
  const RenewPassView({super.key, required this.pass, required this.passVisite});

  @override
  State<RenewPassView> createState() => _RenewPassViewState();
}

class _RenewPassViewState extends State<RenewPassView> {
  TextEditingController amountController = TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  String? message;
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RenewPassViewModel>.reactive(
      viewModelBuilder: () => RenewPassViewModel(),
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
                future: model.getTransactioNumber(widget.pass),
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
                                Text('${widget.pass.name} \n${widget.pass.numberOfVisites} Visites : ${widget.pass.price} FCFA',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40.0),
                                ElevatedButton(
                                  child: Text('Payer ${widget.pass.price} FCFA avec CinetPay'),
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

                                    ///  call get transaction id

                                    print('Payement..................................');
                                    /// send abonnement
                                    TelaTransaction _transaction = TelaTransaction(
                                      id: 0,
                                      type: widget.pass.isVisite? 'PassVisite' : 'passTv',
                                      paymentWay: 'Orange',
                                      transactionNumber: snapshot.data!,
                                      operationId: 'ggggg',
                                      amount:double.parse( widget.pass.price),
                                      date: DateTime.now(),
                                    );
                                    /// send to serveur transaction scheme and pass type por creation

                                    await model.pushTransaction(_transaction, widget.pass, widget.passVisite);
                                    await Get.to(CinetPayCheckout(
                                      title: 'Payment Tela',
                                      titleStyle: const TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                      titleBackgroundColor: Theme.of(context).colorScheme.primary,
                                      configData: <String, dynamic>{
                                        'apikey': '412126359654bb6ed651509.14435556',
                                        'site_id': int.parse("5865665"),
                                      },
                                      paymentData: <String, dynamic>{
                                        'transaction_id': snapshot.data!,
                                        'amount': widget.pass.price,
                                        'currency': 'XOF',
                                        'channels': 'ALL',
                                        'description': 'Payment test',
                                        'customer_name': model.user!.nom,
                                        'customer_surname':  model.user!.prenom,
                                        'customer_phone_number': model.user!.phone,
                                      },
                                      waitResponse: (data) async {
                                        if (mounted) {
                                          print('Payement..................................');
                                          response = data;
                                          /// send abonnement
                                          TelaTransaction _transaction = TelaTransaction(
                                              id: 0,
                                              type: widget.pass.isVisite? 'PassVisite' : 'passTv',
                                              paymentWay: data['payment_method ']??'Orange',
                                              transactionNumber: snapshot.data!,
                                              operationId: data['operator_id']??'',
                                              amount: double.parse(data['amount']??widget.pass.price),
                                              date: data['date']??'2023-10-26'
                                          );

                                          await model.pushTransaction(_transaction, widget.pass, widget.passVisite)
                                              .then((value) => showDialog(context: context, builder: (buildContext) => Dialog(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                                                  child: Text(value != null? 'Pass : ${value.code}' : 'erreur innatendue',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 20,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w600,
                                                        letterSpacing: 1.1
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextButton(
                                                      onPressed: () =>  model.navigateToProfile(),
                                                      child: Text('Ok',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Theme.of(context).colorScheme.primary,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w600
                                                        ),
                                                      )
                                                  ),
                                                )

                                              ],
                                            ),

                                          ))
                                          );

                                          if (data['status'] == 'ACCEPTED') {
                                            /// create transaction
                                            await model.pushTransaction(_transaction, widget.pass, widget.passVisite);

                                          }
                                          setState(() {
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
                                          print('Error Payement');
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
                                  Text('${widget.pass.name} \n${widget.pass.numberOfVisites} Visites : ${widget.pass.price} FCFA',
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 40.0),
                                  ElevatedButton(
                                    child: Text('Payer ${widget.pass.price} FCFA avec CinetPay'),
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

                                      ///  call get transaction id

                                      print('Payement..................................');
                                      /// send abonnement
                                      TelaTransaction _transaction = TelaTransaction(
                                        id: 0,
                                        type: widget.pass.isVisite? 'PassVisite' : 'passTv',
                                        paymentWay: 'Orange',
                                        transactionNumber: snapshot.data!,
                                        operationId: 'ggggg',
                                        amount:double.parse( widget.pass.price),
                                        date: DateTime.now(),
                                      );
                                      /// send to serveur transaction scheme and pass type por creation

                                      await model.pushTransaction(_transaction, widget.pass, widget.passVisite);
                                      await Get.to(CinetPayCheckout(
                                        title: 'Payment Tela',
                                        titleStyle: const TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold),
                                        titleBackgroundColor: Theme.of(context).colorScheme.primary,
                                        configData: <String, dynamic>{
                                          'apikey': '412126359654bb6ed651509.14435556',
                                          'site_id': int.parse("5865665"),
                                        },
                                        paymentData: <String, dynamic>{
                                          'transaction_id': snapshot.data!,
                                          'amount': widget.pass.price,
                                          'currency': 'XOF',
                                          'channels': 'ALL',
                                          'description': 'Payment test',
                                          // 'customer_name': model.user!.nom??'',
                                          // 'customer_surname':  model.user!.prenom,
                                          // 'customer_phone_number': model.user?.phone,
                                        },
                                        waitResponse: (data) async {
                                          if (mounted) {
                                            print('Payement..................................');
                                            response = data;
                                            /// send abonnement
                                            TelaTransaction _transaction = TelaTransaction(
                                                id: 0,
                                                type: widget.pass.isVisite? 'PassVisite' : 'passTv',
                                                paymentWay: data['payment_method ']??'Orange',
                                                transactionNumber: snapshot.data!,
                                                operationId: data['operator_id']??'',
                                                amount: double.parse(data['amount']??widget.pass.price),
                                                date: data['date']??'2023-10-26'
                                            );

                                            await model.pushTransaction(_transaction, widget.pass, widget.passVisite)
                                                .then((value) => showDialog(context: context, builder: (buildContext) => Dialog(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30)
                                                  ),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                                                        child: Text(value != null? 'Pass : ${value.code}' : 'erreur innatendue',
                                                          textAlign: TextAlign.center,
                                                          maxLines: 20,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w600,
                                                              letterSpacing: 1.1
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: TextButton(
                                                            onPressed: () =>  model.navigateToProfile(),
                                                            child: Text('Ok',
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  color: Theme.of(context).colorScheme.primary,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.w600
                                                              ),
                                                            )
                                                        ),
                                                      )

                                                    ],
                                                  ),

                                            ))
                                            );

                                            if (data['status'] == 'ACCEPTED') {
                                              /// create transaction
                                              await model.pushTransaction(_transaction, widget.pass, widget.passVisite);

                                            }
                                            setState(() {
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
                                            print('Error Payement');
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
                          ));
                  }

                }
              ))
      ),
    );
  }
}
