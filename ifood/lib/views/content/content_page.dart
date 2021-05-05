import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/views/content/components/bottom_navigator_component.dart';

import 'package:ifood/views/content/components/content_tab_bar_componet.dart';
import 'package:ifood/views/content/components/header_local_component.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innetBoxScroll) {
          return [
            HeaderLocationComponent(
              location: 'Rua das Flores do Campo, 10',
            ),
            ContentTabBarComponent(
              controller: tabController,
              onTap: (index) {},
            )
          ];
        },
        body: Column(
          children: [
            Expanded(
                child: CustomScrollView(
              physics: BouncingScrollPhysics(),
            )),
            BottomNavigatorComponet(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
              items: [
                BottomNavigatorItemComponent(
                  label: 'Incio',
                  activeIcon: AppIcons.homeActive,
                  icon: AppIcons.home,
                ),
                BottomNavigatorItemComponent(
                  label: 'Busca',
                  activeIcon: AppIcons.searchActive,
                  icon: AppIcons.search,
                ),
                BottomNavigatorItemComponent(
                  label: 'Pedidos',
                  activeIcon: AppIcons.orders_active,
                  icon: AppIcons.orders,
                ),
                BottomNavigatorItemComponent(
                  label: 'Perfil',
                  activeIcon: AppIcons.profileActive,
                  icon: AppIcons.profile,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
