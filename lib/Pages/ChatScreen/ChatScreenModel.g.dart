// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatScreenModel on _ChatScreenModelBase, Store {
  late final _$statusAtom =
      Atom(name: '_ChatScreenModelBase.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_ChatScreenModelBaseActionController =
      ActionController(name: '_ChatScreenModelBase', context: context);

  @override
  dynamic setStatus(String status) {
    final _$actionInfo = _$_ChatScreenModelBaseActionController.startAction(
        name: '_ChatScreenModelBase.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$_ChatScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserMap(Map<String, dynamic> userMap) {
    final _$actionInfo = _$_ChatScreenModelBaseActionController.startAction(
        name: '_ChatScreenModelBase.setUserMap');
    try {
      return super.setUserMap(userMap);
    } finally {
      _$_ChatScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChatMessage(String chatMessage) {
    final _$actionInfo = _$_ChatScreenModelBaseActionController.startAction(
        name: '_ChatScreenModelBase.setChatMessage');
    try {
      return super.setChatMessage(chatMessage);
    } finally {
      _$_ChatScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
