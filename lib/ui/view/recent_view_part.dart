import 'package:flutter/material.dart';
import 'package:flutter_cat/model/cat.dart';
import 'package:flutter_cat/presenter/cat_view_presenter.dart';
import 'package:flutter_cat/ui/widget/image_loader.dart';
import 'package:provider/provider.dart';

class RecentViewPart extends StatefulWidget {
  const RecentViewPart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecentViewPartState();
}

class _RecentViewPartState extends State<StatefulWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Cat> recentGifs = context.read<CatViewPresenter>().getRecent();

    return ListView.separated(
      padding: const EdgeInsets.only(top: 60),
      itemCount: recentGifs.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text("Recent",
                      style: TextStyle(color: Colors.black87, fontSize: 30))),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: ImageLoader(
                      url: recentGifs[index].url!,
                      progressIndicator: const Image(
                          image: AssetImage("assets/images/cat.gif"),
                          width: 300,
                          height: 200),
                      errorIndicator: const Image(
                          image: AssetImage("assets/images/error.gif"),
                          width: 300,
                          height: 200,
                          ),
                      hasError: false))
            ],
          );
        } else {
          return ImageLoader(
              url: recentGifs[index].url!,
              progressIndicator: const Image(
                  image: AssetImage("assets/images/cat.gif"),
                  width: 300,
                  height: 200),
              errorIndicator: const Image(
                  image: AssetImage("assets/images/error.gif"),
                  width: 300,
                  height: 200),
              hasError: false);
        }
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
