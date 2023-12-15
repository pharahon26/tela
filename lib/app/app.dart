
import 'package:tela/services/auth_service.dart';
import 'package:tela/services/place_service.dart';
import 'package:tela/services/telaSharedPrefs.dart';
import 'package:tela/services/transaction_service.dart';
import 'package:tela/services/tv_service.dart';
import 'package:tela/ui/views/IdentificationView/identificationView.dart';
import 'package:tela/ui/views/LoginView/loginView.dart';
import 'package:tela/ui/views/SignInView/signInView.dart';
import 'package:tela/ui/views/acceuil/acceuil.dart';
import 'package:tela/ui/views/buyAbonnement/buyabonnement.dart';
import 'package:tela/ui/views/buyVisitePass/buyVisitePass.dart';
import 'package:tela/ui/views/camera/camera_view.dart';
import 'package:tela/ui/views/camera/capture.dart';
import 'package:tela/ui/views/cgu/cgu.dart';
import 'package:tela/ui/views/cguFinance/cguFinance.dart';
import 'package:tela/ui/views/ebank/bank_resume/bank.dart';
import 'package:tela/ui/views/ebank/buyAbonnement/buyabonnementEbank.dart';
import 'package:tela/ui/views/ebank/buyPassView/buyPassView.dart';
import 'package:tela/ui/views/ebank/buyView/buyView.dart';
import 'package:tela/ui/views/ebank/depot/depot.dart';
import 'package:tela/ui/views/ebank/ebankLoginView/ebankLoginView.dart';
import 'package:tela/ui/views/ebank/ebankSignInView/ebankSignInView.dart';
import 'package:tela/ui/views/ebank/renewVisitePass/renewPassView.dart';
import 'package:tela/ui/views/ebank/retrait/retrait.dart';
import 'package:tela/ui/views/ebank/versement/versement.dart';
import 'package:tela/ui/views/ebank/versement_ret/versement_ret.dart';
import 'package:tela/ui/views/immo/catalogue/catalogue.dart';
import 'package:tela/ui/views/immo/imageNav/imgeNav.dart';
import 'package:tela/ui/views/immo/maisonVisite/maisonVisite.dart';
import 'package:tela/ui/views/immo/modifPlace/modifPlace.dart';
import 'package:tela/ui/views/immo/myVisite/myVisite.dart';
import 'package:tela/ui/views/immo/newPlace/newPlace.dart';
import 'package:tela/ui/views/immo/recherche/recherche.dart';
import 'package:tela/ui/views/immo/resultat/resultat.dart';
import 'package:tela/ui/views/immo/visite/visite.dart';
import 'package:tela/ui/views/profile/profile.dart';
import 'package:tela/ui/views/tv/bientot.dart';
import 'package:tela/ui/views/tv/chaneltv/channeltv.dart';
import 'package:tela/ui/views/tv/programmetv/programmetv.dart';
import 'package:tela/ui/views/tv/tv/tv.dart';
import 'package:tela/ui/views/tv/tv_live/tv_live.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tela/ui/views/tv_sport/tv_sport.dart';




@StackedApp(
    routes:[
      MaterialRoute(page: Acceuil, initial: true),
      MaterialRoute(page: ConditionGeneralDUtilisationS),
      MaterialRoute(page: ConditionGeneralDUtilisationSFinance),
      MaterialRoute(page: CameraView),
      MaterialRoute(page: CaptureView),
      MaterialRoute(page: Profile),
      MaterialRoute(page: SignInView),
      MaterialRoute(page: IdentificationView),
      MaterialRoute(page: LoginView),
      MaterialRoute(page: Bank),
      MaterialRoute(page: EbankLoginView),
      MaterialRoute(page: EbankSignInView),
      MaterialRoute(page: Depot),
      MaterialRoute(page: Retrait),
      MaterialRoute(page: Versement),
      MaterialRoute(page: VersementRet),
      MaterialRoute(page: Catalogue),
      MaterialRoute(page: MyVisite),
      MaterialRoute(page: NewPlace),
      MaterialRoute(page: ModifPlace),
      MaterialRoute(page: Recherche),
      MaterialRoute(page: Resultat),
      MaterialRoute(page: MaisonVisite),
      MaterialRoute(page: RenewPassView),
      MaterialRoute(page: Visite),
      MaterialRoute(page: ImageNav),
      MaterialRoute(page: ProgrammeTv),
      MaterialRoute(page: ChanelTv),
      MaterialRoute(page: Bientot),
      MaterialRoute(page: Tv),
      MaterialRoute(page: TvSport),
      MaterialRoute(page: TvLive),
      MaterialRoute(page: BuyView),
      MaterialRoute(page: BuyVisitePass),
      MaterialRoute(page: BuyPassView),
      MaterialRoute(page: BuyAbonnement),
      MaterialRoute(page: BuyAbonnementEbank),
    ],
    dependencies: [
      InitializableSingleton(classType: TelaSharedPrefs),
      InitializableSingleton(classType: TVService),
      // InitializableSingleton(classType: TelaNotification),
      Singleton(classType: AuthService),
      Singleton(classType: PlaceService),
      Singleton(classType: TransactionService),
      LazySingleton(classType: NavigationService),
      LazySingleton(classType: DialogService),
      LazySingleton(classType: BottomSheetService),
      LazySingleton(classType: SnackbarService),
    ]
)
class appSetup {
}