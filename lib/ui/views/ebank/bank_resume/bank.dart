import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tela/models/transactions.dart';
import 'package:tela/ui/views/ebank/bank_resume/bankViewModel.dart';
import 'package:tela/ui/views/ebank/compte/compte.dart';
import 'package:tela/ui/views/ebank/epargne/epargne.dart';
import 'package:tela/ui/widget/bank_epargne_tab_header.dart';
import 'package:tela/ui/widget/bank_profile_tab_header.dart';
import 'package:stacked/stacked.dart';

class Bank extends StatefulWidget {
  final bool hasEpargne;
  const Bank({super.key, required this.hasEpargne});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> with SingleTickerProviderStateMixin {

  late TabController tabController;
  static const String _BASE_URL = "http://office.telaci.com/";
  List<Widget> tabHeads = [];
  List<Widget> tabswidget = [];
  double compteBalance = 0;
  double epargneBalance = 0;

  @override
  void initState() {
    super.initState();
    tabswidget.add(const Compte());
    tabHeads.add(  BankProfileTabHeader());
    if (widget.hasEpargne) {
      tabswidget.add(const Epargne());
      tabHeads.add( BankEpargneTabHeader());
    }
    tabController = TabController(length: widget.hasEpargne? 2 : 1, vsync: this);
    tabController.addListener(() {
      setState(() {

      });
    });
    setState(() {

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq =MediaQuery.of(context);
    return ViewModelBuilder<BankViewModel>.reactive(
      viewModelBuilder: () => BankViewModel(),
      builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Visibility(
                visible: model.authService.bankProfile != null,
                replacement: Text('Tela Finance',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.3,
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
                child: Text('Mon espace personnel',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.3,
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
              ),
              elevation: 5,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary,),
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
            body: Scrollbar(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: mq.size.height*1.3,
                  width: mq.size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      /// infos soldes and accounts
                      Visibility(
                        visible: model.authService.bankProfile != null,
                        replacement: SizedBox(
                          height: 50,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            /// nom
                            Row(
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network('$_BASE_URL${model.authService.bankProfile?.photo??''}'),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('${model.authService.bankProfile?.nom??''} ${model.authService.bankProfile?.prenom??''}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                            color: Theme.of(context).colorScheme.primary
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(model.authService.bankProfile?.phone??'',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                            color: Theme.of(context).colorScheme.primary
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Visibility(
                                  visible: !((model.authService.bankProfile?.isValidated)??false),
                                  child: TextButton(
                                    onPressed: () => model.navigateToIdentification(),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50)
                                        )
                                    ),
                                    child: SizedBox(
                                      height: 70,
                                      width: mq.size.width /3,
                                      child: const Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 12),
                                            child: Text('profil Incomplet. Cliquez ici',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            /// Solde Disponible
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Solde',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                              color: Colors.grey
                                          ),
                                        ),
                                      ),
                                      Text('X0F ${(model.authService.bankProfile?.balance??0) + (model.authService.bankEpargne?.balance??0)}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                    mainAxisSize: MainAxisSize.min,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Solde disponible',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                              color: Colors.grey
                                          ),
                                        ),
                                      ),
                                      Text('X0F ${(model.authService.bankProfile?.balance??0) + (model.authService.bankEpargne?.balance??0)}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: !((model.authService.bankProfile?.hasEpargne)??false),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: mq.size.width*0.9,
                                  height: 30,
                                  child: InkWell(
                                    onTap: () => model.navigateToCGUFinance(),
                                    child: Marquee(
                                      text:'Epargnez pendant 06 mois sans débiter votre compte "Epargne" et gagner le double du montant épargné le 07 ème mois*! Cliquez ici pour en savoir plus',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.2,
                                          color: Theme.of(context).colorScheme.primary
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
                            ),
                            TabBar(
                              controller: tabController,
                              tabs: tabHeads,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          visible: model.authService.bankProfile != null,
                          /// auth
                          replacement: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                  onPressed: () => model.navigateToSignIn(),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                  ),
                                  child: const Text('Créer un profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),)),
                              TextButton(
                                  onPressed: () => model.navigateToLogin(),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                                  ),
                                  child: const Text('Se connecter',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),)),
                            ],
                          ) ,
                          /// TAB VIEW
                          child: Container(
                            height: mq.size.height/2.5,
                            width: mq.size.width,
                            child: TabBarView(
                                controller: tabController,
                                children: tabswidget),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
      ,
    );
  }
}
