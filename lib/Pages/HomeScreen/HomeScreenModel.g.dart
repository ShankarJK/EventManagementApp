// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$sourceNameAtom =
      Atom(name: '_HomeScreenModelBase.sourceName', context: context);

  @override
  String get sourceName {
    _$sourceNameAtom.reportRead();
    return super.sourceName;
  }

  @override
  set sourceName(String value) {
    _$sourceNameAtom.reportWrite(value, super.sourceName, () {
      super.sourceName = value;
    });
  }

  late final _$destinationNameAtom =
      Atom(name: '_HomeScreenModelBase.destinationName', context: context);

  @override
  String get destinationName {
    _$destinationNameAtom.reportRead();
    return super.destinationName;
  }

  @override
  set destinationName(String value) {
    _$destinationNameAtom.reportWrite(value, super.destinationName, () {
      super.destinationName = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void setSourceName(String sourceName) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setSourceName');
    try {
      return super.setSourceName(sourceName);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDestinationName(String destinationName) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setDestinationName');
    try {
      return super.setDestinationName(destinationName);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sourceName: ${sourceName},
destinationName: ${destinationName}
    ''';
  }
}
