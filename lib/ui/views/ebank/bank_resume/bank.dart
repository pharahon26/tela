import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:mobile/ui/views/ebank/bank_resume/bankViewModel.dart';
import 'package:stacked/stacked.dart';

class Bank extends StatefulWidget {
  const Bank({super.key});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<BankViewModel>.reactive(
      viewModelBuilder: () => BankViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text('Tela Finance',
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
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()=>model.navigateToProfile(),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.orange, Colors.deepOrange])
                      ),
                      child: const Text('S\'abonner',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.3,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                        child: Text('Acceuil',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                          ),)
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToProfile();
                        },
                        child: Text('profile',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),)
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheLogement();
                        },
                        child: Text('Trouver un logement',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),)
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToRechercheBureau();
                        },
                        child: Text('Trouver un Bureau',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),)
                    ),
                    TextButton(
                      onPressed: (){
                        model.navigateToEbank();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Text('Tela Finance',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                    ),
                    TextButton(
                        onPressed: (){
                          model.navigateToTV();
                        },
                        child: Text('Tela TV',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),)
                    ),
                  ]),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Mon espace personnel',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Akaffou Kanon Ghislain',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              /// Solde
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Solde',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.white
                      ),
                    ),
                    Text('X0F 255.000',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              /// Comptes
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Virement du mois',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Colors.white
                            ),
                          ),
                          Text('X0F 155.000',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Mon épargne',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                color: Colors.white
                            ),
                          ),
                          Text('X0F 100.000',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /// SOLDE DISPO
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Solde disponible',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.white
                      ),
                    ),
                    Text('X0F 250.000',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(onPressed: () => model.navigateToRechercheLogement(),
                      style: TextButton.styleFrom(
                        maximumSize: Size(mq.size.width/4, mq.size.height/6),
                          backgroundColor: Colors.green,
                      ),
                      child: Text('Payer mon Abonnement par Tela',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ),
                    TextButton(onPressed: () => model.navigateToDepot(),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                      ),
                      child: Text('Retrait',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Theme.of(context).colorScheme.background
                        ),
                      ),
                    ),
                    TextButton(onPressed: () => model.navigateToRechercheBureau(),
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary
                      ),
                      child: const Text('Epargner',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: mq.size.width*0.9,
                  height: 30,
                  child: InkWell(
                    onTap: () => model.navigateToCGUFinance(),
                    child: Marquee(
                      text:'Epargnez pendant 06 mois sans débiter votre compte "Epargne" et gagner le double du montant épargné le 07 ème mois*! Cliquez ici pour en savoir plus',
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: Colors.white
                      ),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 200.0,
                      velocity: 40.0,
                      pauseAfterRound: const Duration(seconds: 4),
                      startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 10),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          )
      ),
    );
  }
}
