

String lastLoginInfo(bool onlineStatus,DateTime lastLoginTime){

  if(onlineStatus){
    return "Online";
  }
  int differentDays = DateTime.now()
      .difference(lastLoginTime)
      .inDays;
  if (differentDays == 0) {
    return "Today";
  } else if (differentDays == 1) {
    return  "Yesterday";
  } else if(differentDays<7){
    return  differentDays.toString() + " days ago";
  }else{
    return lastLoginTime.month.toString()+"/"+lastLoginTime.day.toString();
  }

}