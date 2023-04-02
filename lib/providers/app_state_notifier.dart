import 'package:shipcret/widgets/common/widget_enum.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class FSubPageState extends Equatable {
  late bool _isBusy;
  late ESubPage _subPage;

  bool isBusy() => _isBusy;
  ESubPage getSubPage() => _subPage;
  setBusy(bool isBusy) => _isBusy = isBusy;
  setSubPage(ESubPage subPage) => _subPage = subPage;

  FSubPageState({
    bool isBusy = false,
    ESubPage subPage = ESubPage.welcomeUser,
  }) {
    _isBusy = isBusy;
    _subPage = subPage;
  }

  @override
  List<Object?> get props => [_isBusy, _subPage];

  FSubPageState copyWith({
    bool? isBusy,
    ESubPage? subPage,
  }) {
    return FSubPageState(
      isBusy: isBusy ?? _isBusy,
      subPage: subPage ?? _subPage,
    );
  }
}

class AppStateNotifier extends StateNotifier<FSubPageState> {
  AppStateNotifier(super.state);

  ESubPage getSubPage() => state.getSubPage();

  void isBusy() {
    state = state.copyWith(isBusy: true);
  }

  void isNotBusy() {
    state = state.copyWith(isBusy: false);
  }

  void setSubPage(ESubPage subPage) {
    if (state.getSubPage() == subPage) {
      return;
    }

    state = state.copyWith(subPage: subPage);
  }
}
