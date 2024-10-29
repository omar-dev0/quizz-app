import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/home_repo.dart';

@injectable
class HomeUseCase{
  HomeRepo _homeRepo;
  HomeUseCase(this._homeRepo);
  Future<Either<ServerFailure,List<SubjectItemEntity>>> invoke() async{
    return await _homeRepo.getSubject();
  }

  Future<Either<ServerFailure,List<ExamEntity>>> invokeExam(String subjectId) async {
    return await _homeRepo.getExam(subjectId);
  }
}