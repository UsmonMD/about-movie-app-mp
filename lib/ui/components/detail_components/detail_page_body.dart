import 'package:flutter/material.dart';
import 'package:movies_app/ui/components/detail_components/detail_big_image.dart';
import 'package:movies_app/ui/components/detail_components/detail_title.dart';
import 'package:movies_app/ui/components/body/info_widget.dart';
import 'package:movies_app/ui/components/detail_components/detail_tab_view_widget.dart';
import 'package:movies_app/ui/components/detail_components/top10_from_detail_list_widget.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: const [
        SizedBox(height: 10),
        Top10DeatilListWidget(),
        SizedBox(height: 20),
        DetailMovieCover(),
        SizedBox(height: 12.06),
        DetailMovieTitle(),
        MovieInfoWidget(),
        SizedBox(height: 32.5),
        DetailPageTab(),
      ],
    );
  }
}
