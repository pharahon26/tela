// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:mobile/ui/views/acceuil/acceuil.dart' as _i2;
import 'package:mobile/ui/views/ebank/bank_resume/bank.dart' as _i4;
import 'package:mobile/ui/views/ebank/depot/depot.dart' as _i5;
import 'package:mobile/ui/views/ebank/versement/versement.dart' as _i6;
import 'package:mobile/ui/views/immo/galerie/galerie.dart' as _i7;
import 'package:mobile/ui/views/immo/recherche/recherche.dart' as _i8;
import 'package:mobile/ui/views/immo/resultat/resultat.dart' as _i9;
import 'package:mobile/ui/views/immo/visite/visite.dart' as _i10;
import 'package:mobile/ui/views/profile/profile.dart' as _i3;
import 'package:mobile/ui/views/tv/programmetv/programmetv.dart' as _i11;
import 'package:mobile/ui/views/tv/tv/tv.dart' as _i12;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const acceuil = '/';

  static const profile = '/Profile';

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
      Routes.bank,
      page: _i4.Bank,
    ),
    _i1.RouteDef(
      Routes.depot,
      page: _i5.Depot,
    ),
    _i1.RouteDef(
      Routes.versement,
      page: _i6.Versement,
    ),
    _i1.RouteDef(
      Routes.galerie,
      page: _i7.Galerie,
    ),
    _i1.RouteDef(
      Routes.recherche,
      page: _i8.Recherche,
    ),
    _i1.RouteDef(
      Routes.resultat,
      page: _i9.Resultat,
    ),
    _i1.RouteDef(
      Routes.visite,
      page: _i10.Visite,
    ),
    _i1.RouteDef(
      Routes.programmeTv,
      page: _i11.ProgrammeTv,
    ),
    _i1.RouteDef(
      Routes.tv,
      page: _i12.Tv,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Acceuil: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Acceuil(),
        settings: data,
      );
    },
    _i3.Profile: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.Profile(),
        settings: data,
      );
    },
    _i4.Bank: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.Bank(),
        settings: data,
      );
    },
    _i5.Depot: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.Depot(),
        settings: data,
      );
    },
    _i6.Versement: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.Versement(),
        settings: data,
      );
    },
    _i7.Galerie: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.Galerie(),
        settings: data,
      );
    },
    _i8.Recherche: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.Recherche(),
        settings: data,
      );
    },
    _i9.Resultat: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.Resultat(),
        settings: data,
      );
    },
    _i10.Visite: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.Visite(),
        settings: data,
      );
    },
    _i11.ProgrammeTv: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ProgrammeTv(),
        settings: data,
      );
    },
    _i12.Tv: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.Tv(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i14.NavigationService {
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

  Future<dynamic> navigateToRecherche([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.recherche,
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

  Future<dynamic> navigateToTv([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tv,
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

  Future<dynamic> replaceWithRecherche([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.recherche,
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

  Future<dynamic> replaceWithTv([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.tv,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
