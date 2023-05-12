import 'package:app_test/src/domain/repositories/get_all_news_repository.dart';
import 'package:app_test/src/domain/usecases/get_all_news_usecase.dart';

import '../entities/news_entity.dart';

class GetAllNewsUsecaseImp implements GetAllNewsUsecase {
  final GetAllNewsRepository _repository;
  GetAllNewsUsecaseImp(this._repository);

  @override
  Future<List<NewsEntity>> getAllNews() async {
    return await _repository.getAllNews();
  }
}
