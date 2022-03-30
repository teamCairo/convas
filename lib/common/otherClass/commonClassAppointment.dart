
class commonAppointment{

  commonAppointment(
      this.appointmentDocId,
      this.senderUserDocId,
      this.receiverUserDocId,
      this.courseCode,
      this.categoryCode,
      this.fromTime,
      this.toTime,
      this.message,
      this.insertUserDocId,
      this.insertProgramId,
      this.insertTime,
      this.updateUserDocId,
      this.updateProgramId,
      this.updateTime,
      this.readableFlg,
      this.deleteFlg,
      );

  late String appointmentDocId;
  late String senderUserDocId;
  late String receiverUserDocId;
  late String courseCode;
  late String categoryCode;
  late DateTime fromTime;
  late DateTime toTime;
  late String message;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;
}