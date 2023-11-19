import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:flutter/material.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Initial());

  bool loading = false;
  int counter = 30;
  MainAxisAlignment align = MainAxisAlignment.spaceEvenly;
  void showLoading(bool bool) {
    loading = bool;
    loading ? emit(Loading()) : emit(Paused());
  }

  void alignmentChange() {
    align = MainAxisAlignment.start;
    emit(ChangeAlignment());
  }

  void alignmentRestore() {
    align = MainAxisAlignment.spaceEvenly;
    emit(Initial());
  }

  void startTimer() {
    counter = 59;
    emit(Countdown());
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        counter--;
        emit(Countdown());
      } else {
        emit(Paused());
        timer.cancel();
      }
    });
  }
}
