import 'package:app_test/src/domain/entities/news_entity.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeNewsButton extends StatelessWidget {
  late final AsyncSnapshot<List<NewsEntity>> news;

  HomeNewsButton({Key? key, required AsyncSnapshot<List<NewsEntity>> snapshot}) : super(key: key) {
    news = snapshot;
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    var myGroup = AutoSizeGroup();

    return ListView.builder(
      itemCount: news.data!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                width: 300,
                height: 300,
                child: ElevatedButton(
                  onPressed: () => _launchUrl(news.data![index].url),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 19, 19, 19)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  news.data![index].title,
                                  minFontSize: 20,
                                  maxFontSize: 25,
                                  maxLines: 5,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  group: myGroup,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  news.data![index].publishedAt,
                                  minFontSize: 5,
                                  maxFontSize: 15,
                                  maxLines: 1,
                                  group: myGroup,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.network(
                        news.data![index].imageURL,
                        width: 300,
                        height: 250,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
