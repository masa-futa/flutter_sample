package jp.co.masaki.flutte_sample_app

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.logging.Logger

class MainActivity: FlutterActivity() {
    companion object {
        private const val CHANNEL = "package.name/masaki"
        private const val METHOD_TEST = "test"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                    if (call.method == METHOD_TEST) {
                        val parameters = call.arguments<String>()
                            launchAndroidScreen(parameters)
                    }
        }
    }

    private fun launchAndroidScreen(parameters: String) {
        Log.d("flutter", parameters)
    }
}
