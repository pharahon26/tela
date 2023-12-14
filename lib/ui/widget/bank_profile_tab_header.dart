import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/auth_service.dart';

class BankProfileTabHeader extends StatelessWidget {
  BankProfileTabHeader({Key? key}) : super(key: key);
  final AuthService _authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        children: [
          Text('Compte',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text('X0F ${_authService.bankProfile?.balance??0}',
            style: TextStyle(
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
