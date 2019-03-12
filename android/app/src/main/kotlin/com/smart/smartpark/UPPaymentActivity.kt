package com.smart.smartpark

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import com.smart.smartpark.UPPaymentPlugin.Companion.EXTRA_ARG_IS_SUCCEED
import com.smart.smartpark.UPPaymentPlugin.Companion.EXTRA_ARG_MESSAGE
import com.smart.smartpark.UPPaymentPlugin.Companion.EXTRA_ARG_TN
import com.smart.smartpark.UPPaymentPlugin.Companion.PAY_STATUS_CANCEL
import com.smart.smartpark.UPPaymentPlugin.Companion.PAY_STATUS_RESULT_DATA
import com.smart.smartpark.UPPaymentPlugin.Companion.PAY_STATUS_SIGN
import com.smart.smartpark.UPPaymentPlugin.Companion.PAY_STATUS_SUCCESS
import com.smart.smartpark.UPPaymentPlugin.Companion.UPPAY_MODEL
import com.unionpay.UPPayAssistEx

/**
 * Create by bolo on 2019-03-10
 */
class UPPaymentActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_payment)

        startPay()
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        data ?: return

        val payResult = data.extras.getString(PAY_STATUS_SIGN)
        when (payResult) {
            PAY_STATUS_SUCCESS -> {
                if (data.hasExtra(PAY_STATUS_RESULT_DATA)) {
                    val sign = data.extras.getString(PAY_STATUS_RESULT_DATA)
                    setPayResult(sign, true)
                } else {
                    setPayResult("支付失败!")
                }
            }
            PAY_STATUS_CANCEL -> {
                setPayResult("你已取消了本次订单的支付！")
            }
            else -> {
                setPayResult("支付失败!")
            }
        }
    }

    override fun onBackPressed() {
        setPayResult("你已取消了本次订单的支付！")
    }

    private fun setPayResult(msg: String, isSucceed: Boolean = false) {
        setResult(Activity.RESULT_OK, Intent().apply {
            putExtra(EXTRA_ARG_IS_SUCCEED, isSucceed)
            putExtra(EXTRA_ARG_MESSAGE, msg)
        })
        finish()
    }

    private fun startPay() {
        intent.getStringExtra(EXTRA_ARG_TN)?.apply {
            UPPayAssistEx.startPay(this@UPPaymentActivity, null, null, this, UPPAY_MODEL)
        }
    }
}