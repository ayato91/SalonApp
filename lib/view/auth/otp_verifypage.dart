import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/view/main_screen.dart';
import 'package:salon_app/view_model/cubit/login_cubit/login_cubit.dart';

class OTPVerifyPage extends StatefulWidget {
  const OTPVerifyPage({super.key, required this.verificationId});
  final String verificationId;
  @override
  State<OTPVerifyPage> createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  @override
  Widget build(BuildContext context) {
    final otp = TextEditingController();
    final key = GlobalKey<FormFieldState>();
    double height = MediaQuery.sizeOf(context).height / 2.8;
    final auth = FirebaseAuth.instance;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final model = context.watch<LoginCubit>();
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
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
                    Icons.password_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(28),
              height: height,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: model.align,
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter OTP (One Time Password)';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    onTap: () => model.alignmentChange(),
                    onTapOutside: (_) {
                      model.alignmentRestore();
                      FocusScope.of(context).unfocus();
                    },
                    keyboardType: TextInputType.number,
                    controller: otp,
                    key: key,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      height: 46,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            key.currentState!.validate();
                            if (otp.text == '') {
                              model.showLoading(false);
                            } else {
                              model.showLoading(true);
                              final credential = PhoneAuthProvider.credential(
                                  verificationId: widget.verificationId,
                                  smsCode: otp.text.toString());
                              try {
                                await auth.signInWithCredential(credential);
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Homescreen()));
                                model.showLoading(false);
                              } catch (e) {
                                debugPrint(e.toString());
                                //todo exception
                                model.showLoading(false);
                              }
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
                  SizedBox(
                    height: 30,
                    child: model.counter == 0
                        ? TextButton(
                            onPressed: () {
                              //resend code
                            },
                            child: const Text('Resend OTP?',
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.underline)))
                        : Text(
                            'Resend Code in ${context.watch<LoginCubit>().counter} s',
                            style: const TextStyle(color: Colors.redAccent),
                          ),
                  ),
                  RichText(
                      text: const TextSpan(
                          text: '    By continuing you are agree to our\n',
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.22),
                          children: [
                        TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(color: Color(0xFF28577c))),
                        TextSpan(text: ' and '),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Color(0xFF28577C))),
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
