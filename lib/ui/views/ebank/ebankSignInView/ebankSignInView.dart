import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/ui/views/ebank/ebankSignInView/ebankSignInViewModel.dart';
import 'package:stacked/stacked.dart';


/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class EbankSignInView extends StatefulWidget {

  EbankSignInView();

  @override
  _EbankSignInViewState createState() => _EbankSignInViewState();
}

class _EbankSignInViewState extends State<EbankSignInView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<EbankSignInViewModel>.reactive(
        viewModelBuilder: () => EbankSignInViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Inscription', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                elevation: 5,
              ),
              backgroundColor: Colors.white,
              body: Scrollbar(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ///Info
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Divider(),
                            const Text('Photo',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                            Divider(),
                            /// photo
                            SizedBox(
                              height: _mediaQuery.size.width,
                              width: _mediaQuery.size.width,
                              child: InkWell(
                                child: model.photo != null? Image.file(model.photo!,
                                  fit: BoxFit.contain,
                                )
                                    :
                                const Center(
                                  child: Icon(Icons.add),
                                ),
                                onTap: () async {
                                  await model.pickPhoto().whenComplete(() {
                                    setState(() {

                                    });
                                  });
                                },
                              ),
                            ),


                            Divider(),
                            const Text('Informations',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                            Divider(),
                            /// nom field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre nom';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.nom = value;
                                },
                              ),
                            ),
                            /// prenom field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre prénom';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.prenom = value;
                                },
                              ),
                            ),
                            /// phone field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
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
                                    prefixText: '+225',
                                    labelText: 'Numéro de téléphone',
                                    labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                    enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                    focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                                    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre nuùéro de téléphone';
                                  }
                                  if (value.length != 10) {
                                    return 'Entrez un numéro de téléphone valide';
                                  }
                                  return null;
                                },

                                onChanged: (value) {
                                  model.phone = value;
                                },
                              ),
                            ),

                            /// password field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
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
                                    icon: Icon(isPasswordVisible? Icons.visibility_outlined : Icons.visibility_off_outlined , color: isPasswordVisible? Theme.of(context).colorScheme.primary : Colors.black,),

                                  )
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre mot de passe';
                                  }
                                  if (value.length < 8) {
                                    return 'Mot de passe trop court';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.password = value;
                                },
                              ),
                            ),

                            /// confirm password field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrez votre mot de passe à nouveau';
                                  }
                                  if (value!=model.password) {
                                    return 'Assurez vous d\'avoir bien répéter votre mot de passe';
                                  }
                                  return null;
                                },
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

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                  onPressed: () => model.navigateToCGU(),
                                  child: Text('cliquez ICI pour consulter nos conditions générales d\'itulisation',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                              ),
                            ),

                            /// IS démarcheur
                            CheckboxListTile(
                                value: model.isAccepted,
                                onChanged: (r) {
                                  setState(() {
                                    model.isAccepted = r!;
                                  });
                                },
                                title: Text(
                                  "En cochant cette case, je déclare avoir lu et approuvé les conditions générales d'utilisation de la plateforme TELA. Lire nos conditions  \"cliquez plus haut\"",
                                  maxLines: 2,
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
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {

                    if (_formKey.currentState!.validate()) {
                      model.isAccepted?
                      await model.signIn()
                          :
                      showDialog(context: context, builder: (buildContext) => Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Text('Vous dever accepter nos conditions générales d\'itulisation',
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                  onPressed: () => Navigator.pop(buildContext),
                                  child: Text('Retour',
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                              ),
                            )

                          ],
                        ),

                      ));
                      setState(() {
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: model.isAccepted? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary.withOpacity(0.6),
                      fixedSize: Size(_mediaQuery.size.width - 20, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.0),
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
