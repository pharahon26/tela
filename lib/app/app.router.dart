// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i19;
import 'package:flutter/material.dart';
import 'package:mobile/models/abonnementType.dart' as _i22;
import 'package:mobile/models/place.dart' as _i20;
import 'package:mobile/models/programetv.dart' as _i21;
import 'package:mobile/ui/views/acceuil/acceuil.dart' as _i2;
import 'package:mobile/ui/views/cgu/cgu.dart' as _i3;
import 'package:mobile/ui/views/ebank/bank_resume/bank.dart' as _i7;
import 'package:mobile/ui/views/ebank/buyView/buyView.dart' as _i17;
import 'package:mobile/ui/views/ebank/depot/depot.dart' as _i8;
import 'package:mobile/ui/views/ebank/versement/versement.dart' as _i9;
import 'package:mobile/ui/views/immo/catalogue/catalogue.dart' as _i10;
import 'package:mobile/ui/views/immo/recherche/recherche.dart' as _i11;
import 'package:mobile/ui/views/immo/resultat/resultat.dart' as _i12;
import 'package:mobile/ui/views/immo/visite/visite.dart' as _i13;
import 'package:mobile/ui/views/LoginView/loginView.dart' as _i6;
import 'package:mobile/ui/views/profile/profile.dart' as _i4;
import 'package:mobile/ui/views/SignInView/signInView.dart' as _i5;
import 'package:mobile/ui/views/tv/chaneltv/channeltv.dart' as _i15;
import 'package:mobile/ui/views/tv/programmetv/programmetv.dart' as _i14;
import 'package:mobile/ui/views/tv/tv/tv.dart' as _i16;
import 'package:mobile/ui/views/visiteAbonnement/visiteAbonnement.dart' as _i18;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i23;

class Routes {
  static const acceuil = '/';

  static const conditionGeneralDUtilisationS =
      '/condition-general-dutilisation-s';

  static const profile = '/Profile';

  static const signInView = '/sign-in-view';

  static const loginView = '/login-view';

  static const bank = '/Bank';

  static const depot = '/Depot';

  static const versement = '/Versement';

  static const catalogue = '/Catalogue';

  static const recherche = '/Recherche';

  static const resultat = '/Resultat';

  static const visite = '/Visite';

  static const programmeTv = '/programme-tv';

  static const chanelTv = '/chanel-tv';

  static const tv = '/Tv';

  static const buyView = '/buy-view';

  static const visiteAbonnement = '/visite-abonnement';

