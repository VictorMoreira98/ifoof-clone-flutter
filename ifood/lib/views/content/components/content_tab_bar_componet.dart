import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentTabBarComponent extends StatelessWidget {
  final TabController controller;
  final Function(int) onTap;

  const ContentTabBarComponent({Key key, this.controller, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ContentTabBarComponenteDelegate(controller, onTap),
    );
  }
}

class _ContentTabBarComponenteDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  final Function(int) onTap;

  _ContentTabBarComponenteDelegate(this.controller, this.onTap);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: (width / 2) - 16),
      child: TabBar(
          onTap: onTap,
          labelColor: AppColors.primaryColor,
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          unselectedLabelColor: AppColors.black54,
          labelStyle: AppTypography.tabBarStyle(context),
          indicator: MaterialIndicator(
              color: AppColors.primaryColor,
              height: 2,
              bottomLeftRadius: 5,
              bottomRightRadius: 5),
          controller: controller,
          tabs: [
            Tab(
              child: Align(
                  alignment: Alignment.centerLeft, child: Text('Restaurantes')),
            ),
            Tab(
              child: Text('Mercados'),
            ),
          ]),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
