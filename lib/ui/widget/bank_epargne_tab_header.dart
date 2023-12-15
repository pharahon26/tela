import 'package:flutter/material.dart';
import 'package:tela/app/app.locator.dart';
import 'package:tela/services/auth_service.dart';

class BankEpargneTabHeader extends StatelessWidget {
  BankEpargneTabHeader({Key? key}) : super(key: key);
  final AuthService _authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        children: [
          Text('Mon épargne',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text('X0F ${_authService.bankEpargne?.balance??0}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
