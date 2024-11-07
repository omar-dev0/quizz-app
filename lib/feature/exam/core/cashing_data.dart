import 'package:hive/hive.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/quesions_model/questions_cached_model.dart';
import 'package:quizz_app/feature/exam/data/data_sources/offline_data_source/models/subject_exams_model/subject_exams_model.dart';
import 'package:quizz_app/feature/exam/data/models/exam_question_models/exam_questions_reponse_model.dart';
import '../../../../core/resources/app_constant.dart';
import '../data/data_sources/offline_data_source/models/quesions_model/answers_cached.dart';
import '../data_sources/offline_data_source/models/subjects_model/subject_cached_model.dart';
import '../data/models/exam_by_subject_id_models/exams_by_subject_response.dart';
import '../domain/entities/subject_item_entity.dart';

abstract class CachingData {
  static void cachedSubject(List<SubjectItemEntity> subjects) {
    var box = Hive.box<SubjectCachedModel>(AppConstant.kSubjectsHiveBox);
    box.addAll(_covertToSubjectCachedModel(subjects));
  }

  static List<SubjectCachedModel> _covertToSubjectCachedModel(
      List<SubjectItemEntity> list) {
    List<SubjectCachedModel> subjects = [];
    for (var subject in list) {
      subjects.add(SubjectCachedModel(subject.id, subject.name, subject.icon));
    }
    return subjects;
  }

  static void cachedSubjectExams(ExamsBySubjectResponse response) {
    var box =
        Hive.box<SubjectExamsCachedModel>(AppConstant.kSubjectExamsHiveBox);
    box.addAll(_convertToSubjectExamsCachedModel(response));
  }

  static List<SubjectExamsCachedModel> _convertToSubjectExamsCachedModel(
      ExamsBySubjectResponse response) {
    List<SubjectExamsCachedModel> list = [];
    for (var exam in response.exams!) {
      list.add(SubjectExamsCachedModel(exam.Id, exam.title, exam.duration,
          exam.subject, exam.numberOfQuestions));
    }
    return list;
  }

  static void cachedQuestionsOnExamId(ExamQuestionsReponseModel response) {
    var box = Hive.box<QuestionsCachedModel>(AppConstant.kQuestionsHiveBox);
    box.addAll(_convertToQuestionsCachedModel(response));
  }

  static List<QuestionsCachedModel> _convertToQuestionsCachedModel(
      ExamQuestionsReponseModel response) {
    return response.questions?.map((item) {
          var answers = item.answers
              ?.map((answer) => AnswersCached(answer.answer, answer.key)).toList()??[];

          var exam = SubjectExamsCachedModel(
            item.exam?.Id,
            item.exam?.title,
            item.exam?.duration,
            item.exam?.subject,
            item.exam?.numberOfQuestions,
          );

          return QuestionsCachedModel(answers, item.type, item.Id, item.question, item.correct, exam);
        }).toList() ?? [];
  }
}
