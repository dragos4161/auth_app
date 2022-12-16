import 'package:auth_app/src/actions/index.dart';
import 'package:auth_app/src/models/index.dart';
import 'package:auth_app/src/reducer/auth_reducer.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    if (kDebugMode) {
      print(action);
    }
    return state;
  },
  _reducer,
  TypedReducer<AppState, LogoutSuccessful>(_logoutSuccessful),
  TypedReducer<AppState, LogoutSuccessful>(_updatePasswordSuccessful),
]);

AppState _reducer(AppState state, dynamic action) {
  return state.copyWith(
    auth: authReducer(state.auth, action),
  );
}

AppState _logoutSuccessful(AppState state, LogoutSuccessful action) {
  return const AppState();
}

AppState _updatePasswordSuccessful(AppState state, LogoutSuccessful action) {
  return const AppState();
}
