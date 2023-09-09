import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/components.dart';
import '../moudels/search_screan/Search.dart';
import '../style/color.dart';
import '../widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;
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
          slivers: [
            NewsListViewBuilder(
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}
