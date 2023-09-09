import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/components/components.dart';

import '../../style/color.dart';
import '../../widgets/categories_list_view.dart';
import '../../widgets/news_list_view_builder.dart';
import '../search_screan/Search.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: appBarBackGround,
        title: Text(
          'N e w s  A p p ',
          style: GoogleFonts.bebasNeue(
              textStyle: const TextStyle(
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.amberAccent,
              size: 30,
            ),
            onPressed: () {
              NavigatorTo(context, Search());
            },
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Text('Choose your topics',
                  style: GoogleFonts.overpass(
                    textStyle: const TextStyle(
                        color: titleTopic,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            //   const Topics(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            //  line(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            // advertisementsContainer(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            //      line(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'For you',
                style: GoogleFonts.overpass(
                  textStyle: const TextStyle(
                      color: titleTopic,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const NewsListViewBuilder(
              category: 'general',
            ),
          ],
        ),
      ),
    );
  }
}
