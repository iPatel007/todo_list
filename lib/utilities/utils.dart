import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static isValidEmail(String email) {
    return RegExp(
        r"[_a-z0-9-]+(\.[_a-z0-9-]+)*(\+[a-z0-9-]+)?@[a-z0-9-]+(\.[a-z0-9-]+)*$")
        .hasMatch(email);
  }

  static loaderWidget({double size = 40, Color color = Colors.white}) {
    return Center(
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color)),
        ));
  }


  static openAlertDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: const Text(
              "TODO LIST",
              style: TextStyle(),
            ),
            content: Text(
              message,
              style: const TextStyle(),
            ),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: false,
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'ok');
                  }),
            ],
          ),
    );
  }

  static Future<String> openAlertDialogWithPop(String message,
      BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: const Text(
              "TODO LIST",
              style: TextStyle(),
            ),
            content: Text(
              message,
              style: const TextStyle(),
            ),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: false,
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'ok');
                  }),
            ],
          ),
    ).then((value) {
      return value;
    });
  }

  static String checkEmptyString(
      {required String? newValue, String defaultValue = '-'}) {
    return (newValue == null)
        ? defaultValue
        : newValue.isEmpty
        ? defaultValue
        : newValue;
  }

  static String add0beforeInt(String number) {
    if (int.parse(number.trim()) <= 9) {
      if (number.trim().startsWith('0')) {
        return number;
      } else {
        return "0${number.trim()}";
      }
    } else {
      return number;
    }
  }

  static Future<bool?> openAlertDialogTwoOpt(String message,
      BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
            title: const Text(
              "TODO LIST",
              style:
              TextStyle(fontWeight: FontWeight.w600),
            ),
            content: Text(
              message,
              style: const TextStyle(
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: false,
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
              CupertinoDialogAction(
                  isDefaultAction: false,
                  child: const Text(
                    "No",
                    style: TextStyle(
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    Navigator.pop(context, false);
                  }),
            ],
          ),
    ).then((result) {
      return result;
    });
  }

  static Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  static Future<String?> askForProfilePic(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) =>
          Theme(
            data: ThemeData.light(),
            child: CupertinoActionSheet(
              title: const Text("Choose Photo Option",
                  style: TextStyle(fontSize: 12,)),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: const Text("From Camera",
                      style: TextStyle(fontSize: 17,)),
                  onPressed: () {
                    Navigator.pop(context, 'camera');
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text("From Gallery",
                      style: TextStyle(fontSize: 17,)),
                  onPressed: () {
                    Navigator.pop(context, 'gallery');
                  },
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel",
                    style: TextStyle(fontSize: 17,)),
              ),
            ),
          ),
    ).then((value) {
      return Future.value(value);
    });
  }

  static Future<String?> askForPicFile(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) =>
          Theme(
            data: ThemeData.light(),
            child: CupertinoActionSheet(
              title: const Text("Choose Option",
                  style: TextStyle(fontSize: 12,)),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: const Text("Image",
                      style: TextStyle(fontSize: 17,)),
                  onPressed: () {
                    Navigator.pop(context, 'image');
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text("Video",
                      style: TextStyle(fontSize: 17,)),
                  onPressed: () {
                    Navigator.pop(context, 'video');
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text("File",
                      style: TextStyle(fontSize: 17,)),
                  onPressed: () {
                    Navigator.pop(context, 'file');
                  },
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel",
                    style: TextStyle(fontSize: 17,)),
              ),
            ),
          ),
    ).then((value) {
      return Future.value(value);
    });
  }

  static SizedBox verticalSpace(double size) {
    return SizedBox(height: size);
  }

  static SizedBox horizontalSpace(double size) {
    return SizedBox(width: size);
  }

  // static Future<Io.File?> getImageFromNetwork(String url) async {
  //   var cacheManager = DefaultCacheManager();
  //   Io.File? file = await cacheManager.getSingleFile(url);
  //   debugPrint("getImageFromNetwork -> ${file.path}");
  //   return file;
  // }

  // static String getChatID(
  //     {@required String peerID, @required String myUserID}) {
  //   if (myUserID == peerID) {
  //     return null;
  //   }
  //
  //   print("peerID $peerID");
  //   print("_myUserID $myUserID");
  //
  //   String _groupChatId;
  //   if (myUserID.hashCode <= peerID.hashCode) {
  //     _groupChatId = '$myUserID-$peerID';
  //   } else {
  //     _groupChatId = '$peerID-$myUserID';
  //   }
  //   print("groupChatId $_groupChatId");
  //
  //   return _groupChatId;
  // }

  static Color? getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    } else {
      return null;
    }
  }

  static Widget somethingWentWrongMSG({double padding = 20}) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: const Text("Something went wrong, Please try gain!",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white70),
            textAlign: TextAlign.center),
      ),
    );
  }

  static Widget noDataMsgFor({String msg = "No Data Found",
    double padding = 20,
    double fontSize = 25}) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Text(msg,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w800,

            ),
            textAlign: TextAlign.center),
      ),
    );
  }
}