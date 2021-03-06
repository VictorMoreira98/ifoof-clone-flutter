import 'package:flutter/material.dart';
import 'package:ifood/controllers/content_controller.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/core/theme/app_images.dart';
import 'package:ifood/models/category.dart';
import 'package:ifood/views/content/components/banners_component.dart';
import 'package:ifood/views/content/components/bottom_navigator_component.dart';
import 'package:ifood/views/content/components/category_item_component.dart';

import 'package:ifood/views/content/components/content_tab_bar_componet.dart';
import 'package:ifood/views/content/components/filter_components.dart';
import 'package:ifood/views/content/components/header_local_component.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final controller = ContentController();
  List<Category> categorys;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    categorys = controller.getCategory();
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        body: SafeArea(
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innetBoxScroll) {
          return [
            HeaderLocationComponent(
              location: 'Rua das Flores do Campo, 10',
            ),
            FiltersComponent(),
            ContentTabBarComponent(
              controller: tabController,
              onTap: (index) {},
            )
          ];
        },
        body: Column(
          children: [
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                return await Future.value();
              },
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 86,
                      child: ListView.builder(
                        itemCount: categorys.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 16 : 0,
                                right: index == categorys.length - 1 ? 16 : 10),
                            child: CategoryItemComponent(
                              category: categorys[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 170,
                      child: BannersComponent(
                        list: [
                          BannerItemComponent(
                            imagePath: AppImages.banner1,
                          ),
                          BannerItemComponent(
                            imagePath: AppImages.banner1,
                          ),
                          BannerItemComponent(
                            imagePath: AppImages.banner1,
                          ),
                          BannerItemComponent(
                            imagePath: AppImages.banner1,
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
