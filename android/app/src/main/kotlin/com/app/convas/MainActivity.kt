
package com.app.convas

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val algoliaAPIAdapter = AlgoliaAPIFlutterAdapter("GJZB18X3PO", "abba57df32485d814ce4da82406cc546")

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            algoliaAPIAdapter.perform(call, result)
        }
    }

    companion object {
        private const val CHANNEL = "app.com.convas/app"
    }
}
