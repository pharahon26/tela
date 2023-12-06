// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i36;

import 'package:flutter/material.dart' as _i35;
import 'package:flutter/material.dart';
import 'package:mobile/models/abonnement.dart' as _i39;
import 'package:mobile/models/abonnementType.dart' as _i38;
import 'package:mobile/models/place.dart' as _i37;
import 'package:mobile/models/programetv.dart' as _i40;
import 'package:mobile/ui/views/acceuil/acceuil.dart' as _i2;
import 'package:mobile/ui/views/buyAbonnement/buyabonnement.dart' as _i33;
import 'package:mobile/ui/views/buyVisitePass/buyVisitePass.dart' as _i31;
import 'package:mobile/ui/views/camera/camera_view.dart' as _i5;
import 'package:mobile/ui/views/camera/capture.dart' as _i6;
import 'package:mobile/ui/views/cgu/cgu.dart' as _i3;
import 'package:mobile/ui/views/cguFinance/cguFinance.dart' as _i4;
import 'package:mobile/ui/views/ebank/bank_resume/bank.dart' as _i11;
import 'package:mobile/ui/views/ebank/buyAbonnement/buyabonnementEbank.dart'
    as _i34;
import 'package:mobile/ui/views/ebank/buyPassView/buyPassView.dart' as _i32;
import 'package:mobile/ui/views/ebank/buyView/buyView.dart' as _i30;
import 'package:mobile/ui/views/ebank/depot/depot.dart' as _i14;
import 'package:mobile/ui/views/ebank/ebankLoginView/ebankLoginView.dart'
    as _i12;
import 'package:mobile/ui/views/ebank/ebankSignInView/ebankSignInView.dart'
    as _i13;
import 'package:mobile/ui/views/ebank/renewVisitePass/renewPassView.dart'
    as _i24;
import 'package:mobile/ui/views/ebank/retrait/retrait.dart' as _i15;
import 'package:mobile/ui/views/ebank/versement/versement.dart' as _i16;
import 'package:mobile/ui/views/IdentificationView/identificationView.dart'
    as _i9;
import 'package:mobile/ui/views/immo/catalogue/catalogue.dart' as _i17;
import 'package:mobile/ui/views/immo/imageNav/imgeNav.dart' as _i26;
import 'package:mobile/ui/views/immo/maisonVisite/maisonVisite.dart' as _i23;
import 'package:mobile/ui/views/immo/modifPlace/modifPlace.dart' as _i20;
import 'package:mobile/ui/views/immo/myVisite/myVisite.dart' as _i18;
import 'package:mobile/ui/views/immo/newPlace/newPlace.dart' as _i19;
import 'package:mobile/ui/views/immo/recherche/recherche.dart' as _i21;
import 'package:mobile/ui/views/immo/resultat/resultat.dart' as _i22;
import 'package:mobile/ui/views/immo/visite/visite.dart' as _i25;
import 'package:mobile/ui/views/LoginView/loginView.dart' as _i10;
import 'package:mobile/ui/views/profile/profile.dart' as _i7;
import 'package:mobile/ui/views/SignInView/signInView.dart' as _i8;
import 'package:mobile/ui/views/tv/chaneltv/channeltv.dart' as _i28;
import 'package:mobile/ui/views/tv/programmetv/programmetv.dart' as _i27;
import 'package:mobile/ui/views/tv/tv/tv.dart' as _i29;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i41;

class Routes {
  static const acceuil = '/';

  static const conditionGeneralDUtilisationS =
      '/condition-general-dutilisation-s';

  static const conditionGeneralDUtilisationSFinance =
      '/condition-general-dutilisation-sFinance';

  static const cameraView = '/camera-view';

  static const captureView = '/capture-view';

  static const profile = '/Profile';

  static const signInView = '/sign-in-view';

  static const identificationView = '/identification-view';

  static const loginView = '/login-view';

  static const bank = '/Bank';

  static const ebankLoginView = '/ebank-login-view';

  static const ebankSignInView = '/ebank-sign-in-view';

  static const depot = '/Depot';

