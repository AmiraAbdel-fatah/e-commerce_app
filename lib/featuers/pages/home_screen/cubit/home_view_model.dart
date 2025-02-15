import 'package:e_commerce/featuers/pages/home_screen/cubit/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/favorite_tab/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/product_tab/product_tab.dart';
import '../tabs/user_tab/user_tab.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());

  //Todo: hold data - handel logic
  int selectedIndex = 0;
  List<Widget> bodyList = [HomeTab(), ProductTab(), FavoriteTab(), UserTab()];

  void bottomNavigationOnTab(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}
