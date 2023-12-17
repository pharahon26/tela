import 'package:flutter/material.dart';
import 'package:tela/app/app.locator.dart';
import 'package:tela/services/auth_service.dart';

class BankProfileTabHeader extends StatelessWidget {
  BankProfileTabHeader({Key? key}) : super(key: key);
  final AuthService _authService = locator<AuthService>();

  bool isShowDay = false;

  double balance(){
    double d = 0;
    if (_authService.user != null) {
      d = isShowDay? _authService.user?.balance??0 : 0;
    }  else{
      d = _authService.bankProfile?.balance??0;
    }
    return d;
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Column(
        children: [
          Text( _authService.user != null?'Virement' :'Courant',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: const Text( '(Compte courant)',
              style: TextStyle(
                fontSize: 10 ,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: Colors.deepOrange
              ),
            ),
          ),
          Text('X0F ${balance()}',
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
