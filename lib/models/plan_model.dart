class PlanModel {
  final String id;
  final String name;
  final DateTime dateTime;
  bool isDone = false;

  PlanModel({
    required this.id,
    required this.name,
    required this.dateTime,
  });

void toggleDone(){
  isDone = !isDone;
}

}

class Plans{
  List<PlanModel> _list = [
    PlanModel(id: '1', name: 'nsdjk', dateTime: DateTime.now()),
  ];
   List<PlanModel> get lists{
        return _list;
   }

List<PlanModel> toDoByDay(DateTime date){
  return _list.where((todo) => todo.dateTime.day == date.day && todo.dateTime.month == date.month && todo.dateTime.year == date.year).toList();
}
    void addToDo(String planName,DateTime day){
      _list.insert(0, PlanModel(id: 'r${_list.length + 1}', name: planName, dateTime: day));
    }

    void remove(String id){
      _list.removeWhere((element) => element.id==id);
    }
}