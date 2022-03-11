package com.app.convas

import java.util.ArrayList

fun fromTextToList(args:String) : ArrayList<String> {

    val outputArrayList = arrayListOf<String>()
    var workText: String= args

    while (workText.indexOf(", ")>-1) {
        outputArrayList.add(workText.substring(0, workText.indexOf(", ")));
        workText = workText.substring(workText.indexOf(", ") + 2);
    }

    outputArrayList.add(workText);

    return outputArrayList
}

