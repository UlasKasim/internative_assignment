import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:kernel/kernel.dart';

class BlogDetailsPage extends StatefulWidget {
  final Blog blog;
  const BlogDetailsPage({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  late BlogDetailsVC vc;

  @override
  void initState() {
    super.initState();
    vc = Get.put(BlogDetailsVC(widget.blog));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: KColors.primaryColor,
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () => vc.onFavoritePressed(vc.blogX.value),
              iconSize: 30,
              icon: const Icon(Icons.favorite),
              color: vc.isFavorite(vc.blogX.value) ? KColors.negativeColor : KColors.primaryColor,
            ),
          ),
        ],
        title: Text(
          "Article Detail",
          style: KTextStyle.h1(
            textStyleBase: const TextStyleBase(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return ListView(
      children: [
        Container(
          height: Suw.h(700),
          width: Suw.w(1080),
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Image.network(widget.blog.image!, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTitle(
            titleText: widget.blog.title!,
            style: KTextStyle.h1(
              textStyleBase: const TextStyleBase(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlWidget(widget.blog.content!, textStyle: KTextStyle.h2()),
        ),
      ],
    );
  }
}
