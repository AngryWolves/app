import 'package:flutter/services.dart';

class InputManageUtil {

    /// hack method
    /// 关闭软键盘
    ///
    static void shutdownInputKeyboard() {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
}