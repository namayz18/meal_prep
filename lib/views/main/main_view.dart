import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/views/explore/explore_view.dart';
import 'package:meal_prep/views/home/home_view.dart';
import 'package:meal_prep/views/profile/profile_view.dart';
import 'package:meal_prep/views/recipe/recipe_view.dart';
import 'package:meal_prep/views/shopping/shopping_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeView(),
            ExploreView(),
            ShoppingView(),
            RecipeView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/House.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.secondary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/House.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Magnifier.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.secondary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Magnifier.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                SvgPicture.asset(
                  "assets/icons/Bag.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    context.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            activeIcon: Stack(
              alignment: Alignment.topRight,
              children: [
                SvgPicture.asset(
                  "assets/icons/Bag.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    context.primary,
                    BlendMode.srcIn,
                  ),
                ),
                Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chart.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.secondary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Chart.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Profile.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.secondary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Profile.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: context.primary,
        unselectedItemColor: context.secondary,
        unselectedLabelStyle: TextStyle(color: context.secondary),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.onPrimary,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}
