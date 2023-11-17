import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/view/main_screen.dart';
import 'package:salon_app/view/auth/otp_verifypage.dart';
import 'package:salon_app/view_model/cubit/login_cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormFieldState>();
    TextEditingController number = TextEditingController();
    final auth = FirebaseAuth.instance;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final model = context.read<LoginCubit>();
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 5),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homescreen()));
                    },
                    child: const Text('SKIP',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.redAccent,
                        ))),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.sizeOf(context).height / 2.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Capture.PNG'),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: const PhysicalModel(
                shape: BoxShape.circle,
                elevation: 2,
                color: Colors.transparent,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: Icon(
                    Icons.login,
                    color: Colors.black,
                    size: 35,
                  ),
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(28),
              height: MediaQuery.sizeOf(context).height / 2.6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: model.align,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    key: key,
                    controller: number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Mobile Number ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    showCursor: true,
                    onTap: () => model.alignmentChange(),
                    onTapOutside: (_) {
                      model.alignmentRestore();
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(1)),
                        labelText: 'Enter Mobile Number',
                        labelStyle: const TextStyle(
                            fontSize: 14, color: Colors.black26),
                        suffixIcon: const Icon(Icons.phone_in_talk_outlined,
                            color: Colors.black26)),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                      height: 46,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (number.text == '') {
                              model.showLoading(false);
                              key.currentState!.validate();
                            } else {
                              model.showLoading(true);
                              auth.verifyPhoneNumber(
                                  phoneNumber: '+91${number.text}',
                                  verificationCompleted: (_) {
                                    model.showLoading(false);
                                  },
                                  verificationFailed: (e) {
                                    model.showLoading(false);
                                    debugPrint(e.toString());
                                    //todo exception
                                  },
                                  codeSent: (verificationId, token) {
                                    model.startTimer();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OTPVerifyPage(
                                                  verificationId:
                                                      verificationId,
                                                )));
                                    model.showLoading(false);
                                  },
                                  codeAutoRetrievalTimeout: (e) {
                                    debugPrint(e.toString());
                                    //todo exception
                                    model.showLoading(false);
                                  });
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xFF1F4260))),
                          child: model.loading
                              ? const CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white)
                              : Text('Continue'.toUpperCase(),
                                  style:
                                      const TextStyle(color: Colors.white)))),
                  const SizedBox(height: 20),
                  RichText(
                      text: const TextSpan(
                          text: '     By continuing you are agree to our\n',
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.22),
                          children: [
                        TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF285750))),
                        TextSpan(text: ' and '),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF285750))),
                      ]))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
