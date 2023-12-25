import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLodging());

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(LoginFailure(errMessage: 'تنسيق البريد الإلكتروني خاطئ'));
      } else if (e.code == 'user-not-found') {
        emit(LoginFailure(
            errMessage: 'لم يتم العثور على مستخدم لهذا البريد الإلكتروني.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'كلمة المرور خاطئة'));
      }
    }
  }
}
