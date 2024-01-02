import 'package:flutter/cupertino.dart';

enum BottomMenu {
  movies,
  tv,
  browse,
  profile,
  more,
}

String menuItemName(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.movies:
      return 'Movies';
    case BottomMenu.tv:
      return 'Tv Shows';
    case BottomMenu.browse:
      return 'Browse';
    case BottomMenu.profile:
      return 'Profile';
    case BottomMenu.more:
      return 'More';
    default:
      return '';
  }
}

IconData menuIcon(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.movies:
      return CupertinoIcons.film;
    case BottomMenu.tv:
      return CupertinoIcons.tv;
    case BottomMenu.browse:
      return CupertinoIcons.circle_grid_3x3_fill;
    case BottomMenu.profile:
      return CupertinoIcons.profile_circled;
    case BottomMenu.more:
      return CupertinoIcons.ellipsis;
  }
}
