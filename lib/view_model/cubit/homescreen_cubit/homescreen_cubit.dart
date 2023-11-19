import 'package:flutter_bloc/flutter_bloc.dart';
part 'homescreen_state.dart';

class HomescreenCubit extends Cubit<HomescreenState> {
  HomescreenCubit() : super(Initial());
  int navIndex = 0;
  int serviceCategoryIndex = 0;
  // List favouriteItems = [];
  List<bool> isFavourited = [true, false, false, false];

  void navItemChange(int value) {
    navIndex = value;
    emit(NavBarState());
  }

  void serviceCategoryChange(int index) {
    serviceCategoryIndex = index;
    emit(ServiceItemState());
  }

  void favouriteItem(int index) {
    isFavourited[index] = !isFavourited[index];
    emit(FavouriteItemState());
  }
}
