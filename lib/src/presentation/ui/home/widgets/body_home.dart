import 'package:app_test/src/domain/entities/news_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              height: 500,
              child: FutureBuilder<List<NewsEntity>>(
                future: news,
                builder: (context, AsyncSnapshot<List<NewsEntity>> snapshot) {
                  if (snapshot.hasData) {
                    return HomeNewsButton(
                      snapshot: snapshot,
                    );
                  } else {
                    return const CircularProgressIndicator();
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
