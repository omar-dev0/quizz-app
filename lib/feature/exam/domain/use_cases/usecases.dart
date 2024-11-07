import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/feature/exam/domain/core/server_failure.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import 'package:quizz_app/feature/exam/domain/entities/subject_item_entity.dart';
import 'package:quizz_app/feature/exam/domain/repositories/exam_repo.dart';
import 'package:quizz_app/feature/exam/domain/repositories/exams_quesions_repo.dart';
import 'package:quizz_app/feature/exam/domain/repositories/home_repo.dart';

@injectable
class UseCases{
  HomeRepo _homeRepo;
  ExamRepo _examRepo;
  ExamQuestionsRepo _examQuestionsRepo;

  UseCases(this._homeRepo, this._examRepo, this._examQuestionsRepo);

  Future<Either<ServerFailure,List<SubjectItemEntity>>> invoke() async{
    return await _homeRepo.getSubject();
  }

  Future<Either<ServerFailure,List<ExamEntity>>> invokeExam(String subjectId) async {
    return await _examRepo.getExam(subjectId);
  }

  Future<Either<ServerFailure,List<ExamQuestionsEntity>>> invokeExamQuestions(String examId) async{
    return await _examQuestionsRepo.getQuestions(examId);
  }
}