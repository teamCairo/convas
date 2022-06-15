
class CommonClassAppointment{

  CommonClassAppointment(
      this.appointmentDocId,
      this.senderUserDocId,
      this.receiverUserDocId,
      this.courseCode,
      this.categoryCode,
      this.fromTime,
      this.toTime,
      this.requestMessage,
      this.message,
      this.status,
      this.senderJoinedStatus,
      this.receiverJoinedStatus,
      this.requestDocId,
      this.startTime,
      this.doneTime,
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
  late String requestMessage;
  late String message;
  late String status;
  late String senderJoinedStatus;
  late String receiverJoinedStatus;
  late String requestDocId;
  late DateTime startTime;
  late DateTime doneTime;
  late String insertUserDocId;
  late String insertProgramId;
  late DateTime insertTime;
  late String updateUserDocId;
  late String updateProgramId;
  late DateTime updateTime;
  late bool readableFlg;
  late bool deleteFlg;
}