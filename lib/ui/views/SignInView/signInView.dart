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
                backgroundColor: Theme.of(context).colorScheme.primary,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                elevation: 5,
              ),
              backgroundColor: Colors.white,
              body: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ///Info
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /// photo
                          Divider(),
                          const Text('Photo',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                          Divider(),
                          SizedBox(
                            height: _mediaQuery.size.width,
                            child: AspectRatio(
                              aspectRatio: 9/16,
                              child: PageView(
                                children: [
                                  InkWell(
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
                                  )
                                ],
                              ),
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
                                  prefixText: '+225',
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

                          /// Lieu de naissance field
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: TextField(
                          //     keyboardType: TextInputType.text,
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //     ),
                          //     decoration: InputDecoration(
                          //         icon: Icon(
                          //           Icons.place_outlined,
                          //           color: Theme.of(context).colorScheme.primary,
                          //         ),
                          //         labelText: 'Lieu de naissance',
                          //         labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                          //         enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                          //         focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                          //         hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                          //     ),
                          //     onChanged: (value) {
                          //       model.birthPlace = value;
                          //     },
                          //   ),
                          // ),

                          /// password field
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
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
                              onChanged: (value) {
                                model.password = value;
                              },
                            ),
                          ),

                          /// confirm password field
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
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
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    model.isAccepted? await model.signIn() : showDialog(context: context, builder: (buildContext) => Dialog(
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
