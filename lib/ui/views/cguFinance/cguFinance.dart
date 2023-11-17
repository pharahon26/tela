import 'package:flutter/material.dart';
import 'package:mobile/ui/views/cguFinance/cguFinanceViewModel.dart';
import 'package:stacked/stacked.dart';

class ConditionGeneralDUtilisationSFinance extends StatefulWidget {
  const ConditionGeneralDUtilisationSFinance({super.key});

  @override
  State<ConditionGeneralDUtilisationSFinance> createState() => _ConditionGeneralDUtilisationSFinanceState();
}

class _ConditionGeneralDUtilisationSFinanceState extends State<ConditionGeneralDUtilisationSFinance> {

  String cgu = """
    TELA, La qualité de démarcheur ou démarcheuse et de visiteur, Les CGU
I-TELA
1- Tela est une plateforme de recherche de logement, d'achat de maison, de vente de marchandises de tous genre. c'est aussi une plateforme sur laquelle nous difusons des publictés et des emissions pour aider les ONG, les orphelinats et autres. A travers celle ci nous organisons des jeux pour interesser la population à nos activités.
II- La qualité de démarcheur, démarcheuse ou visiteur
2- Le démarcheur ou la démarcheuse est celui ou celle qui après s'être inscrit et payer son abonnement peut émettre des photos sur la plateforme dans le but d'être rémunéré chaque fois que ses photos sont consultées
3- Le visiteur est celui qui, est celui qui pour effectuer la recherche d'un logement ou d'une maison à acheter paie des frais de visite avant de consulter les photos de la plateforme.
III- Les conditions générales et règles
1- Le démarcheur ou la démarcheuses s'abonnent au montant de 5000 par mois et émet des photos dans le but d'être rémunéré.
2- Pour être pris en compte (pour être rémunéré) le démarcheur ou la démarcheuse doit émettre 10 photos de 10 maisons tous standing confondu. Les 10 photos doivent présenter obligatoirement la façade de la maison, ou de l'immeuble pour ce qui est des appartements, le salon, les chambres, la salle d'eau, la véranda, le balcon la cour et l'arrière cour, la piscine s'il y a lieu. Le démarcher ou la démarcheuse doit donner les caractéristiques de chaque maison (localisation géographique avec google Map et description normale, nombre de pièce nombre de salles d'eau, niveau d'étage pour les immeubles, le budget et les conditions relatives au cautionnement)
3- Lorsque les photos d'une des maisons que vous avez proposé sont consultées, vous gagnez 10% des frais de consultation payés par le visiteur.
3- un compteur sur vos photos indique le nombre de fois que vos photos ont été consultées.
4- En cliquant sur ce nombre vous apercevrez le montant des frais de visites payés par le visiteur afin de calculer par vous même vos gains. Ainsi donc si une erreur se produit sur votre solde vous pourrez effectuer une réclamation. 4- Les soldes sont actualisés chaque 05 du mois suivant un exercice. Cela est dû au fait que nous travaillons avec un prestataire. Quant aux réclamations elles sont recevables du 05 au 07 du mois suivant un exercice (On entent par exercice chaque période du mois allant 1er au 28, au 30, au 31 en fonction du nombre de jour du mois)
5- Pour être considéré le prochain mois comme étant démarcheur ou démarcheuse, il faut se réabonner entre le 24 et le 26 pour le mois de février; et entre le 26 et le 28 pour les autres mois.
6- Une fois les délais de réabonnement passés, vous avez deux options:
• soit attendre le prochain mois pour vous réabonner
• soit payer une pénalité de 50%: 5000 + 2500 = 7500 FCFA
7- Les dates de réabonnement mentionnées ci-dessus ne concernent pas le 1 er mois d'abonnement vu que vous n'avez pas encore perçu votre solde du 1er mois. Elles rentrent en vigueur juste après le 1er mois, lorsque vous avez perçu votre solde du 1er mois.
8- Pour consulter votre solde disponible, rendez-vous dans Mon Espace personnel.
9- De façon exceptionnelle mais rare, la mise à jour du solde peut connaitre un retard
de 24H au maximum dû à notre prestataire ou à un problème technique.
10- Pour retirer de l'argent, il faut le faire aussi via Mon Espace personnel par le canal des moyens de paiement qui sont précisés. Des frais de retrait sont applicables. Dans votre espace vous pouvez aussi épargner votre argent
11- Le solde dans Mon espace personnel ne doit pas être inférieur à 5 000 FCFA,
12- Le démarcheur ou la démarcheuse peut se désabonner à tout moment sur l'application
13- Des modifications peuvent à tout moment être apportées par TELA; dans ce cas, les démarcheurs, les démarcheuses et les visiteurs seront tenus informés.
TELA
  """;

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<cguFinanceViewModel>.reactive(
      viewModelBuilder: () => cguFinanceViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('CGU', style: TextStyle(color: Colors.white)),
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
          body: SizedBox(
            height: _mediaQuery.size.height,
            width: _mediaQuery.size.width,
            child: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
                    children: [
                      /// title
                      TextSpan(text: 'TELA, La qualité de démarcheur ou démarcheuse et de visiteur, Les CGU'),

                      /// title 2
                      TextSpan(text: 'Conditions Générales d\'utilisation'),

                      /// I
                      TextSpan(text: 'I-TELA'),

                      /// 1
                      TextSpan(text: '1- Tela est une plateforme de recherche de logement, d\'achat de maison, de vente de marchandises de tous genre. c\'est aussi une plateforme sur laquelle nous difusons des publictés et des emissions pour aider les ONG, les orphelinats et autres. A travers celle ci nous organisons des jeux pour interesser la population à nos activités'),

                      /// II
                      TextSpan(text: 'II- La qualité de démarcheur, démarcheuse ou visiteur'),

                      /// 1
                      TextSpan(text: '3- Le visiteur est celui qui, est celui qui pour effectuer la recherche d\'un logement ou d\'une maison à acheter paie des frais de visite avant de consulter les photos de la plateforme.'),

                      /// 2
                      TextSpan(text: 'Conditions Générales d\'utilisation'),

                      /// III
                      TextSpan(text: 'Conditions Générales d\'utilisation'),

                      /// 1
                      TextSpan(text: 'Conditions Générales d\'utilisation'),

                      /// 2
                      TextSpan(text: 'Conditions Générales d\'utilisation'),

                      /// 3
                      TextSpan(text: 'Conditions Générales d\'utilisation'),

                    ]
                  )),
                ),
              ),
            ),
          )
      ),
    );
  }
}
