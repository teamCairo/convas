package com.app.convas

fun fromTextToList(args:String?,itemName:String) : List<String> {

    val outputArrayList = arrayListOf<String>()

    if(args==null){
        return outputArrayList.toList();
    }

    var workText: String= args

    while (workText.indexOf("@ ")>-1) {
        outputArrayList.add(itemName+":"+workText.substring(0, workText.indexOf("@ ")));
        workText = workText.substring(workText.indexOf("@ ") + 2);
    }

    outputArrayList.add(itemName+":"+workText);

    return outputArrayList.toList()
}
