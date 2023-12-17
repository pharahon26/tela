// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i42;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i41;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i47;
import 'package:tela/models/abonnement.dart' as _i45;
import 'package:tela/models/abonnementType.dart' as _i44;
import 'package:tela/models/place.dart' as _i43;
import 'package:tela/models/programetv.dart' as _i46;
import 'package:tela/ui/views/acceuil/acceuil.dart' as _i2;
import 'package:tela/ui/views/buyAbonnement/buyabonnement.dart' as _i39;
import 'package:tela/ui/views/buyVisitePass/buyVisitePass.dart' as _i37;
import 'package:tela/ui/views/camera/camera_view.dart' as _i5;
import 'package:tela/ui/views/camera/capture.dart' as _i6;
import 'package:tela/ui/views/cgu/cgu.dart' as _i3;
import 'package:tela/ui/views/cguFinance/cguFinance.dart' as _i4;
import 'package:tela/ui/views/ebank/bank_resume/bank.dart' as _i13;
import 'package:tela/ui/views/ebank/buyAbonnement/buyabonnementEbank.dart'
    as _i40;
import 'package:tela/ui/views/ebank/buyPassView/buyPassView.dart' as _i38;
import 'package:tela/ui/views/ebank/buyView/buyView.dart' as _i36;
import 'package:tela/ui/views/ebank/depot/depot.dart' as _i16;
import 'package:tela/ui/views/ebank/ebankLoginView/ebankLoginView.dart' as _i14;
import 'package:tela/ui/views/ebank/ebankSignInView/ebankSignInView.dart'
    as _i15;
import 'package:tela/ui/views/ebank/renewVisitePass/renewPassView.dart' as _i27;
import 'package:tela/ui/views/ebank/retrait/retrait.dart' as _i17;
import 'package:tela/ui/views/ebank/versement/versement.dart' as _i18;
import 'package:tela/ui/views/ebank/versement_ret/versement_ret.dart' as _i19;
import 'package:tela/ui/views/IdentificationView/identificationView.dart'
    as _i11;
import 'package:tela/ui/views/immo/catalogue/catalogue.dart' as _i20;
import 'package:tela/ui/views/immo/imageNav/imgeNav.dart' as _i29;
import 'package:tela/ui/views/immo/maisonVisite/maisonVisite.dart' as _i26;
import 'package:tela/ui/views/immo/modifPlace/modifPlace.dart' as _i23;
import 'package:tela/ui/views/immo/myVisite/myVisite.dart' as _i21;
import 'package:tela/ui/views/immo/newPlace/newPlace.dart' as _i22;
import 'package:tela/ui/views/immo/recherche/recherche.dart' as _i24;
import 'package:tela/ui/views/immo/resultat/resultat.dart' as _i25;
import 'package:tela/ui/views/immo/visite/visite.dart' as _i28;
import 'package:tela/ui/views/LoginView/loginView.dart' as _i12;
import 'package:tela/ui/views/passwordChangeView/passwordChangeView.dart'
    as _i8;
import 'package:tela/ui/views/photoChangeView/photoChangeView.dart' as _i9;
import 'package:tela/ui/views/profile/profile.dart' as _i7;
import 'package:tela/ui/views/SignInView/signInView.dart' as _i10;
import 'package:tela/ui/views/tv/bientot.dart' as _i32;
import 'package:tela/ui/views/tv/chaneltv/channeltv.dart' as _i31;
import 'package:tela/ui/views/tv/programmetv/programmetv.dart' as _i30;
import 'package:tela/ui/views/tv/tv/tv.dart' as _i33;
import 'package:tela/ui/views/tv/tv_live/tv_live.dart' as _i35;
import 'package:tela/ui/views/tv_sport/tv_sport.dart' as _i34;

class Routes {
  static const acceuil = '/';

  static const conditionGeneralDUtilisationS =
      '/condition-general-dutilisation-s';

  static const conditionGeneralDUtilisationSFinance =
      '/condition-general-dutilisation-sFinance';

  static const cameraView = '/camera-view';

  static const captureView = '/capture-view';

  static const profile = '/Profile';

  static const passwordChangeView = '/password-change-view';

  static const photoChangeView = '/photo-change-view';

  static const signInView = '/sign-in-view';

  static const identificationView = '/identification-view';

  static const loginView = '/login-view';

  static const bank = '/Bank';

  static const ebankLoginView = '/ebank-login-view';

