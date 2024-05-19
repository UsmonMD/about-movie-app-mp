import 'package:flutter/material.dart';
import 'package:movies_app/ui/components/detail_components/detail_tab_views/about_movie_view.dart';
import 'package:movies_app/ui/components/detail_components/detail_tab_views/detail_actors_page.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class DetailPageTab extends StatelessWidget {
  const DetailPageTab({super.key, this.index = 0});

  final int index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(text: 'About Movie'),
              Tab(text: 'Cast'),
            ],
            isScrollable: true,
            indicatorColor: AppColors.greenColor,
            indicatorWeight: 4,
            dividerColor: Colors.transparent,
            labelStyle: AppStyle.fontStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
            splashFactory: NoSplash.splashFactory,
          ),
          const SizedBox(
            height: 403,
            width: double.infinity,
            child: TabBarView(
              children: [
                DetailPageAboutMovie(),
                DetailPageCast(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
