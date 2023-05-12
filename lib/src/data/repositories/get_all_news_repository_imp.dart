import 'package:app_test/src/data/datasources/get_all_news_datasource.dart';
import 'package:app_test/src/domain/repositories/get_all_news_repository.dart';

import '../../domain/entities/news_entity.dart';

class GetAllNewsRepositoryImp implements GetAllNewsRepository {
  final GetAllNewsDatasource _datasource;
  GetAllNewsRepositoryImp(this._datasource);

  @override
  Future<List<NewsEntity>> getAllNews() async {
    return await _datasource.getAllNews();
  }
}
