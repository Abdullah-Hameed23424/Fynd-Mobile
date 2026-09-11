/// Events for AuthBloc

abstract class AuthEvent {
  const AuthEvent();
}

class AuthRequested extends AuthEvent {
  const AuthRequested();
}

// Add other events here
