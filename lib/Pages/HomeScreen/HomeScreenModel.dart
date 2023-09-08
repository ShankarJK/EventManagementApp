import 'package:mobx/mobx.dart';

import '../../Helpers/AppNavigations/NavigationMixin.dart';
import '../../Helpers/Mixins/TextFieldMixin.dart';
part 'HomeScreenModel.g.dart';

class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase
    with Store, NavigationMixin, TextFieldMixin {
  @observable
  String username = "";

  @observable
  String password = "";

  @action
  void setUsername(String username) {
    this.username = username;
  }

  @action
  void setPassword(String password) {
    this.password = password;
  }

  @observable
  String status = "";

  @action
  void setStatus(String status) {
    this.status = status;
  }
}
