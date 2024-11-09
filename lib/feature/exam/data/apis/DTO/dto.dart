import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/questions_cached_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import 'package:quizz_app/feature/exam/data/models/exam_question_models/exam_questions_reponse_model.dart';
import 'package:quizz_app/feature/exam/data/models/subject_models/subject_response.dart';
import 'package:quizz_app/feature/exam/domain/entities/exam_question_entity.dart';
import '../../../domain/entities/answer_entity.dart';
import '../../../domain/entities/exam_entity.dart';
import '../../../domain/entities/subject_item_entity.dart';
import '../../models/exam_by_subject_id_models/exams_by_subject_response.dart';

abstract class DTOs {
  static List<SubjectItemEntity> subjectResponseDTO(SubjectResponse response) {
    return response.subjects?.map((subject) {
          return SubjectItemEntity(subject.Id, subject.name, subject.icon);
        }).toList() ??
        [];
  }

  static List<SubjectItemEntity> subjectCachedDTO(
      List<SubjectCachedModel> list) {
    return list.map((subject) {
          return SubjectItemEntity(subject.id, subject.name, subject.icon);
        }).toList() ??
        [];
  }

  static List<ExamEntity> examsResponseByIdDto(
      ExamsBySubjectResponse examResponse) {
    return examResponse.exams?.map((exam) {
          return ExamEntity(exam.Id, exam.title, exam.duration, exam.subject,
              exam.numberOfQuestions);
        }).toList() ??
        [];
  }

  static List<ExamEntity> examsCachedByIdDto(
      List<SubjectExamsCachedModel> cachedExams) {
    return cachedExams.map((exam) {
      return ExamEntity(exam.examId, exam.title, exam.duration, exam.subjectId,
          exam.numberOfQuestions);
    }).toList();
  }

  static List<ExamQuestionsEntity> examQuestionsByExamIdDto(
      ExamQuestionsReponseModel response) {
    return response.questions?.map((item) {
          var answers = item.answers
                  ?.map((answer) => AnswersEntity(answer.answer, answer.key))
                  .toList() ??
              [];
          var exam = ExamEntity(
            item.exam?.Id,
            item.exam?.title,
            item.exam?.duration,
            item.exam?.subject,
            item.exam?.numberOfQuestions,
          );

          return ExamQuestionsEntity(
              answers, item.type, item.Id, item.question, item.correct, exam);
        }).toList() ??
        [];
  }

  static List<ExamQuestionsEntity> examQuestionsCachedDto(
       List<QuestionsCachedModel> response) {
    return response.map((item){
      var answers = item.answers
          ?.map((answer) => AnswersEntity(answer.answer, answer.key))
          .toList() ??
          [];
      var exam = ExamEntity(
        item.exam?.examId,
        item.exam?.title,
        item.exam?.duration,
        item.exam?.subjectId,
        item.exam?.numberOfQuestions,
      );
      return ExamQuestionsEntity(
          answers, item.type, item.id, item.question, item.correct, exam);
    }).toList()??[];
  }

  static List<ExamEntity> getResultsExam(List<SubjectExamsCachedModel>? exam){
    List<ExamEntity> list = [];
    for(var item in exam!){
      list.add(
        ExamEntity(item.examId, item.title, item.duration, item.subjectId, item.numberOfQuestions)
      );
    }
    return list;
  }
}
