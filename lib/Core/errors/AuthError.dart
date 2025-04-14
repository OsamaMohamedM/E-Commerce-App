abstract class AuthFailure {
  final String message;

  AuthFailure(this.message);
}

class ServerFailure extends AuthFailure {
  ServerFailure(String message) : super(message);
}

class NotAuthenticated extends AuthFailure {
  NotAuthenticated() : super('User not authenticated');
}

class ReauthRequired extends AuthFailure {
  ReauthRequired() : super('Please re-authenticate to proceed');
}
