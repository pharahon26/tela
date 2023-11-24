
import 'package:mobile/services/TelaNotification.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/place_service.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:mobile/services/transaction_service.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/IdentificationView/identificationView.dart';
import 'package:mobile/ui/views/LoginView/loginView.dart';
import 'package:mobile/ui/views/SignInView/signInView.dart';
import 'package:mobile/ui/views/acceuil/acceuil.dart';
import 'package:mobile/ui/views/buyAbonnement/buyabonnement.dart';
import 'package:mobile/ui/views/buyVisitePass/buyVisitePass.dart';
import 'package:mobile/ui/views/cgu/cgu.dart';
import 'package:mobile/ui/views/cguFinance/cguFinance.dart';
import 'package:mobile/ui/views/ebank/bank_resume/bank.dart';
import 'package:mobile/ui/views/ebank/buyPassView/buyPassView.dart';
import 'package:mobile/ui/views/ebank/buyView/buyView.dart';
import 'package:mobile/ui/views/ebank/depot/depot.dart';
import 'package:mobile/ui/views/ebank/versement/versement.dart';
import 'package:mobile/ui/views/immo/catalogue/catalogue.dart';
import 'package:mobile/ui/views/immo/modifPlace/modifPlace.dart';
import 'package:mobile/ui/views/immo/myVisite/myVisite.dart';
import 'package:mobile/ui/views/immo/newPlace/newPlace.dart';
import 'package:mobile/ui/views/immo/recherche/recherche.dart';
import 'package:mobile/ui/views/immo/resultat/resultat.dart';
import 'package:mobile/ui/views/immo/visite/visite.dart';
import 'package:mobile/ui/views/profile/profile.dart';
import 'package:mobile/ui/views/tv/chaneltv/channeltv.dart';
import 'package:mobile/ui/views/tv/programmetv/programmetv.dart';
import 'package:mobile/ui/views/tv/tv/tv.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';




@StackedApp(
    routes:[
      MaterialRoute(page: Acceuil, initial: true),
      MaterialRoute(page: ConditionGeneralDUtilisationS),
      MaterialRoute(page: ConditionGeneralDUtilisationSFinance),
      MaterialRoute(page: Profile),
      MaterialRoute(page: SignInView),
      MaterialRoute(page: IdentificationView),
      MaterialRoute(page: LoginView),
      MaterialRoute(page: Bank),
      MaterialRoute(page: Depot),
      MaterialRoute(page: Versement),
      MaterialRoute(page: Catalogue),
      MaterialRoute(page: MyVisite),
      MaterialRoute(page: NewPlace),
      MaterialRoute(page: ModifPlace),
      MaterialRoute(page: Recherche),
      MaterialRoute(page: Resultat),
      MaterialRoute(page: Visite),
      MaterialRoute(page: ProgrammeTv),
      MaterialRoute(page: ChanelTv),
      MaterialRoute(page: Tv),
      MaterialRoute(page: BuyView),
      MaterialRoute(page: BuyVisitePass),
      MaterialRoute(page: BuyPassView),
      MaterialRoute(page: BuyAbonnement),
    ],
    dependencies: [
      InitializableSingleton(classType: TelaSharedPrefs),
      // InitializableSingleton(classType: TelaNotification),
      Singleton(classType: AuthService),
      Singleton(classType: PlaceService),
      Singleton(classType: TransactionService),
      Singleton(classType: TVService),
      LazySingleton(classType: NavigationService),
      LazySingleton(classType: DialogService),
      LazySingleton(classType: BottomSheetService),
      LazySingleton(classType: SnackbarService),
    ]
)
class appSetup {
}