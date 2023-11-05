import 'package:flutter/material.dart';
import 'package:mobile/ui/views/SignInView/signInViewModel.dart';
import 'package:stacked/stacked.dart';


/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class SignInView extends StatefulWidget {

  SignInView();

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Inscription', style: TextStyle(color: Colors.white)),
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
                          height: 20.0,
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
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Theme.of(context).colorScheme.primary)
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text('Créez votre profile', style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary, letterSpacing: 1.2, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),

                        /// nom field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                labelText: 'Nom',
                                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                            ),
                            onChanged: (value) {
                              model.nom = value;
                            },
                          ),
                        ),
                        /// prenom field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.name,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                labelText: 'Prénoms',
                                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                            ),
                            onChanged: (value) {
                              model.prenom = value;
                            },
                          ),
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
                        /// mail field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.mail_outline,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                labelText: 'E-mail',
                                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                            ),
                            onChanged: (value) {
                              model.mail = value;
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

                        /// confirm password field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !isPasswordVisible,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.vpn_key_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                labelText: 'Confirmer le mote de passe',
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

                              /// check the password
                              setState(() {
                                // if (!value.ma(model.password)) {
                                //
                                // } else {
                                //
                                // }
                              });
                            },
                          ),
                        ),

                        /// IS démarcheur
                        CheckboxListTile(
                            value: model.isDemarcheur,
                            onChanged: (r) {
                              setState(() {
                                model.isDemarcheur = r!;
                              });
                            },
                            title: Text(
                              "Être démarcheur ",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).colorScheme.primary
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      model.fakeSignIn();
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
