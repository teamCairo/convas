class CommonClassRequest{

  CommonClassRequest(
      this.requestDocId,
      this.senderUserDocId,
      this.receiverUserDocId,
      this.courseCodeListText,
      this.categoryCodeListText,
      this.from,
      this.to,
      this.status,
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

  late String requestDocId;
  late String senderUserDocId;
  late String receiverUserDocId;
  late String courseCodeListText;
  late String categoryCodeListText;
  late DateTime from;
  late DateTime to;
  late String status;
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