import 'package:firebase_auth/firebase_auth.dart';

String firebaseAuthErrorMessage (FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'You input Invalid e-mail';

    case 'unknown':
      return 'input e-mail and password';
      break;
    // case 'wrong-password':
    //   result = FirebaseAuthResultStatus.WrongPassword;
    //   break;
    // case 'user-disabled':
    //   result = FirebaseAuthResultStatus.UserDisabled;
    //   break;
    // case 'user-not-found':
    //   result = FirebaseAuthResultStatus.UserNotFound;
    //   break;
    // case 'operation-not-allowed':
    //   result = FirebaseAuthResultStatus.OperationNotAllowed;
    //   break;
    // case 'too-many-requests':
    //   result = FirebaseAuthResultStatus.TooManyRequests;
    //   break;
    // case 'email-already-exists':
    //   result = FirebaseAuthResultStatus.EmailAlreadyExists;
    //   break;
    default:
      return e.message.toString();
  }
}