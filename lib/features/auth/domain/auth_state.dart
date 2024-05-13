part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  final Widget? view;
  const AuthState({this.view});
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [view];
}

class AuthLoading extends AuthState {

  @override
  List<Object> get props => [];
}

class AuthSuccessful extends AuthState {

  final Object auth;
  const AuthSuccessful(this.auth);

  @override
  List<Object?> get props => [view];

  @override
  bool operator == (Object other) {
    if(identical(this, other)) return true;

    return other is AuthSuccessful && other.auth == auth;
  }

  @override
  int get hashCode => auth.hashCode;
}

class AuthError extends AuthState {
  final Object message;
  const AuthError(this.message);

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;

    return other is AuthError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  List<Object?> get props => [view];
}