import 'package:chat_bot/helper/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends Authrepo {
  FirebaseAuth? _firebaseAuth;
  AuthRepoImpl() {
    _firebaseAuth = FirebaseAuth.instance;
  }
  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    final res = await _firebaseAuth!
        .signInWithEmailAndPassword(email: email, password: password);
    return res;
  }

  @override
  Future forgotpassword({required String email}) async {
    final res = await _firebaseAuth!.sendPasswordResetEmail(email: email);
    return res;
  }

  @override
  Future logout() async {
    await _firebaseAuth!.signOut();
  }

  @override
  Future verifyemail() async {
    await _firebaseAuth!
        .isSignInWithEmailLink(GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD);
  }

  @override
  Future register(
      {required String email,
      required String password,
      required String name}) async {
    await _firebaseAuth!
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future verifynumber({required int number}) async {
    await _firebaseAuth!.verifyPhoneNumber(
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {},
      codeSent: (verificationId, forceResendingToken) {},
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
