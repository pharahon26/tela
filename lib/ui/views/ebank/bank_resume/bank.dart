import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/ebank/bank_resume/bankViewModel.dart';
import 'package:stacked/stacked.dart';

class Bank extends StatefulWidget {
  const Bank({super.key});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BankViewModel>.reactive(
      viewModelBuilder: () => BankViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
          body: Center(child:  Text('Bank Tela'))
      ),
    );
  }
}
