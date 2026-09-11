import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// BLoC for auth

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitialState()) {
    // Add your event handlers here
    on<AuthRequested>(_onAuthRequested);
  }

  Future<void> _onAuthRequested(
    AuthRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    try {
      // Add your business logic here
      emit(const AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }
}
