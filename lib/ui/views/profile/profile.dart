import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/ui/views/profile/profileViewModel.dart';
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
            backgroundColor: Theme.of(context).primaryColor,
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
                        child: Text('profile')
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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
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
                    return snapshot.data!?
                    Column(
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
                        Text(model.user!.nom)
                      ],
                    )
                    :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Vous n\'êtes pas connecté!'),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisSize: MainAxisSize.max,
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
                          )
                        ],
                    );
                  case ConnectionState.done:
                    return snapshot.data!?
                    Column(
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
                        Text(model.user!.nom)
                      ],
                    )
                        :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Vous n\'êtes pas connecté!'),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        )
                      ],
                    );
                }

              }
            ),
          )
      ),
    );
  }
}
