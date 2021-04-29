import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ydr_flutix/models/models.dart';
import 'package:ydr_flutix/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      UserFlutix user = await UserServices.getUser(event.id);

      yield UserLoaded(user);
    } else if (event is Signout) {
      yield UserInitial();
    }
  }
}
