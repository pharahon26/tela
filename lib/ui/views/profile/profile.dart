import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/profile/profileViewModel.dart';
import 'package:mobile/ui/widget/profilCliper.dart';
import 'package:stacked/stacked.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text('Tela',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white
              ),
            ),
            elevation: 5,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () { Scaffold.of(context).openDrawer(); },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          drawer: Drawer(
            elevation: 5,
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DrawerHeader(child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    )),
                    TextButton(
                        onPressed: (){
                          model.navigateToAcceuil();
                        },
                        child: Text('Acceuil')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToProfile();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,

                        ),
                        child: Text('profile',
                          style: TextStyle(
                              color: Colors.white
                          ),)
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheLogement();
                        },
                        child: Text('Trouver un logement')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheBureau();
                        },
                        child: Text('Trouver un Bureau')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToTV();
                        },
                        child: Text('Tela TV')
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToEbank();
                        },
                        child: Text('Tela Banking')
                    ),
                  ]),
            ),
          ),
          body: SingleChildScrollView(
            child: Scrollbar(
              child: StreamBuilder<bool>(
                stream: model.isAuth,
                builder: (context, snapshot) {
                  switch(snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                      return snapshot.data!?Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipPath(
                            clipper: ProfileClipper(),
                            child: Container(
                              height: 180,
                              color: Theme.of(context).colorScheme.primary,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${model.user!.nom} ${model.user!.prenom}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: model.user!.isDemarcheur? 18.0 : 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(model.user!.phone,
                                          textAlign: model.user!.isDemarcheur? TextAlign.left : TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:model.user!.isDemarcheur? 18.0 : 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  model.user!.isDemarcheur? Spacer() : SizedBox.shrink(),
                                  model.user!.isDemarcheur? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Solde',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('000000000',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) : SizedBox.shrink(),
                                  model.user!.isDemarcheur? Spacer() : SizedBox.shrink(),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                          onPressed: () => model.navigateToGalery(),
                                          style: TextButton.styleFrom(
                                            alignment: Alignment.centerLeft,
                                            backgroundColor: Colors.white,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
                                            child: Text('Mon Catalogue',style: TextStyle(
                                                color: Theme.of(context).colorScheme.primary,
                                                fontSize:18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Abonnement Visites'),
                                    Text('Actif/inactif'),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.7,
                                indent: 35,
                                endIndent: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Du ...'),
                                    Text('Au ...'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45)
                                    ),
                                    color: Theme.of(context).colorScheme.primary,
                                    child: InkWell(
                                      onTap: () => model.navigateToVisiteAbonnement(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Text('Accédez a notre catalogue de bien immobilier. \n '
                                            'Pour vos besoins en logement et bureaux',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 40,),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Abonnement Démarcheur'),
                                    Text('Actif/inactif'),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.7,
                                indent: 35,
                                endIndent: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Du ...'),
                                    Text('Au ...'),
                                  ],
                                ),
                              ),
                              model.user!.isDemarcheur? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45)
                                    ),
                                    color: Theme.of(context).colorScheme.primary,
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Text('Souscrivez à votre abonnement démarcheur. \n '
                                          'Faite apparaitre vos annonces dans les recherches, gagné de l\'argent.\n'
                                          '\n Consultez nos offres!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ) : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(45)
                                    ),
                                    color: Theme.of(context).colorScheme.primary,
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Text('Devenir démarcheur c\'est simple avec Tela. \n '
                                          'Un Simple profil demarcheur pour publiez vos annonces.\n Consultez nos offres!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      )
                      :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipPath(
                              clipper: ProfileClipper(),
                              child: Container(
                                height: 180,
                                width: double.infinity,
                                color: Theme.of(context).colorScheme.primary,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Vous n\'êtes pas connecté!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                            onPressed: () => model.navigateToSignIn(),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Theme.of(context).colorScheme.primary,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                            ),
                                            child: Text('Créer un profile',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),)),
                                        TextButton(
                                            onPressed: () => model.navigateToLogIn(),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Theme.of(context).colorScheme.primary,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                            ),
                                            child: Text('Se connecter',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),)),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40,),
                            Text('Creez votre compte pour accéder à nos services',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 40,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)
                                ),
                                color: Theme.of(context).colorScheme.primary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Text('Accédez a notre catalogue de bien immobilier. \n '
                                        'Pour vos besoins en logement et bureaux',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)
                                ),
                                color: Theme.of(context).colorScheme.primary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Text('Devenir démarcheur c\'est simple avec Tela. \n '
                                        'Un Simple profil demarcheur pour publiez vos annonces.\n Consultez nos offres!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)
                                ),
                                color: Theme.of(context).colorScheme.primary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Text('Tela TV. \n '
                                        'Divertissement, émission live, accédez à nos programmes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                      );
                    case ConnectionState.done:
                      return snapshot.data!?Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipPath(
                            clipper: ProfileClipper(),
                            child: Container(
                              height: 180,
                              color: Theme.of(context).colorScheme.primary,
                              child: Column(
                                children: [
                                  Text('${model.user!.nom} ${model.user!.prenom}',
                                    textAlign: model.user!.isDemarcheur? TextAlign.right : TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: model.user!.isDemarcheur? 18.0 : 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  model.user!.isDemarcheur? Spacer() : SizedBox.shrink(),
                                  model.user!.isDemarcheur? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Solde',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('000000000',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) : SizedBox.shrink(),
                                  Spacer(),
                                  Text('${model.user!.phone}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:model.user!.isDemarcheur? 18.0 : 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Text('...'),
                          SizedBox(height: 40,),
                          Text('...'),
                        ],
                      )
                          :
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipPath(
                            clipper: ProfileClipper(),
                            child: Container(
                              height: 180,
                              width: double.infinity,
                              color: Theme.of(context).colorScheme.primary,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Vous n\'êtes pas connecté!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () => model.navigateToSignIn(),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context).colorScheme.primary,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                          ),
                                          child: Text('Créer un profile',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),)),
                                      TextButton(
                                          onPressed: () => model.navigateToLogIn(),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context).colorScheme.primary,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                          ),
                                          child: Text('Seconnecter',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),)),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Text('Creez votre compte pour accéder à nos services',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45)
                                ),
                                color: Theme.of(context).colorScheme.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text('Accédez a notre catalogue de bien immobilier. \n '
                                      'Pour vos besoins en logement et bureaux',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45)
                                ),
                                color: Theme.of(context).colorScheme.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text('Devenir démarcheur c\'est simple avec Tela. \n '
                                      'Un Simple profil demarcheur pour publiez vos annonces.\n Consultez nos offres!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45)
                                ),
                                color: Theme.of(context).colorScheme.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Text('Tela TV. \n '
                                      'Divertissement, émission live, accédez à nos programmes',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      );;
                  }

                }
              ),
            ),
          )
      ),
    );
  }
}
