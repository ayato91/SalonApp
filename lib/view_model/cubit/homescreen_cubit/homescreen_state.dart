part of 'homescreen_cubit.dart';

sealed class HomescreenState {}

final class Initial extends HomescreenState {}

final class NavBarState extends HomescreenState {}

final class ServiceItemState extends HomescreenState {}

final class FavouriteItemState extends HomescreenState {}