  static const retrait = '/Retrait';

  static const versement = '/Versement';

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

  static const tv = '/Tv';

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
    signInView,
    identificationView,
    loginView,
    bank,
    ebankLoginView,
    ebankSignInView,
    depot,
    retrait,
    versement,
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
    tv,
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
      Routes.signInView,
      page: _i8.SignInView,
    ),
    _i1.RouteDef(
      Routes.identificationView,
      page: _i9.IdentificationView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i10.LoginView,
    ),
    _i1.RouteDef(
      Routes.bank,
      page: _i11.Bank,
    ),
    _i1.RouteDef(
      Routes.ebankLoginView,
      page: _i12.EbankLoginView,
    ),
    _i1.RouteDef(
      Routes.ebankSignInView,
      page: _i13.EbankSignInView,
    ),
    _i1.RouteDef(
      Routes.depot,
      page: _i14.Depot,
    ),
    _i1.RouteDef(
      Routes.retrait,
      page: _i15.Retrait,
    ),
    _i1.RouteDef(
      Routes.versement,
      page: _i16.Versement,
    ),
    _i1.RouteDef(
      Routes.catalogue,
      page: _i17.Catalogue,
    ),
    _i1.RouteDef(
      Routes.myVisite,
      page: _i18.MyVisite,
    ),
    _i1.RouteDef(
      Routes.newPlace,
      page: _i19.NewPlace,
    ),
    _i1.RouteDef(
      Routes.modifPlace,
      page: _i20.ModifPlace,
    ),
    _i1.RouteDef(
      Routes.recherche,
      page: _i21.Recherche,
    ),
    _i1.RouteDef(
      Routes.resultat,
      page: _i22.Resultat,
    ),
    _i1.RouteDef(
      Routes.maisonVisite,
      page: _i23.MaisonVisite,
    ),
    _i1.RouteDef(
      Routes.renewPassView,
      page: _i24.RenewPassView,
    ),
    _i1.RouteDef(
      Routes.visite,
      page: _i25.Visite,
    ),
    _i1.RouteDef(
      Routes.imageNav,
      page: _i26.ImageNav,
    ),
    _i1.RouteDef(
      Routes.programmeTv,
      page: _i27.ProgrammeTv,
    ),
    _i1.RouteDef(
      Routes.chanelTv,
      page: _i28.ChanelTv,
    ),
    _i1.RouteDef(
      Routes.tv,
      page: _i29.Tv,
    ),
    _i1.RouteDef(
      Routes.buyView,
      page: _i30.BuyView,
    ),
    _i1.RouteDef(
      Routes.buyVisitePass,
      page: _i31.BuyVisitePass,
    ),
    _i1.RouteDef(
      Routes.buyPassView,
      page: _i32.BuyPassView,
    ),
    _i1.RouteDef(
      Routes.buyAbonnement,
      page: _i33.BuyAbonnement,
    ),
    _i1.RouteDef(
      Routes.buyAbonnementEbank,
      page: _i34.BuyAbonnementEbank,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Acceuil: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.Acceuil(),
        settings: data,
      );
    },
    _i3.ConditionGeneralDUtilisationS: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.ConditionGeneralDUtilisationS(),
        settings: data,
      );
    },
    _i4.ConditionGeneralDUtilisationSFinance: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ConditionGeneralDUtilisationSFinance(),
        settings: data,
      );
    },
    _i5.CameraView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.CameraView(),
        settings: data,
      );
    },
    _i6.CaptureView: (data) {
      final args = data.getArgs<CaptureViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CaptureView(image: args.image),
        settings: data,
      );
    },
    _i7.Profile: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.Profile(),
        settings: data,
      );
    },
    _i8.SignInView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.SignInView(),
        settings: data,
      );
    },
    _i9.IdentificationView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.IdentificationView(),
        settings: data,
      );
    },
    _i10.LoginView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.LoginView(),
        settings: data,
      );
    },
    _i11.Bank: (data) {
      final args = data.getArgs<BankArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.Bank(key: args.key, hasEpargne: args.hasEpargne),
        settings: data,
      );
    },
    _i12.EbankLoginView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.EbankLoginView(),
        settings: data,
      );
    },
    _i13.EbankSignInView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.EbankSignInView(),
        settings: data,
      );
    },
    _i14.Depot: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.Depot(),
        settings: data,
      );
    },
    _i15.Retrait: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.Retrait(),
        settings: data,
      );
    },
    _i16.Versement: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.Versement(),
        settings: data,
      );
    },
    _i17.Catalogue: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.Catalogue(),
        settings: data,
      );
    },
    _i18.MyVisite: (data) {
      final args = data.getArgs<MyVisiteArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.MyVisite(key: args.key, place: args.place),
        settings: data,
      );
    },
    _i19.NewPlace: (data) {
      final args = data.getArgs<NewPlaceArguments>(
        orElse: () => const NewPlaceArguments(),
      );
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.NewPlace(key: args.key),
        settings: data,
      );
    },
    _i20.ModifPlace: (data) {
      final args = data.getArgs<ModifPlaceArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.ModifPlace(key: args.key, place: args.place),
        settings: data,
      );
    },
    _i21.Recherche: (data) {
      final args = data.getArgs<RechercheArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i21.Recherche(key: args.key, isBureau: args.isBureau),
        settings: data,
      );
    },
    _i22.Resultat: (data) {
      final args = data.getArgs<ResultatArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.Resultat(key: args.key, places: args.places),
        settings: data,
      );
    },
    _i23.MaisonVisite: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.MaisonVisite(),
        settings: data,
      );
    },
    _i24.RenewPassView: (data) {
      final args = data.getArgs<RenewPassViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.RenewPassView(
            key: args.key, pass: args.pass, passVisite: args.passVisite),
        settings: data,
      );
    },
    _i25.Visite: (data) {
      final args = data.getArgs<VisiteArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i25.Visite(key: args.key, place: args.place),
        settings: data,
      );
    },
    _i26.ImageNav: (data) {
      final args = data.getArgs<ImageNavArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i26.ImageNav(
            key: args.key, startIndex: args.startIndex, images: args.images),
        settings: data,
      );
    },
    _i27.ProgrammeTv: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.ProgrammeTv(),
        settings: data,
      );
    },
    _i28.ChanelTv: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.ChanelTv(),
        settings: data,
      );
    },
    _i29.Tv: (data) {
      final args = data.getArgs<TvArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i29.Tv(key: args.key, programmeTV: args.programmeTV),
        settings: data,
      );
    },
    _i30.BuyView: (data) {
      final args = data.getArgs<BuyViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i30.BuyView(key: args.key, abonement: args.abonement),
        settings: data,
      );
    },
    _i31.BuyVisitePass: (data) {
      final args = data.getArgs<BuyVisitePassArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i31.BuyVisitePass(
            key: args.key, isVisite: args.isVisite, isRenew: args.isRenew),
        settings: data,
      );
    },
    _i32.BuyPassView: (data) {
      final args = data.getArgs<BuyPassViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i32.BuyPassView(key: args.key, pass: args.pass),
        settings: data,
      );
    },
    _i33.BuyAbonnement: (data) {
      final args = data.getArgs<BuyAbonnementArguments>(
        orElse: () => const BuyAbonnementArguments(),
      );
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i33.BuyAbonnement(key: args.key),
        settings: data,
      );
    },
    _i34.BuyAbonnementEbank: (data) {
      final args = data.getArgs<BuyAbonnementEbankArguments>(
        orElse: () => const BuyAbonnementEbankArguments(),
      );
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i34.BuyAbonnementEbank(key: args.key),
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
  const CaptureViewArguments({required this.image});

  final _i36.File image;

  @override
  String toString() {
    return '{"image": "$image"}';
  }

  @override
  bool operator ==(covariant CaptureViewArguments other) {
    if (identical(this, other)) return true;
    return other.image == image;
  }

  @override
  int get hashCode {
    return image.hashCode;
  }
}

