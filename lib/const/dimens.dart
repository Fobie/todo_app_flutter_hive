import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:todoapp/const/strings.dart';
import 'package:todoapp/main.dart';


/// Widget const
/// Empty Title & Subtite TextFields Warning
dynamic emptyFieldsWarning(context) {
  return FToast.toast(
    context,
    msg: kErrorText,
    subMsg: "You must fill all Fields!",
    corner: 20.0,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

/// Nothing Enter When user try to edit the current tesk
dynamic nothingEnterOnUpdateTaskMode(context) {
  return FToast.toast(
    context,
    msg: kErrorText,
    subMsg: "You must edit the tasks then try to update it!",
    corner: 20.0,
    duration: 3000,
    padding: const EdgeInsets.all(20),
  );
}

/// No task Warning Dialog
dynamic warningNoTask(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: kErrorText,
    message:
    "There is no Task For Delete!\n Try adding some and then try to delete it!",
    buttonText: "Okay",
    onTapDismiss: () {
      Get.back();
    },
    panaraDialogType: PanaraDialogType.warning,
  );
}

/// Delete All Task Dialog
dynamic deleteAllTask(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    title: kConfirmText,
    message:
    "Do You really want to delete all tasks? You will no be able to undo this action!",
    confirmButtonText: "Yes",
    cancelButtonText: "No",
    onTapCancel: () {
      Get.back();
    },
    onTapConfirm: () {
      BaseWidget.of(context).dataStore.box.clear();
      Get.back();
    },
    panaraDialogType: PanaraDialogType.error,
    barrierDismissible: false,
  );
}