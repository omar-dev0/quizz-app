sealed class HomeActions{}

class GetSubjectsAction extends HomeActions{}
class ChangeHomeCurrentFragmentAction extends HomeActions{}
class NavigateToSubjectExamsAction extends HomeActions{
  int subjectIndex;
  NavigateToSubjectExamsAction(this.subjectIndex);
}