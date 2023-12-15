import 'package:flutter/material.dart';
import 'package:tela/app/app.locator.dart';
import 'package:tela/services/auth_service.dart';

class BankProfileTabHeader extends StatelessWidget {
  BankProfileTabHeader({Key? key}) : super(key: key);
  final AuthService _authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        children: [
          Text( _authService.user != null?'prochain versement' :'Courant',
            style: TextStyle(
              fontSize:_authService.user != null? 12 : 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text('X0F ${_authService.user != null? _authService.user?.balance??0 : _authService.bankProfile?.balance??0}',
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
