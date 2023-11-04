
import 'package:mobile/ui/views/acceuil/acceuil.dart';
import 'package:mobile/ui/views/ebank/bank_resume/bank.dart';
import 'package:mobile/ui/views/ebank/depot/depot.dart';
import 'package:mobile/ui/views/ebank/versement/versement.dart';
import 'package:mobile/ui/views/immo/galerie/galerie.dart';
import 'package:mobile/ui/views/immo/recherche/recherche.dart';
import 'package:mobile/ui/views/immo/resultat/resultat.dart';
import 'package:mobile/ui/views/immo/visite/visite.dart';
import 'package:mobile/ui/views/profile/profile.dart';
import 'package:mobile/ui/views/tv/programmetv/programmetv.dart';
import 'package:mobile/ui/views/tv/tv/tv.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';




@StackedApp(
    routes:[
      MaterialRoute(page: Acceuil, initial: true),
      MaterialRoute(page: Profile),
      MaterialRoute(page: Bank),
      MaterialRoute(page: Depot),
      MaterialRoute(page: Versement),
      MaterialRoute(page: Galerie),
      MaterialRoute(page: Recherche),
      MaterialRoute(page: Resultat),
      MaterialRoute(page: Visite),
      MaterialRoute(page: ProgrammeTv),
      MaterialRoute(page: Tv),
    ],
    dependencies: [
            LazySingleton(classType: NavigationService),
            LazySingleton(classType: DialogService),
            LazySingleton(classType: BottomSheetService),
            LazySingleton(classType: SnackbarService),
    ]
)
class appSetup {
}