package com.smart.smartpark

import android.app.Activity
import android.content.Intent
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * Create by bolo on 2019-03-10
 */
class UPPaymentPlugin(private val activity: FlutterActivity) : MethodChannel.MethodCallHandler,
        PluginRegistry
        .ActivityResultListener {

    companion object {

        const val TAG = "UPPaymentPlugin"

        const val EXTRA_ARG_TN = "tn"
        const val EXTRA_ARG_IS_SUCCEED = "is_succeed"
        const val EXTRA_ARG_MESSAGE = "message"

        /**
         * 00 正式环境
         * 01 测试环境
         */
        const val UPPAY_MODEL = "01"
//        const val UPPAY_MODEL = "00"

        const val PAY_STATUS_SUCCESS = "success"
        const val PAY_STATUS_FAIL = "fail"
        const val PAY_STATUS_CANCEL = "cancel"
        const val PAY_STATUS_SIGN = "pay_result"
        const val PAY_STATUS_RESULT_DATA = "result_data"


        private const val CHANNEL_NAME = "SmarkPark/unionpay"

        private const val REQUEST_CODE_START_PAY = 1122


        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), CHANNEL_NAME)
            UPPaymentPlugin(registrar.activity() as FlutterActivity).apply {
                registrar.addActivityResultListener(this)
                channel.setMethodCallHandler(this)
            }
        }
    }

    private var mPendingResult: MethodChannel.Result? = null

    override fun onMethodCall(call: MethodCall?, result: MethodChannel.Result?) {
        call ?: return

        mPendingResult = result
        val tn = ((call.arguments) as String?) ?: ""
        when (call.method) {
            "pay" -> {
                activity.startActivityForResult(
                        Intent(activity, UPPaymentActivity::class.java).apply {
                            putExtra(EXTRA_ARG_TN, tn)
                        },
                        REQUEST_CODE_START_PAY)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        Log.i(TAG, "onActivityResult")
        return requestCode.takeIf {
            it == REQUEST_CODE_START_PAY
        }?.let {
            resultCode.takeIf { code ->
                code == Activity.RESULT_OK
            }?.let {
                // 支付信息
                val message = data?.getStringExtra(EXTRA_ARG_MESSAGE) ?: ""

                Log.i(TAG, "pay result message :=== $message")

                data?.getBooleanExtra(EXTRA_ARG_IS_SUCCEED, false)?.takeIf { isSucceed ->
                    isSucceed
                }?.apply {
                    // 支付成功
                    mPendingResult?.success(message)
                } ?: mPendingResult?.success(message)

            } ?: mPendingResult?.success(null)
            true
        } ?: false
    }
}