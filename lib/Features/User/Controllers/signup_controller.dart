import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fetin_2024_3/Features/User/Controllers/session_controller.dart';

import '../Screens/SignUp/verify_email_page.dart';

// SignUpController is used to store user data will he signup and alse create User Email And Password Authentication for login

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  DatabaseReference ref = FirebaseDatabase.instance.ref('Usuário');

  // final userRepo = Get.put(UserRepository());

  void signUp(String username, String email, String password, String Phone,
      String Usertype) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    UserCredential? userCredential;
    try {
      userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userid = value.user!.uid.toString();

        ref.child(value.user!.uid.toString()).set({
          'email': value.user!.email.toString(),
          // 'password': password,
          'Nome de Usuário': username,
          'Telefone': Phone,
          'Tipo de usuário': Usertype,

        });

        Get.offAll(() => const VerifyEmailPage());
        Get.snackbar("Sucesso", "Inscrito com sucesso");
      }).onError((error, stackTrace) {
        if (error.toString().contains("e-mail já em uso")) {
          Get.snackbar("Erro", "E-mail já em uso");
        } else if (error.toString().contains("Senha Fraca")) {
          Get.snackbar("Erro", "A senha deve ter pelo menos 6 caracteres");
        } else if (error.toString().contains("email inválido")) {
          Get.snackbar("Erro", "Email Inválido");
        } else if (error.toString().contains("falha na solicitação de rede")) {
          Get.snackbar("Erro", "Verifique sua conexão com a Internet");
        } else {
          Get.snackbar("Erro", error.toString());
        }
      });
    } catch (error) {
      Get.snackbar("Erro", error.toString());
      debugPrint(error.toString());
    }
  }
}