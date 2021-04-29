import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ydr_flutix/models/models.dart';

part 'page_state.dart';
part 'page_event.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToRegistrationPage) {
      yield OnRegistetrationPage(event.registrationData);
    } else if (event is GoToAccounConfirmationPage) {
      yield OnAccountConfirmation(event.registrationData);
    } else if (event is GoToAccounConfirmationPage) {
      yield OnAccountConfirmation(event.registrationData);
    }
  }
}
