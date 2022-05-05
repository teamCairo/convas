List<GoalData> goalListData(String categoryName) {
  List<GoalData> returnList = [];
  if(categoryName=="travel"){
    returnList.add(GoalData("travel","Trip communication","Communicate with locals on the trip",true,true,false));
    
  }else if(categoryName=="exam"){
    returnList.add(GoalData("exam","IELTS","Score the points on IELTS",true,false,true));
    returnList.add(GoalData("exam","TOEFL","Score the points on TOEFL",true,false,true));
    returnList.add(GoalData("exam","TOEIC L&R","Score the points on TOEIC Listening & Reading",true,false,true));
    returnList.add(GoalData("exam","TOEIC S&W","Score the points on TOEIC Speaking & Writing",true,false,true));
    
  }else if(categoryName=="work"){
    returnList.add(GoalData("work","International projects","Be assigned to international projects",true,false,false));
    returnList.add(GoalData("work","International collaboration","Collaborate with foreign members",true,false,false));
    returnList.add(GoalData("work","Business trips","Take business trips overseas",true,true,false));
    returnList.add(GoalData("work","Work overseas","Get job overseas",true,true,false));
    
  }else{
    returnList.add(GoalData("friends","International meetup","Join international meetup and make friends",true,false,false));
    returnList.add(GoalData("friends","Through this App","Make friends on this App",true,false,false));
    
  }

  return returnList;
}

class GoalData {
  GoalData(
    this.category,
    this.title,
    this.text,
    this.due,
    this.destination,
    this.point,
  );

  late String category;
  late String title;
  late String text;
  late bool due;
  late bool destination;
  late bool point;
}
