// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MapScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapScreenModel on _MapScreenModelBase, Store {
  late final _$sourceLoctionAtom =
      Atom(name: '_MapScreenModelBase.sourceLoction', context: context);

  @override
  LatLng get sourceLoction {
    _$sourceLoctionAtom.reportRead();
    return super.sourceLoction;
  }

  @override
  set sourceLoction(LatLng value) {
    _$sourceLoctionAtom.reportWrite(value, super.sourceLoction, () {
      super.sourceLoction = value;
    });
  }

  late final _$destinationLoctionAtom =
      Atom(name: '_MapScreenModelBase.destinationLoction', context: context);

  @override
  LatLng get destinationLoction {
    _$destinationLoctionAtom.reportRead();
    return super.destinationLoction;
  }

  @override
  set destinationLoction(LatLng value) {
    _$destinationLoctionAtom.reportWrite(value, super.destinationLoction, () {
      super.destinationLoction = value;
    });
  }

  late final _$polylinesAtom =
      Atom(name: '_MapScreenModelBase.polylines', context: context);

  @override
  Map<PolylineId, Polyline> get polylines {
    _$polylinesAtom.reportRead();
    return super.polylines;
  }

  @override
  set polylines(Map<PolylineId, Polyline> value) {
    _$polylinesAtom.reportWrite(value, super.polylines, () {
      super.polylines = value;
    });
  }

  late final _$_MapScreenModelBaseActionController =
      ActionController(name: '_MapScreenModelBase', context: context);

  @override
  void setsourceLoction(LatLng source) {
    final _$actionInfo = _$_MapScreenModelBaseActionController.startAction(
        name: '_MapScreenModelBase.setsourceLoction');
    try {
      return super.setsourceLoction(source);
    } finally {
      _$_MapScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setdestinationLoction(LatLng destination) {
    final _$actionInfo = _$_MapScreenModelBaseActionController.startAction(
        name: '_MapScreenModelBase.setdestinationLoction');
    try {
      return super.setdestinationLoction(destination);
    } finally {
      _$_MapScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setploylines(Map<PolylineId, Polyline> values) {
    final _$actionInfo = _$_MapScreenModelBaseActionController.startAction(
        name: '_MapScreenModelBase.setploylines');
    try {
      return super.setploylines(values);
    } finally {
      _$_MapScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sourceLoction: ${sourceLoction},
destinationLoction: ${destinationLoction},
polylines: ${polylines}
    ''';
  }
}
