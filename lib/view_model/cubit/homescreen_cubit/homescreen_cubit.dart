import 'package:flutter_bloc/flutter_bloc.dart';
part 'homescreen_state.dart';

class HomescreenCubit extends Cubit<HomescreenState> {
  HomescreenCubit() : super(Initial());
  int navIndex = 0;
  int serviceIndex = 0;

  void navItemChange(int value) {
    navIndex = value;
    emit(NavBarState());
  }

  void serviceItemChange(int index) {
    serviceIndex = index;
    emit(ServiceItemState());
  }

  void favouriteItem(int index) {
    emit(FavouriteItemState());
  }
}
