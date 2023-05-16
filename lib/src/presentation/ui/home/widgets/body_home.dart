import 'package:app_test/src/domain/entities/news_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data/datasources/remote/get_all_news_remote_datasource_imp.dart';
import '../../../../data/repositories/get_all_news_repository_imp.dart';
import '../../../../domain/usecases/get_all_news_usecase_imp.dart';
import 'button_news_home.dart';

final moviesRepositoryProvider = Provider((ref) async {
  final getAllNewsDatasource = GetAllNewsRemoteDatasourceImp();
  final getAllNewsRepo = GetAllNewsRepositoryImp(getAllNewsDatasource);
  final getNews = GetAllNewsUsecaseImp(getAllNewsRepo);
  return await getNews.getAllNews();
});

class HomeBody extends HookConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(moviesRepositoryProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 360,
              height: 600,
              child: FutureBuilder<List<NewsEntity>>(
                future: news,
                builder: (context, AsyncSnapshot<List<NewsEntity>> snapshot) {
                  if (snapshot.hasData) {
                    return HomeNewsButton(
                      snapshot: snapshot,
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 87, 87, 87),
                      highlightColor: Colors.grey.shade500,
                      enabled: true,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              height: 300.0,
                              color: const Color.fromARGB(255, 45, 29, 121),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
