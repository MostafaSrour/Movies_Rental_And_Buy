import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottomMenu.dart';
import 'comingSoonPage.dart';
import 'moviePage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomMenu _layoutSelection = BottomMenu.movies;
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                menuItemName(_layoutSelection),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(color: Colors.white),
              ),
              const Padding(padding: EdgeInsets.only(right: 8)),
              Icon(menuIcon(_layoutSelection),
                  size: 28, color: Colors.deepPurple),
            ],
          ),
          actions: <Widget>[
            Center(
              child: IconButton(
                  onPressed: () => {},
                  icon: const Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.shopping_cart,
                            size: 28, color: Colors.white),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.deepPurple,
                          child: Text("!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
          activeColor: Colors.deepPurpleAccent,
          backgroundColor: Colors.black,
          currentIndex: tabIndex,
          items: <BottomNavigationBarItem>[
            _buildMenuItem(
                icon: CupertinoIcons.film,
                iconSelected: CupertinoIcons.film_fill,
                bottomMenu: BottomMenu.movies),
            _buildMenuItem(
                icon: CupertinoIcons.tv,
                iconSelected: CupertinoIcons.tv_fill,
                bottomMenu: BottomMenu.tv),
            _buildMenuItem(
                icon: CupertinoIcons.circle_grid_3x3,
                iconSelected: CupertinoIcons.circle_grid_3x3_fill,
                bottomMenu: BottomMenu.browse),
            _buildMenuItem(
                icon: CupertinoIcons.person_crop_circle,
                iconSelected: CupertinoIcons.person_crop_circle_fill,
                bottomMenu: BottomMenu.profile),
            _buildMenuItem(
                icon: CupertinoIcons.ellipsis,
                iconSelected: CupertinoIcons.ellipsis,
                bottomMenu: BottomMenu.more),
          ],
          onTap: _onSelectMenuItem,
        ),
        body: _buildPage(),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildPage() {
    switch (_layoutSelection) {
      case BottomMenu.movies:
        return MoviePage();
      case BottomMenu.tv:
        return ComingSoonPage(menuIcon(_layoutSelection));
      case BottomMenu.browse:
        return ComingSoonPage(menuIcon(_layoutSelection));
      case BottomMenu.profile:
        return ComingSoonPage(menuIcon(_layoutSelection));
      case BottomMenu.more:
        return ComingSoonPage(menuIcon(_layoutSelection));
    }
  }

  BottomNavigationBarItem _buildMenuItem(
      {required IconData icon,
      required IconData iconSelected,
      required BottomMenu bottomMenu}) {
    String text = menuItemName(bottomMenu);
    IconData setIcon = _setIconSelected(
        bottomMenu: bottomMenu, icon: icon, iconSelected: iconSelected);
    return BottomNavigationBarItem(
        icon: Icon(
          setIcon,
        ),
        label: text);
  }

  IconData _setIconSelected(
      {required BottomMenu bottomMenu,
      required IconData icon,
      required IconData iconSelected}) {
    return _layoutSelection == bottomMenu ? iconSelected : icon;
  }

  // Color _setMenuItemColor({required BottomMenu bottomMenu}) {
  //   return _layoutSelection == bottomMenu ? Colors.blueAccent : Colors.grey;
  // }

  void _onSelectMenuItem(int index) {
    tabIndex = index;
    switch (index) {
      case 0:
        _onLayoutSelected(BottomMenu.movies);
        break;
      case 1:
        _onLayoutSelected(BottomMenu.tv);
        break;
      case 2:
        _onLayoutSelected(BottomMenu.browse);
        break;
      case 3:
        _onLayoutSelected(BottomMenu.profile);
        break;
      case 4:
        _onLayoutSelected(BottomMenu.more);
        break;
    }
  }

  void _onLayoutSelected(BottomMenu selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }
}
