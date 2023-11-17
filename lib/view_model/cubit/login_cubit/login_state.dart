part of 'login_cubit.dart';

sealed class LoginState {}

final class Initial extends LoginState {}

final class Loading extends LoginState {}

final class Countdown extends LoginState {}

final class Paused extends LoginState {}

final class ChangeAlignment extends LoginState {}
