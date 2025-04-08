import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_books/const/colors/app_colors.dart';
import 'package:my_books/core/router/router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [BooksRoute(), FavouriteRoute()],
      homeIndex: 0,
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColors.kprimaryColor,
            labelTextStyle: WidgetStateProperty.all(
              GoogleFonts.poppins(
                fontSize: 10,
                color: AppColors.grey900,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          child: NavigationBar(
            elevation: 10,
            selectedIndex: tabsRouter.activeIndex,
            height: 55,
            backgroundColor: AppColors.grey100.withValues(alpha: 0.2),
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.book,
                  size: 28,
                ),
                label: 'Favourite',
              ),
            ],
          ),
        );
      },
    );
  }
}