  static const ebankSignInView = '/ebank-sign-in-view';

  static const depot = '/Depot';

  static const retrait = '/Retrait';

  static const versement = '/Versement';

  static const versementRet = '/versement-ret';

  static const catalogue = '/Catalogue';

  static const myVisite = '/my-visite';

  static const newPlace = '/new-place';

  static const modifPlace = '/modif-place';

  static const recherche = '/Recherche';

  static const resultat = '/Resultat';

  static const maisonVisite = '/maison-visite';

  static const renewPassView = '/renew-pass-view';

  static const visite = '/Visite';

  static const imageNav = '/image-nav';

  static const programmeTv = '/programme-tv';

  static const chanelTv = '/chanel-tv';

  static const bientot = '/Bientot';

  static const tv = '/Tv';

  static const tvSport = '/tv-sport';

  static const tvLive = '/tv-live';

  static const buyView = '/buy-view';

  static const buyVisitePass = '/buy-visite-pass';

  static const buyPassView = '/buy-pass-view';

  static const buyAbonnement = '/buy-abonnement';

  static const buyAbonnementEbank = '/buy-abonnement-ebank';

  static const all = <String>{
    acceuil,
    conditionGeneralDUtilisationS,
    conditionGeneralDUtilisationSFinance,
    cameraView,
    captureView,
    profile,
    passwordChangeView,
    photoChangeView,
    signInView,
    identificationView,
    loginView,
    bank,
    ebankLoginView,
    ebankSignInView,
    depot,
    retrait,
    versement,
    versementRet,
    catalogue,
    myVisite,
    newPlace,
    modifPlace,
    recherche,
    resultat,
    maisonVisite,
    renewPassView,
    visite,
    imageNav,
    programmeTv,
    chanelTv,
    bientot,
    tv,
    tvSport,
    tvLive,
    buyView,
    buyVisitePass,
    buyPassView,
    buyAbonnement,
    buyAbonnementEbank,
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
      Routes.conditionGeneralDUtilisationSFinance,
      page: _i4.ConditionGeneralDUtilisationSFinance,
    ),
    _i1.RouteDef(
      Routes.cameraView,
      page: _i5.CameraView,
    ),
    _i1.RouteDef(
      Routes.captureView,
      page: _i6.CaptureView,
    ),
    _i1.RouteDef(
      Routes.profile,
      page: _i7.Profile,
    ),
    _i1.RouteDef(
      Routes.passwordChangeView,
      page: _i8.PasswordChangeView,
    ),
    _i1.RouteDef(
      Routes.photoChangeView,
      page: _i9.PhotoChangeView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i10.SignInView,
    ),
    _i1.RouteDef(
      Routes.identificationView,
      page: _i11.IdentificationView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i12.LoginView,
    ),
    _i1.RouteDef(
      Routes.bank,
      page: _i13.Bank,
    ),
    _i1.RouteDef(
      Routes.ebankLoginView,
      page: _i14.EbankLoginView,
    ),
    _i1.RouteDef(
      Routes.ebankSignInView,
      page: _i15.EbankSignInView,
    ),
    _i1.RouteDef(
      Routes.depot,
      page: _i16.Depot,
    ),
    _i1.RouteDef(
      Routes.retrait,
      page: _i17.Retrait,
    ),
    _i1.RouteDef(
      Routes.versement,
      page: _i18.Versement,
    ),
    _i1.RouteDef(
      Routes.versementRet,
      page: _i19.VersementRet,
    ),
    _i1.RouteDef(
      Routes.catalogue,
      page: _i20.Catalogue,
    ),
    _i1.RouteDef(
      Routes.myVisite,
      page: _i21.MyVisite,
    ),
    _i1.RouteDef(
      Routes.newPlace,
      page: _i22.NewPlace,
    ),
    _i1.RouteDef(
      Routes.modifPlace,
      page: _i23.ModifPlace,
    ),
    _i1.RouteDef(
      Routes.recherche,
      page: _i24.Recherche,
    ),
    _i1.RouteDef(
      Routes.resultat,
      page: _i25.Resultat,
    ),
    _i1.RouteDef(
      Routes.maisonVisite,
      page: _i26.MaisonVisite,
    ),
    _i1.RouteDef(
      Routes.renewPassView,
      page: _i27.RenewPassView,
    ),
    _i1.RouteDef(
      Routes.visite,
      page: _i28.Visite,
    ),
    _i1.RouteDef(
      Routes.imageNav,
      page: _i29.ImageNav,
    ),
    _i1.RouteDef(
      Routes.programmeTv,
      page: _i30.ProgrammeTv,
    ),
    _i1.RouteDef(
      Routes.chanelTv,
      page: _i31.ChanelTv,
    ),
    _i1.RouteDef(
      Routes.bientot,
      page: _i32.Bientot,
    ),
    _i1.RouteDef(
      Routes.tv,
      page: _i33.Tv,
    ),
    _i1.RouteDef(
      Routes.tvSport,
      page: _i34.TvSport,
    ),
    _i1.RouteDef(
      Routes.tvLive,
      page: _i35.TvLive,
    ),
    _i1.RouteDef(
      Routes.buyView,
      page: _i36.BuyView,
    ),
    _i1.RouteDef(
      Routes.buyVisitePass,
      page: _i37.BuyVisitePass,
    ),
    _i1.RouteDef(
      Routes.buyPassView,
      page: _i38.BuyPassView,
    ),
    _i1.RouteDef(
      Routes.buyAbonnement,
      page: _i39.BuyAbonnement,
    ),
    _i1.RouteDef(
      Routes.buyAbonnementEbank,
      page: _i40.BuyAbonnementEbank,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Acceuil: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Acceuil(),
        settings: data,
      );
    },
    _i3.ConditionGeneralDUtilisationS: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.ConditionGeneralDUtilisationS(),
        settings: data,
      );
    },
    _i4.ConditionGeneralDUtilisationSFinance: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ConditionGeneralDUtilisationSFinance(),
        settings: data,
      );
    },
    _i5.CameraView: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.CameraView(),
        settings: data,
      );
    },
    _i6.CaptureView: (data) {
      final args = data.getArgs<CaptureViewArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CaptureView(key: args.key, image: args.image),
        settings: data,
      );
    },
    _i7.Profile: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.Profile(),
        settings: data,
      );
    },
    _i8.PasswordChangeView: (data) {
      final args = data.getArgs<PasswordChangeViewArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.PasswordChangeView(key: args.key, fromBank: args.fromBank),
        settings: data,
      );
    },
    _i9.PhotoChangeView: (data) {
      final args = data.getArgs<PhotoChangeViewArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.PhotoChangeView(key: args.key, fromBank: args.fromBank),
        settings: data,
      );
    },
    _i10.SignInView: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.SignInView(),
        settings: data,
      );
    },
    _i11.IdentificationView: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.IdentificationView(),
        settings: data,
      );
    },
    _i12.LoginView: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.LoginView(),
        settings: data,
      );
    },
    _i13.Bank: (data) {
      final args = data.getArgs<BankArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.Bank(key: args.key, hasEpargne: args.hasEpargne),
        settings: data,
      );
    },
    _i14.EbankLoginView: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.EbankLoginView(),
        settings: data,
      );
    },
    _i15.EbankSignInView: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.EbankSignInView(),
        settings: data,
      );
    },
    _i16.Depot: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.Depot(),
        settings: data,
      );
    },
    _i17.Retrait: (data) {
      final args = data.getArgs<RetraitArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i17.Retrait(key: args.key, fromEpargne: args.fromEpargne),
        settings: data,
      );
    },
    _i18.Versement: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.Versement(),
        settings: data,
      );
    },
    _i19.VersementRet: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.VersementRet(),
        settings: data,
      );
    },
    _i20.Catalogue: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.Catalogue(),
        settings: data,
      );
    },
    _i21.MyVisite: (data) {
      final args = data.getArgs<MyVisiteArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.MyVisite(key: args.key, place: args.place),
        settings: data,
      );
    },
    _i22.NewPlace: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.NewPlace(),
        settings: data,
      );
    },
    _i23.ModifPlace: (data) {
      final args = data.getArgs<ModifPlaceArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.ModifPlace(key: args.key, place: args.place),
        settings: data,
      );
    },
    _i24.Recherche: (data) {
      final args = data.getArgs<RechercheArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i24.Recherche(key: args.key, isBureau: args.isBureau),
        settings: data,
      );
    },
    _i25.Resultat: (data) {
      final args = data.getArgs<ResultatArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i25.Resultat(key: args.key, places: args.places),
        settings: data,
      );
    },
    _i26.MaisonVisite: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.MaisonVisite(),
        settings: data,
      );
    },
    _i27.RenewPassView: (data) {
      final args = data.getArgs<RenewPassViewArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i27.RenewPassView(
            key: args.key, pass: args.pass, passVisite: args.passVisite),
        settings: data,
      );
    },
    _i28.Visite: (data) {
      final args = data.getArgs<VisiteArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i28.Visite(key: args.key, place: args.place),
        settings: data,
      );
    },
    _i29.ImageNav: (data) {
      final args = data.getArgs<ImageNavArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i29.ImageNav(
            key: args.key, startIndex: args.startIndex, images: args.images),
        settings: data,
      );
    },
    _i30.ProgrammeTv: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i30.ProgrammeTv(),
        settings: data,
      );
    },
    _i31.ChanelTv: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i31.ChanelTv(),
        settings: data,
      );
    },
    _i32.Bientot: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.Bientot(),
        settings: data,
      );
    },
    _i33.Tv: (data) {
      final args = data.getArgs<TvArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i33.Tv(key: args.key, programmeTV: args.programmeTV),
        settings: data,
      );
    },
    _i34.TvSport: (data) {
      final args = data.getArgs<TvSportArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i34.TvSport(key: args.key, link: args.link),
        settings: data,
      );
    },
    _i35.TvLive: (data) {
      final args = data.getArgs<TvLiveArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i35.TvLive(key: args.key, link: args.link),
        settings: data,
      );
    },
    _i36.BuyView: (data) {
      final args = data.getArgs<BuyViewArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i36.BuyView(key: args.key, abonement: args.abonement),
        settings: data,
      );
    },
    _i37.BuyVisitePass: (data) {
      final args = data.getArgs<BuyVisitePassArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i37.BuyVisitePass(
            key: args.key, isVisite: args.isVisite, isRenew: args.isRenew),
        settings: data,
      );
    },
    _i38.BuyPassView: (data) {
      final args = data.getArgs<BuyPassViewArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i38.BuyPassView(key: args.key, pass: args.pass),
        settings: data,
      );
    },
    _i39.BuyAbonnement: (data) {
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => const _i39.BuyAbonnement(),
        settings: data,
      );
    },
    _i40.BuyAbonnementEbank: (data) {
      final args = data.getArgs<BuyAbonnementEbankArguments>(nullOk: false);
      return _i41.MaterialPageRoute<dynamic>(
        builder: (context) => _i40.BuyAbonnementEbank(
            key: args.key, fromEpargne: args.fromEpargne),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CaptureViewArguments {
  const CaptureViewArguments({
    this.key,
    required this.image,
  });

  final _i41.Key? key;

  final _i42.File image;

  @override
  String toString() {
    return '{"key": "$key", "image": "$image"}';
  }

  @override
  bool operator ==(covariant CaptureViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.image == image;
  }

  @override
  int get hashCode {
    return key.hashCode ^ image.hashCode;
  }
}

class PasswordChangeViewArguments {
  const PasswordChangeViewArguments({
    this.key,
    required this.fromBank,
  });

  final _i41.Key? key;

  final bool fromBank;

  @override
  String toString() {
    return '{"key": "$key", "fromBank": "$fromBank"}';
  }

  @override
  bool operator ==(covariant PasswordChangeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.fromBank == fromBank;
  }

  @override
  int get hashCode {
    return key.hashCode ^ fromBank.hashCode;
  }
}

class PhotoChangeViewArguments {
  const PhotoChangeViewArguments({
    this.key,
    required this.fromBank,
  });

  final _i41.Key? key;

  final bool fromBank;

  @override
  String toString() {
    return '{"key": "$key", "fromBank": "$fromBank"}';
  }

  @override
  bool operator ==(covariant PhotoChangeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.fromBank == fromBank;
  }

  @override
  int get hashCode {
    return key.hashCode ^ fromBank.hashCode;
  }
}

class BankArguments {
  const BankArguments({
    this.key,
    required this.hasEpargne,
  });

  final _i41.Key? key;

  final bool hasEpargne;

  @override
  String toString() {
    return '{"key": "$key", "hasEpargne": "$hasEpargne"}';
  }

  @override
  bool operator ==(covariant BankArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.hasEpargne == hasEpargne;
  }

  @override
  int get hashCode {
    return key.hashCode ^ hasEpargne.hashCode;
  }
}

class RetraitArguments {
  const RetraitArguments({
    this.key,
    required this.fromEpargne,
  });

  final _i41.Key? key;

  final bool fromEpargne;

  @override
  String toString() {
    return '{"key": "$key", "fromEpargne": "$fromEpargne"}';
  }

  @override
  bool operator ==(covariant RetraitArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.fromEpargne == fromEpargne;
  }

  @override
  int get hashCode {
    return key.hashCode ^ fromEpargne.hashCode;
  }
}

class MyVisiteArguments {
  const MyVisiteArguments({
    this.key,
    required this.place,
  });

  final _i41.Key? key;

  final _i43.TelaPlace place;

  @override
  String toString() {
    return '{"key": "$key", "place": "$place"}';
  }

  @override
  bool operator ==(covariant MyVisiteArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.place == place;
  }

  @override
  int get hashCode {
    return key.hashCode ^ place.hashCode;
  }
}

class ModifPlaceArguments {
  const ModifPlaceArguments({
    this.key,
    required this.place,
  });

  final _i41.Key? key;

  final _i43.TelaPlace place;

  @override
  String toString() {
    return '{"key": "$key", "place": "$place"}';
  }

  @override
  bool operator ==(covariant ModifPlaceArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.place == place;
  }

  @override
  int get hashCode {
    return key.hashCode ^ place.hashCode;
  }
}

class RechercheArguments {
  const RechercheArguments({
    this.key,
    required this.isBureau,
  });

  final _i41.Key? key;

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

  final _i41.Key? key;

  final List<_i43.TelaPlace> places;

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

class RenewPassViewArguments {
  const RenewPassViewArguments({
    this.key,
    required this.pass,
    required this.passVisite,
  });

  final _i41.Key? key;

  final _i44.PassType pass;

  final _i45.PassVisite passVisite;

  @override
  String toString() {
    return '{"key": "$key", "pass": "$pass", "passVisite": "$passVisite"}';
  }

  @override
  bool operator ==(covariant RenewPassViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.pass == pass &&
        other.passVisite == passVisite;
  }

  @override
  int get hashCode {
    return key.hashCode ^ pass.hashCode ^ passVisite.hashCode;
  }
}

class VisiteArguments {
  const VisiteArguments({
    this.key,
    required this.place,
  });

  final _i41.Key? key;

  final _i43.TelaPlace place;

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

class ImageNavArguments {
  const ImageNavArguments({
    this.key,
    this.startIndex = 0,
    required this.images,
  });

  final _i41.Key? key;

  final int startIndex;

  final List<String> images;

  @override
  String toString() {
    return '{"key": "$key", "startIndex": "$startIndex", "images": "$images"}';
  }

  @override
  bool operator ==(covariant ImageNavArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.startIndex == startIndex &&
        other.images == images;
  }

  @override
  int get hashCode {
    return key.hashCode ^ startIndex.hashCode ^ images.hashCode;
  }
}

class TvArguments {
  const TvArguments({
    this.key,
    required this.programmeTV,
  });

  final _i41.Key? key;

  final _i46.TelaProgrammeTV programmeTV;

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

class TvSportArguments {
  const TvSportArguments({
    this.key,
    required this.link,
  });

  final _i41.Key? key;

  final String link;

  @override
  String toString() {
    return '{"key": "$key", "link": "$link"}';
  }

  @override
  bool operator ==(covariant TvSportArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.link == link;
  }

  @override
  int get hashCode {
    return key.hashCode ^ link.hashCode;
  }
}

class TvLiveArguments {
  const TvLiveArguments({
    this.key,
    required this.link,
  });

  final _i41.Key? key;

  final String link;

  @override
  String toString() {
    return '{"key": "$key", "link": "$link"}';
  }

  @override
  bool operator ==(covariant TvLiveArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.link == link;
  }

  @override
  int get hashCode {
    return key.hashCode ^ link.hashCode;
  }
}

class BuyViewArguments {
  const BuyViewArguments({
    this.key,
    required this.abonement,
  });

  final _i41.Key? key;

  final _i44.AbonnementType abonement;

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

class BuyVisitePassArguments {
  const BuyVisitePassArguments({
    this.key,
    required this.isVisite,
    this.isRenew = false,
  });

  final _i41.Key? key;

  final bool isVisite;

  final bool isRenew;

  @override
  String toString() {
    return '{"key": "$key", "isVisite": "$isVisite", "isRenew": "$isRenew"}';
  }

  @override
  bool operator ==(covariant BuyVisitePassArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.isVisite == isVisite &&
        other.isRenew == isRenew;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isVisite.hashCode ^ isRenew.hashCode;
  }
}

class BuyPassViewArguments {
  const BuyPassViewArguments({
    this.key,
    required this.pass,
  });

  final _i41.Key? key;

  final _i44.PassType pass;

  @override
  String toString() {
    return '{"key": "$key", "pass": "$pass"}';
  }

  @override
  bool operator ==(covariant BuyPassViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.pass == pass;
  }

  @override
  int get hashCode {
    return key.hashCode ^ pass.hashCode;
  }
}

class BuyAbonnementEbankArguments {
  const BuyAbonnementEbankArguments({
    this.key,
    required this.fromEpargne,
  });

  final _i41.Key? key;

  final bool fromEpargne;

  @override
  String toString() {
    return '{"key": "$key", "fromEpargne": "$fromEpargne"}';
  }

  @override
  bool operator ==(covariant BuyAbonnementEbankArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.fromEpargne == fromEpargne;
  }

  @override
  int get hashCode {
    return key.hashCode ^ fromEpargne.hashCode;
  }
}

extension NavigatorStateExtension on _i47.NavigationService {
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

  Future<dynamic> navigateToConditionGeneralDUtilisationSFinance([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.conditionGeneralDUtilisationSFinance,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCameraView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cameraView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCaptureView({
    _i41.Key? key,
    required _i42.File image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.captureView,
        arguments: CaptureViewArguments(key: key, image: image),
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

  Future<dynamic> navigateToPasswordChangeView({
    _i41.Key? key,
    required bool fromBank,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.passwordChangeView,
        arguments: PasswordChangeViewArguments(key: key, fromBank: fromBank),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPhotoChangeView({
    _i41.Key? key,
    required bool fromBank,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.photoChangeView,
        arguments: PhotoChangeViewArguments(key: key, fromBank: fromBank),
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

  Future<dynamic> navigateToIdentificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.identificationView,
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

  Future<dynamic> navigateToBank({
    _i41.Key? key,
    required bool hasEpargne,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bank,
        arguments: BankArguments(key: key, hasEpargne: hasEpargne),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEbankLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ebankLoginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEbankSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ebankSignInView,
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

  Future<dynamic> navigateToRetrait({
    _i41.Key? key,
    required bool fromEpargne,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.retrait,
        arguments: RetraitArguments(key: key, fromEpargne: fromEpargne),
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

  Future<dynamic> navigateToVersementRet([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.versementRet,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCatalogue([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.catalogue,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyVisite({
    _i41.Key? key,
    required _i43.TelaPlace place,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.myVisite,
        arguments: MyVisiteArguments(key: key, place: place),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewPlace([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.newPlace,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToModifPlace({
    _i41.Key? key,
    required _i43.TelaPlace place,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.modifPlace,
        arguments: ModifPlaceArguments(key: key, place: place),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRecherche({
    _i41.Key? key,
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
    _i41.Key? key,
    required List<_i43.TelaPlace> places,
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

  Future<dynamic> navigateToMaisonVisite([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.maisonVisite,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRenewPassView({
    _i41.Key? key,
    required _i44.PassType pass,
    required _i45.PassVisite passVisite,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.renewPassView,
        arguments: RenewPassViewArguments(
            key: key, pass: pass, passVisite: passVisite),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVisite({
    _i41.Key? key,
    required _i43.TelaPlace place,
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

  Future<dynamic> navigateToImageNav({
    _i41.Key? key,
    int startIndex = 0,
    required List<String> images,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.imageNav,
        arguments:
            ImageNavArguments(key: key, startIndex: startIndex, images: images),
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

  Future<dynamic> navigateToBientot([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bientot,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTv({
    _i41.Key? key,
    required _i46.TelaProgrammeTV programmeTV,
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

  Future<dynamic> navigateToTvSport({
    _i41.Key? key,
    required String link,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tvSport,
        arguments: TvSportArguments(key: key, link: link),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTvLive({
    _i41.Key? key,
    required String link,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tvLive,
        arguments: TvLiveArguments(key: key, link: link),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyView({
    _i41.Key? key,
    required _i44.AbonnementType abonement,
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

  Future<dynamic> navigateToBuyVisitePass({
    _i41.Key? key,
    required bool isVisite,
    bool isRenew = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.buyVisitePass,
        arguments: BuyVisitePassArguments(
            key: key, isVisite: isVisite, isRenew: isRenew),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyPassView({
    _i41.Key? key,
    required _i44.PassType pass,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.buyPassView,
        arguments: BuyPassViewArguments(key: key, pass: pass),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyAbonnement([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyAbonnement,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyAbonnementEbank({
    _i41.Key? key,
    required bool fromEpargne,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.buyAbonnementEbank,
        arguments:
            BuyAbonnementEbankArguments(key: key, fromEpargne: fromEpargne),
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

  Future<dynamic> replaceWithConditionGeneralDUtilisationSFinance([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.conditionGeneralDUtilisationSFinance,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCameraView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cameraView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCaptureView({
    _i41.Key? key,
    required _i42.File image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.captureView,
        arguments: CaptureViewArguments(key: key, image: image),
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

  Future<dynamic> replaceWithPasswordChangeView({
    _i41.Key? key,
    required bool fromBank,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.passwordChangeView,
        arguments: PasswordChangeViewArguments(key: key, fromBank: fromBank),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPhotoChangeView({
    _i41.Key? key,
    required bool fromBank,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.photoChangeView,
        arguments: PhotoChangeViewArguments(key: key, fromBank: fromBank),
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

  Future<dynamic> replaceWithIdentificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.identificationView,
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

  Future<dynamic> replaceWithBank({
    _i41.Key? key,
    required bool hasEpargne,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bank,
        arguments: BankArguments(key: key, hasEpargne: hasEpargne),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEbankLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ebankLoginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEbankSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ebankSignInView,
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

  Future<dynamic> replaceWithRetrait({
    _i41.Key? key,
    required bool fromEpargne,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.retrait,
        arguments: RetraitArguments(key: key, fromEpargne: fromEpargne),
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

  Future<dynamic> replaceWithVersementRet([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.versementRet,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCatalogue([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.catalogue,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyVisite({
    _i41.Key? key,
    required _i43.TelaPlace place,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.myVisite,
        arguments: MyVisiteArguments(key: key, place: place),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNewPlace([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.newPlace,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithModifPlace({
    _i41.Key? key,
    required _i43.TelaPlace place,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.modifPlace,
        arguments: ModifPlaceArguments(key: key, place: place),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRecherche({
    _i41.Key? key,
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
    _i41.Key? key,
    required List<_i43.TelaPlace> places,
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

  Future<dynamic> replaceWithMaisonVisite([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.maisonVisite,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRenewPassView({
    _i41.Key? key,
    required _i44.PassType pass,
    required _i45.PassVisite passVisite,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.renewPassView,
        arguments: RenewPassViewArguments(
            key: key, pass: pass, passVisite: passVisite),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVisite({
    _i41.Key? key,
    required _i43.TelaPlace place,
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

  Future<dynamic> replaceWithImageNav({
    _i41.Key? key,
    int startIndex = 0,
    required List<String> images,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.imageNav,
        arguments:
            ImageNavArguments(key: key, startIndex: startIndex, images: images),
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

  Future<dynamic> replaceWithBientot([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bientot,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTv({
    _i41.Key? key,
    required _i46.TelaProgrammeTV programmeTV,
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

  Future<dynamic> replaceWithTvSport({
    _i41.Key? key,
    required String link,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.tvSport,
        arguments: TvSportArguments(key: key, link: link),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTvLive({
    _i41.Key? key,
    required String link,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.tvLive,
        arguments: TvLiveArguments(key: key, link: link),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyView({
    _i41.Key? key,
    required _i44.AbonnementType abonement,
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

  Future<dynamic> replaceWithBuyVisitePass({
    _i41.Key? key,
    required bool isVisite,
    bool isRenew = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.buyVisitePass,
        arguments: BuyVisitePassArguments(
            key: key, isVisite: isVisite, isRenew: isRenew),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyPassView({
    _i41.Key? key,
    required _i44.PassType pass,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.buyPassView,
        arguments: BuyPassViewArguments(key: key, pass: pass),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyAbonnement([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyAbonnement,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyAbonnementEbank({
    _i41.Key? key,
    required bool fromEpargne,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.buyAbonnementEbank,
        arguments:
            BuyAbonnementEbankArguments(key: key, fromEpargne: fromEpargne),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
