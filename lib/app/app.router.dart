// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:mobile/models/programetv.dart' as _i16;
import 'package:mobile/ui/views/acceuil/acceuil.dart' as _i2;
import 'package:mobile/ui/views/ebank/bank_resume/bank.dart' as _i6;
import 'package:mobile/ui/views/ebank/depot/depot.dart' as _i7;
import 'package:mobile/ui/views/ebank/versement/versement.dart' as _i8;
import 'package:mobile/ui/views/immo/galerie/galerie.dart' as _i9;
import 'package:mobile/ui/views/immo/recherche/recherche.dart' as _i10;
import 'package:mobile/ui/views/immo/resultat/resultat.dart' as _i11;
import 'package:mobile/ui/views/immo/visite/visite.dart' as _i12;
import 'package:mobile/ui/views/LoginView/loginView.dart' as _i5;
import 'package:mobile/ui/views/profile/profile.dart' as _i3;
import 'package:mobile/ui/views/SignInView/signInView.dart' as _i4;
import 'package:mobile/ui/views/tv/programmetv/programmetv.dart' as _i13;
import 'package:mobile/ui/views/tv/tv/tv.dart' as _i14;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;

class Routes {
  static const acceuil = '/';

  static const profile = '/Profile';

  static const signInView = '/sign-in-view';

  static const loginView = '/login-view';

  static const bank = '/Bank';

  static const depot = '/Depot';

  static const versement = '/Versement';

  static const galerie = '/Galerie';

  static const recherche = '/Recherche';

  static const resultat = '/Resultat';

  static const visite = '/Visite';

  static const programmeTv = '/programme-tv';

  static const tv = '/Tv';

  static const all = <String>{
    acceuil,
    profile,
    signInView,
    loginView,
    bank,
    depot,
    versement,
    galerie,
    recherche,
    resultat,
    visite,
    programmeTv,
    tv,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.acceuil,
      page: _i2.Acceuil,
    ),
    _i1.RouteDef(
      Routes.profile,
      page: _i3.Profile,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i4.SignInView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.bank,
      page: _i6.Bank,
    ),
    _i1.RouteDef(
      Routes.depot,
      page: _i7.Depot,
    ),
    _i1.RouteDef(
      Routes.versement,
      page: _i8.Versement,
    ),
    _i1.RouteDef(
      Routes.galerie,
      page: _i9.Galerie,
    ),
    _i1.RouteDef(
      Routes.recherche,
      page: _i10.Recherche,
    ),
    _i1.RouteDef(
      Routes.resultat,
      page: _i11.Resultat,
    ),
    _i1.RouteDef(
      Routes.visite,
      page: _i12.Visite,
    ),
    _i1.RouteDef(
      Routes.programmeTv,
      page: _i13.ProgrammeTv,
    ),
    _i1.RouteDef(
      Routes.tv,
      page: _i14.Tv,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Acceuil: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Acceuil(),
        settings: data,
      );
    },
    _i3.Profile: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Profile(),
        settings: data,
      );
    },
    _i4.SignInView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SignInView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.LoginView(),
        settings: data,
      );
    },
    _i6.Bank: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.Bank(),
        settings: data,
      );
    },
    _i7.Depot: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.Depot(),
        settings: data,
      );
    },
    _i8.Versement: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.Versement(),
        settings: data,
      );
    },
    _i9.Galerie: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.Galerie(),
        settings: data,
      );
    },
    _i10.Recherche: (data) {
      final args = data.getArgs<RechercheArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.Recherche(key: args.key, isBureau: args.isBureau),
        settings: data,
      );
    },
    _i11.Resultat: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.Resultat(),
        settings: data,
      );
    },
    _i12.Visite: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.Visite(),
        settings: data,
      );
    },
    _i13.ProgrammeTv: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ProgrammeTv(),
        settings: data,
      );
    },
    _i14.Tv: (data) {
      final args = data.getArgs<TvArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.Tv(key: args.key, programmeTV: args.programmeTV),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class RechercheArguments {
  const RechercheArguments({
    this.key,
    required this.isBureau,
  });

  final _i15.Key? key;

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

class TvArguments {
  const TvArguments({
    this.key,
    required this.programmeTV,
  });

  final _i15.Key? key;

  final _i16.TelaProgrammeTV programmeTV;

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

extension NavigatorStateExtension on _i17.NavigationService {
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

  Future<dynamic> navigateToGalerie([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.galerie,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecherche({
    _i15.Key? key,
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

  Future<dynamic> navigateToResultat([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resultat,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVisite([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.visite,
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

  Future<dynamic> navigateToTv({
    _i15.Key? key,
    required _i16.TelaProgrammeTV programmeTV,
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

  Future<dynamic> replaceWithGalerie([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.galerie,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecherche({
    _i15.Key? key,
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

  Future<dynamic> replaceWithResultat([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resultat,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVisite([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.visite,
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

  Future<dynamic> replaceWithTv({
    _i15.Key? key,
    required _i16.TelaProgrammeTV programmeTV,
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
}
