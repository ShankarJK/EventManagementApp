// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchScreenModel on _SearchScreenModelBase, Store {
  late final _$currentUserinfoAtom =
      Atom(name: '_SearchScreenModelBase.currentUserinfo', context: context);

  @override
  dynamic get currentUserinfo {
    _$currentUserinfoAtom.reportRead();
    return super.currentUserinfo;
  }

  @override
  set currentUserinfo(dynamic value) {
    _$currentUserinfoAtom.reportWrite(value, super.currentUserinfo, () {
      super.currentUserinfo = value;
    });
  }

  late final _$isUserAtom =
      Atom(name: '_SearchScreenModelBase.isUser', context: context);

  @override
  bool get isUser {
    _$isUserAtom.reportRead();
    return super.isUser;
  }

  @override
  set isUser(bool value) {
    _$isUserAtom.reportWrite(value, super.isUser, () {
      super.isUser = value;
    });
  }

  late final _$_SearchScreenModelBaseActionController =
      ActionController(name: '_SearchScreenModelBase', context: context);

  @override
  dynamic setCurrentUserinfo(dynamic value) {
    final _$actionInfo = _$_SearchScreenModelBaseActionController.startAction(
        name: '_SearchScreenModelBase.setCurrentUserinfo');
    try {
      return super.setCurrentUserinfo(value);
    } finally {
      _$_SearchScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserMap(Map<String, dynamic> userMap) {
    final _$actionInfo = _$_SearchScreenModelBaseActionController.startAction(
        name: '_SearchScreenModelBase.setUserMap');
    try {
      return super.setUserMap(userMap);
    } finally {
      _$_SearchScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setsearchtext(String searchtext) {
    final _$actionInfo = _$_SearchScreenModelBaseActionController.startAction(
        name: '_SearchScreenModelBase.setsearchtext');
    try {
      return super.setsearchtext(searchtext);
    } finally {
      _$_SearchScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsUser(bool isUser) {
    final _$actionInfo = _$_SearchScreenModelBaseActionController.startAction(
        name: '_SearchScreenModelBase.setIsUser');
    try {
      return super.setIsUser(isUser);
    } finally {
      _$_SearchScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUserinfo: ${currentUserinfo},
isUser: ${isUser}
    ''';
  }
}
