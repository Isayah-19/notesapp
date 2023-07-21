import 'package:notesapp/services/auth/auth_provider.dart';
import 'package:notesapp/services/auth/auth_user.dart';
import 'package:notesapp/services/auth/firebase_auth_provider.dart';

//Why is an AuthService an AuthProvider?
//It relays the messages of the given auth provider, but can have more logic

class AuthService implements AuthProvider {
  //Dependency injection
  //AuthService is dependent on a provider using a const constructor initializer,
  //we are injecting the provider into it
  final AuthProvider provider;
  const AuthService(this.provider);

  //the responsibility of the firebase factory here is to
  //return an instance of our AuthService thst is already
  //configured with a firebase authProvider
  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  //implement currentUser
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();
}