class BankArguments {
  const BankArguments({
    this.key,
    required this.hasEpargne,
  });

  final _i35.Key? key;

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

class MyVisiteArguments {
  const MyVisiteArguments({
    this.key,
    required this.place,
  });

  final _i35.Key? key;

  final _i37.TelaPlace place;

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

class NewPlaceArguments {
  const NewPlaceArguments({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant NewPlaceArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ModifPlaceArguments {
  const ModifPlaceArguments({
    this.key,
    required this.place,
  });

  final _i35.Key? key;

  final _i37.TelaPlace place;

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

  final _i35.Key? key;

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

  final _i35.Key? key;

  final List<_i37.TelaPlace> places;

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

  final _i35.Key? key;

  final _i38.PassType pass;

  final _i39.PassVisite passVisite;

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

  final _i35.Key? key;

  final _i37.TelaPlace place;

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

  final _i35.Key? key;

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

  final _i35.Key? key;

  final _i40.TelaProgrammeTV programmeTV;

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

  final _i35.Key? key;

  final _i38.AbonnementType abonement;

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

  final _i35.Key? key;

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

  final _i35.Key? key;

  final _i38.PassType pass;

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

class BuyAbonnementArguments {
  const BuyAbonnementArguments({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant BuyAbonnementArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class BuyAbonnementEbankArguments {
  const BuyAbonnementEbankArguments({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant BuyAbonnementEbankArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i41.NavigationService {
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
    required _i36.File image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.captureView,
        arguments: CaptureViewArguments(image: image),
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
    _i35.Key? key,
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

  Future<dynamic> navigateToRetrait([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.retrait,
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
    _i35.Key? key,
    required _i37.TelaPlace place,
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

  Future<dynamic> navigateToNewPlace({
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.newPlace,
        arguments: NewPlaceArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToModifPlace({
    _i35.Key? key,
    required _i37.TelaPlace place,
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
    _i35.Key? key,
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
    _i35.Key? key,
    required List<_i37.TelaPlace> places,
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
    _i35.Key? key,
    required _i38.PassType pass,
    required _i39.PassVisite passVisite,
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
    _i35.Key? key,
    required _i37.TelaPlace place,
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
    _i35.Key? key,
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

  Future<dynamic> navigateToTv({
    _i35.Key? key,
    required _i40.TelaProgrammeTV programmeTV,
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
    _i35.Key? key,
    required _i38.AbonnementType abonement,
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
    _i35.Key? key,
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
    _i35.Key? key,
    required _i38.PassType pass,
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

  Future<dynamic> navigateToBuyAbonnement({
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.buyAbonnement,
        arguments: BuyAbonnementArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyAbonnementEbank({
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.buyAbonnementEbank,
        arguments: BuyAbonnementEbankArguments(key: key),
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
    required _i36.File image,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.captureView,
        arguments: CaptureViewArguments(image: image),
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
    _i35.Key? key,
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

  Future<dynamic> replaceWithRetrait([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.retrait,
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
    _i35.Key? key,
    required _i37.TelaPlace place,
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

  Future<dynamic> replaceWithNewPlace({
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.newPlace,
        arguments: NewPlaceArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithModifPlace({
    _i35.Key? key,
    required _i37.TelaPlace place,
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
    _i35.Key? key,
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
    _i35.Key? key,
    required List<_i37.TelaPlace> places,
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
    _i35.Key? key,
    required _i38.PassType pass,
    required _i39.PassVisite passVisite,
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
    _i35.Key? key,
    required _i37.TelaPlace place,
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
    _i35.Key? key,
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

  Future<dynamic> replaceWithTv({
    _i35.Key? key,
    required _i40.TelaProgrammeTV programmeTV,
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
    _i35.Key? key,
    required _i38.AbonnementType abonement,
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
    _i35.Key? key,
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
    _i35.Key? key,
    required _i38.PassType pass,
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

  Future<dynamic> replaceWithBuyAbonnement({
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.buyAbonnement,
        arguments: BuyAbonnementArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyAbonnementEbank({
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.buyAbonnementEbank,
        arguments: BuyAbonnementEbankArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
