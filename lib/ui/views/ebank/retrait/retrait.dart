import 'package:flutter/material.dart';
import 'package:tela/ui/views/ebank/retrait/retraitViewModel.dart';
import 'package:stacked/stacked.dart';

class Retrait extends StatefulWidget {
  const Retrait({super.key});

  @override
  State<Retrait> createState() => _RetraitState();
}

class _RetraitState extends State<Retrait> {
  bool enCours = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<RetraitViewModel>.reactive(
      viewModelBuilder: () => RetraitViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('Retrait',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Theme.of(context).colorScheme.primary,
              ),
            ),
            elevation: 5,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: mq.size.height*0.8,
              child: Column(
                children: [
                  /// SOLDE DISPO
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Solde disponible',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Theme.of(context).colorScheme.primary
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('X0F ${model.authService.bankProfile?.balance??0}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  /// amount field
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: model.montant.toString(),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.attach_money,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        labelText: 'Montant du retrait',
                        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vous devez entrer le montant du dépot';
                        }
                        if (double.parse(value) <=100) {
                          return 'Le montant du dépot doit être supérieur à 100 X0F';
                        }
                        if ((double.parse(value).toInt() % 5) != 0) {
                          return 'Le montant du dépot doit être un multiple de 5';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        model.montant = double.parse(value);
                        model.frais = (model.montant/100) * 3;
                      },
                    ),
                  ),
                  const SizedBox(height: 30,),
                  /// frais
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text('Frais',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Theme.of(context).colorScheme.primary
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('X0F ${model.frais}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  /// SOLDE
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text('Nouveau Solde',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Theme.of(context).colorScheme.primary
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('X0F ${(model.authService.bankProfile?.balance??0) - model.montant}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  /// depot
                  TextButton(onPressed: () {
                    setState(() {
                      enCours = true;
                    });
                    model.retrait().whenComplete(() {
                      setState(() {
                        enCours = false;
                      });
                    });
                  },
                    style: TextButton.styleFrom(
                      elevation: 8,
                      minimumSize: Size(mq.size.width*0.7, 30),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: const StadiumBorder(),
                    ),
                    child: enCours? CircularProgressIndicator(color: Colors.white,) : Text('Retrait',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
