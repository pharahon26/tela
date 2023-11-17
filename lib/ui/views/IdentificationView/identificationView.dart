import 'package:flutter/material.dart';
import 'package:mobile/ui/views/IdentificationView//identificationViewModel.dart';
import 'package:stacked/stacked.dart';


/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class IdentificationView extends StatefulWidget {

  IdentificationView();

  @override
  _IdentificationViewState createState() => _IdentificationViewState();
}

class _IdentificationViewState extends State<IdentificationView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<IdentificationViewModel>.reactive(
        viewModelBuilder: () => IdentificationViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Identification', style: TextStyle(color: Colors.white)),
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
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('Complétez votre profil pour accéder nos services'),
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




                          Divider(),
                          const Text('Informations',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                          Divider(),

                          /// nom field
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: model.nom,
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
                            child: TextFormField(
                              initialValue: model.prenom,
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
                            child: TextFormField(
                              initialValue: model.phone,
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

                          /// phone2 field
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              autofocus: false,
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
                                model.phone2 = value;
                              },
                            ),
                          ),

                          ///date de naissance

                          /// Lieu de naissance field
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place_outlined,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Lieu de naissance',
                                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                  enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                  focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                              ),
                              onChanged: (value) {
                                model.birthPlace = value;
                              },
                            ),
                          ),

                          /// genre

                          /// nationnalité

                          /// Lieu de residence field
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place_outlined,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Ville de réssidence',
                                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                  enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                  focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                              ),
                              onChanged: (value) {
                                model.villeResidence = value;
                              },
                            ),
                          ),


                          Divider(),
                          const Text('Document d\'identification',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                          Divider(),

                          /// doc number
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.file_present,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Numero de Carte d\'identitée / passeport',
                                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                                  enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                                  focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                              ),
                              onChanged: (value) {
                                model.docNumber = value;
                              },
                            ),
                          ),

                          Divider(),
                          const Text('Document verso',
                            style: TextStyle(
                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                          Divider(),
                          /// doc recto
                          SizedBox(
                            height: _mediaQuery.size.width,
                            child: AspectRatio(
                              aspectRatio: 9/16,
                              child: PageView(
                                children: [
                                  InkWell(
                                    child: model.docRecto != null? Image.file(model.docRecto!,
                                      fit: BoxFit.contain,
                                    )
                                        :
                                    const Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add, color: Colors.black,),
                                          Text('Document recto',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      await model.pickRecto().whenComplete(() {
                                        setState(() {

                                        });
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),

                          /// doc verso
                          Divider(),
                          const Text('Document verso',
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
                                    child: model.docVerso != null? Image.file(model.docVerso!,
                                      fit: BoxFit.contain,
                                    )
                                        :
                                    const Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add, color: Colors.black,),
                                          Text('Document verso',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      await model.pickVerso().whenComplete(() {
                                        setState(() {

                                        });
                                      });
                                    },
                                  )
                                ],
                              ),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: Size(_mediaQuery.size.width - 20, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Je confirme mes informations personnelles',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