  static const all = <String>{
    acceuil,
    conditionGeneralDUtilisationS,
    profile,
    signInView,
    loginView,
    bank,
    depot,
    versement,
    catalogue,
    recherche,
    resultat,
    visite,
    programmeTv,
    chanelTv,
    tv,
    buyView,
    visiteAbonnement,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.acceuil,
      page: _i2.Acceuil,
    ),
    _i1.RouteDef(
      Routes.conditionGeneralDUtilisationS,
      page: _i3.ConditionGeneralDUtilisationS,
    ),
    _i1.RouteDef(
      Routes.profile,
      page: _i4.Profile,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i5.SignInView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.bank,
      page: _i7.Bank,
    ),
    _i1.RouteDef(
      Routes.depot,
      page: _i8.Depot,
    ),
    _i1.RouteDef(
      Routes.versement,
      page: _i9.Versement,
    ),
    _i1.RouteDef(
      Routes.catalogue,
      page: _i10.Catalogue,
    ),
    _i1.RouteDef(
      Routes.recherche,
      page: _i11.Recherche,
    ),
    _i1.RouteDef(
      Routes.resultat,
      page: _i12.Resultat,
    ),
    _i1.RouteDef(
      Routes.visite,
      page: _i13.Visite,
    ),
    _i1.RouteDef(
      Routes.programmeTv,
      page: _i14.ProgrammeTv,
    ),
    _i1.RouteDef(
      Routes.chanelTv,
      page: _i15.ChanelTv,
    ),
    _i1.RouteDef(
      Routes.tv,
      page: _i16.Tv,
    ),
    _i1.RouteDef(
      Routes.buyView,
      page: _i17.BuyView,
    ),
    _i1.RouteDef(
      Routes.visiteAbonnement,
      page: _i18.VisiteAbonnement,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Acceuil: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Acceuil(),
        settings: data,
      );
    },
    _i3.ConditionGeneralDUtilisationS: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.ConditionGeneralDUtilisationS(),
        settings: data,
      );
    },
    _i4.Profile: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.Profile(),
        settings: data,
      );
    },
    _i5.SignInView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.SignInView(),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.LoginView(),
        settings: data,
      );
    },
    _i7.Bank: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.Bank(),
        settings: data,
      );
    },
    _i8.Depot: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.Depot(),
        settings: data,
      );
    },
    _i9.Versement: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.Versement(),
        settings: data,
      );
    },
    _i10.Catalogue: (data) {
      final args = data.getArgs<CatalogueArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.Catalogue(key: args.key, places: args.places),
        settings: data,
      );
    },
    _i11.Recherche: (data) {
      final args = data.getArgs<RechercheArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.Recherche(key: args.key, isBureau: args.isBureau),
        settings: data,
      );
    },
    _i12.Resultat: (data) {
      final args = data.getArgs<ResultatArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.Resultat(key: args.key, places: args.places),
        settings: data,
      );
    },
    _i13.Visite: (data) {
      final args = data.getArgs<VisiteArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.Visite(key: args.key, place: args.place),
        settings: data,
      );
    },
    _i14.ProgrammeTv: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ProgrammeTv(),
        settings: data,
      );
    },
    _i15.ChanelTv: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ChanelTv(),
        settings: data,
      );
    },
    _i16.Tv: (data) {
      final args = data.getArgs<TvArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i16.Tv(key: args.key, programmeTV: args.programmeTV),
        settings: data,
      );
    },
    _i17.BuyView: (data) {
      final args = data.getArgs<BuyViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i17.BuyView(key: args.key, abonement: args.abonement),
        settings: data,
      );
    },
    _i18.VisiteAbonnement: (data) {
      final args = data.getArgs<VisiteAbonnementArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i18.VisiteAbonnement(key: args.key, type: args.type),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CatalogueArguments {
  const CatalogueArguments({
    this.key,
    required this.places,
  });

  final _i19.Key? key;

  final List<_i20.TelaPlace> places;

  @override
  String toString() {
    return '{"key": "$key", "places": "$places"}';
  }

  @override
  bool operator ==(covariant CatalogueArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.places == places;
  }

  @override
  int get hashCode {
    return key.hashCode ^ places.hashCode;
  }
}

class RechercheArguments {
  const RechercheArguments({
    this.key,
    required this.isBureau,
  });

  final _i19.Key? key;

  final bool isBureau;

  @override
  String toString() {
    return '{"key": "$key", "isBureau": "$isBureau"}';
  }

  @override
  bool operator ==(covariant RechercheArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isBureau == isBureau;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isBureau.hashCode;
  }
}

class ResultatArguments {
  const ResultatArguments({
    this.key,
    required this.places,
  });

  final _i19.Key? key;

  final List<_i20.TelaPlace> places;

  @override
  String toString() {
    return '{"key": "$key", "places": "$places"}';
  }

  @override
  bool operator ==(covariant ResultatArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.places == places;
  }

  @override
  int get hashCode {
    return key.hashCode ^ places.hashCode;
  }
}

class VisiteArguments {
  const VisiteArguments({
    this.key,
    required this.place,
  });

  final _i19.Key? key;

  final _i20.TelaPlace place;

  @override
  String toString() {
    return '{"key": "$key", "place": "$place"}';
  }

  @override
  bool operator ==(covariant VisiteArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.place == place;
  }

  @override
  int get hashCode {
    return key.hashCode ^ place.hashCode;
  }
}

class TvArguments {
  const TvArguments({
    this.key,
    required this.programmeTV,
  });

  final _i19.Key? key;

  final _i21.TelaProgrammeTV programmeTV;

  @override
  String toString() {
    return '{"key": "$key", "programmeTV": "$programmeTV"}';
  }

  @override
  bool operator ==(covariant TvArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.programmeTV == programmeTV;
  }

  @override
  int get hashCode {
    return key.hashCode ^ programmeTV.hashCode;
  }
}

class BuyViewArguments {
  const BuyViewArguments({
    this.key,
    required this.abonement,
  });

  final _i19.Key? key;

  final _i22.AbonnementType abonement;

  @override
  String toString() {
    return '{"key": "$key", "abonement": "$abonement"}';
  }

  @override
  bool operator ==(covariant BuyViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.abonement == abonement;
  }

  @override
  int get hashCode {
    return key.hashCode ^ abonement.hashCode;
  }
}

class VisiteAbonnementArguments {
  const VisiteAbonnementArguments({
    this.key,
    required this.type,
  });

  final _i19.Key? key;

  final String type;

  @override
  String toString() {
    return '{"key": "$key", "type": "$type"}';
  }

  @override
  bool operator ==(covariant VisiteAbonnementArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.type == type;
  }

  @override
  int get hashCode {
    return key.hashCode ^ type.hashCode;
  }
}

extension NavigatorStateExtension on _i23.NavigationService {
  Future<dynamic> navigateToAcceuil([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.acceuil,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConditionGeneralDUtilisationS([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.conditionGeneralDUtilisationS,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfile([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profile,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBank([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bank,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDepot([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.depot,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVersement([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.versement,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCatalogue({
    _i19.Key? key,
    required List<_i20.TelaPlace> places,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.catalogue,
        arguments: CatalogueArguments(key: key, places: places),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecherche({
    _i19.Key? key,
    required bool isBureau,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.recherche,
        arguments: RechercheArguments(key: key, isBureau: isBureau),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResultat({
    _i19.Key? key,
    required List<_i20.TelaPlace> places,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resultat,
        arguments: ResultatArguments(key: key, places: places),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVisite({
    _i19.Key? key,
    required _i20.TelaPlace place,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.visite,
        arguments: VisiteArguments(key: key, place: place),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProgrammeTv([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.programmeTv,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChanelTv([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chanelTv,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTv({
    _i19.Key? key,
    required _i21.TelaProgrammeTV programmeTV,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tv,
        arguments: TvArguments(key: key, programmeTV: programmeTV),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyView({
    _i19.Key? key,
    required _i22.AbonnementType abonement,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.buyView,
        arguments: BuyViewArguments(key: key, abonement: abonement),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVisiteAbonnement({
    _i19.Key? key,
    required String type,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.visiteAbonnement,
        arguments: VisiteAbonnementArguments(key: key, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAcceuil([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.acceuil,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConditionGeneralDUtilisationS([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.conditionGeneralDUtilisationS,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfile([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profile,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBank([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bank,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDepot([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.depot,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVersement([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.versement,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCatalogue({
    _i19.Key? key,
    required List<_i20.TelaPlace> places,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.catalogue,
        arguments: CatalogueArguments(key: key, places: places),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecherche({
    _i19.Key? key,
    required bool isBureau,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.recherche,
        arguments: RechercheArguments(key: key, isBureau: isBureau),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResultat({
    _i19.Key? key,
    required List<_i20.TelaPlace> places,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.resultat,
        arguments: ResultatArguments(key: key, places: places),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVisite({
    _i19.Key? key,
    required _i20.TelaPlace place,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.visite,
        arguments: VisiteArguments(key: key, place: place),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProgrammeTv([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.programmeTv,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChanelTv([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chanelTv,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTv({
    _i19.Key? key,
    required _i21.TelaProgrammeTV programmeTV,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.tv,
        arguments: TvArguments(key: key, programmeTV: programmeTV),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyView({
    _i19.Key? key,
    required _i22.AbonnementType abonement,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.buyView,
        arguments: BuyViewArguments(key: key, abonement: abonement),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVisiteAbonnement({
    _i19.Key? key,
    required String type,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.visiteAbonnement,
        arguments: VisiteAbonnementArguments(key: key, type: type),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
