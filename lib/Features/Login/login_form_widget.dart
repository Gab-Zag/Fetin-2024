import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fetin_2024_3/Features/Response Screen/emergencies_screen.dart';
import '../User/Controllers/login_controller.dart';
import '../User/Screens/Forget Password/forget_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final controller = Get.put(LoginController());
  String? email1, password1;
  bool _isObscure = true;
  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30 - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 250),
            TextFormField(
              controller: controller.emailController,
              validator: (value) {
                bool _isEmailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);
                if (!_isEmailValid) {
                  return 'E-mail inválido.';
                }
                // Return null if the entered username is valid
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                hintText: "Email",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 30 - 10),

            TextFormField(
              controller: controller.passwordController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Este campo é obrigatório';
                }
                if (value.trim().length < 6) {
                  return 'A senha deve ser válida';
                }
                // Return null if the entered username is valid
                return null;
              },
              obscureText: _isObscure,




              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),



                prefixIcon: const Icon(Icons.fingerprint),
                labelText: "Senha",
                hintText: "Senha",
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 30 - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Colors.transparent)))),
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(color: Colors.lightGreen),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {
                  // if statement will check validation then we will send input data to Login controller for validation
                  if (formkey.currentState!.validate()) {
                    LoginController.instance.loginUser(
                        controller.emailController.text.toString(),
                        controller.passwordController.text.trim());
                  }



                },
                child: Text("Entrar".toUpperCase()),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {
                Get.to(const EmergenciesScreen());
                },
                child: Text("TELA DE ADMINISTRAÇÃO".toUpperCase()),
              ),
            )

          ],
        ),
      ),
    );
  }
}



