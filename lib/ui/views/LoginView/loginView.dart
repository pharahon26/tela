import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'loginViewModel.dart';

/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class LoginView extends StatefulWidget {

  LoginView();

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Connexion', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            elevation: 5,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: _mediaQuery.size.height - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///Info
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        height: 120.0,
                        width: 120.0,
                        child: Image.asset(
                          'assets/images/logo_2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      /// phone field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone_android,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            labelText: 'Numéro de téléphone',
                            labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                          ),
                          onChanged: (value) {
                            model.phone = value;
                          },
                        ),
                      ),

                      /// password field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autofocus: true,
                          keyboardType:  TextInputType.visiblePassword,
                          obscureText: !isPasswordVisible,
                          style: TextStyle(
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              labelText: 'Mot de passe',
                              labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                              enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                              suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                icon: Icon(isPasswordVisible? Icons.visibility_outlined : Icons.visibility_off_outlined ),

                              )
                          ),
                          onChanged: (value) {
                            model.password = value;
                          },
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  model.fakeLogin();
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  fixedSize: Size(_mediaQuery.size.width - 20, 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Text(
                  'Créer le profil',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
