import 'package:shipcret/common/widgets/custom_snack_bar.dart';

import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class FSharedInfo {
  final String name;
  final String path;

  const FSharedInfo({
    required this.name,
    required this.path,
  });
}

void cprint(dynamic data, {String? errorIn, String? event, String label = 'Log'}) {
  /// Print logs only in development mode
  if (kDebugMode) {
    if (errorIn != null) {
      print('****************************** error ******************************');
      developer.log('[Error]', time: DateTime.now(), error: data, name: errorIn);
      print('****************************** error ******************************');
    } else if (data != null) {
      developer.log(data, time: DateTime.now(), name: label);
    }
    if (event != null) {
      FUtility.logEvent(event, parameter: {});
    }
  }
}

class FUtility {
  static String getPostTime2(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    var dt = DateTime.parse(date).toLocal();
    var dat = '${DateFormat.jm().format(dt)} - ${DateFormat("dd MMM yy").format(dt)}';
    // DateFormat.jm().format(dt) + ' - ' + DateFormat("dd MMM yy").format(dt);

    return dat;
  }

  static String getDob(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    var dt = DateTime.parse(date).toLocal();
    var dat = DateFormat.yMMMd().format(dt);
    return dat;
  }

  static String getJoiningDate(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    var dt = DateTime.parse(date).toLocal();
    var dat = DateFormat("MMMM yyyy").format(dt);
    return 'Joined $dat';
  }

  static String getChatTime(String? date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    String msg = '';
    var dt = DateTime.parse(date).toLocal();

    if (DateTime.now().toLocal().isBefore(dt)) {
      return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
    }

    var dur = DateTime.now().toLocal().difference(dt);
    if (dur.inDays > 365) {
      msg = DateFormat.yMMMd().format(dt);
    } else if (dur.inDays > 30) {
      msg = DateFormat.yMMMd().format(dt);
    } else if (dur.inDays > 0) {
      msg = '${dur.inDays} d';
      return dur.inDays == 1 ? '1d' : DateFormat.MMMd().format(dt);
    } else if (dur.inHours > 0) {
      msg = '${dur.inHours} h';
    } else if (dur.inMinutes > 0) {
      msg = '${dur.inMinutes} m';
    } else if (dur.inSeconds > 0) {
      msg = '${dur.inSeconds} s';
    } else {
      msg = 'now';
    }
    return msg;
  }

  static String getPollTime(String date) {
    int hr, mm;
    String msg = 'Poll ended';
    var endDate = DateTime.parse(date);
    if (DateTime.now().isAfter(endDate)) {
      return msg;
    }
    msg = 'Poll ended in';
    var dur = endDate.difference(DateTime.now());
    hr = dur.inHours - dur.inDays * 24;
    mm = dur.inMinutes - (dur.inHours * 60);
    if (dur.inDays > 0) {
      msg = ' ${dur.inDays}${dur.inDays > 1 ? ' Days ' : ' Day'}';
    }
    if (hr > 0) {
      msg += ' $hr hour';
    }
    if (mm > 0) {
      msg += ' $mm min';
    }
    return '${dur.inDays} Days  $hr Hours $mm min';
  }

  static String? getSocialLinks(String? url) {
    if (url != null && url.isNotEmpty) {
      url = url.contains("https://www") || url.contains("http://www")
          ? url
          : url.contains("www") && (!url.contains('https') && !url.contains('http'))
              ? 'https://$url'
              : 'https://www.$url';
    } else {
      return null;
    }
    cprint('Launching URL : $url');
    return url;
  }

  static launchURL(String url) async {
    if (url == "") {
      return;
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchURL(url);
    } else {
      cprint('Could not launch $url');
    }
  }

  static void logEvent(String event, {Map<String, dynamic>? parameter}) {
    if (kDebugMode) {
      print("[EVENT]: $event");
    }

    // kReleaseMode
    // ? kAnalytics.logEvent(name: event, parameters: parameter)
    // : print("[EVENT]: $event");
  }

  static void debugLog(String log, {dynamic param = ""}) {
    final String time = DateFormat("mm:ss:mmm").format(DateTime.now());
    print("[$time][Log]: $log, $param");
  }

  static void share(String message, {String? subject}) {
    Share.share(message, subject: subject);
  }

  static List<String> getHashTags(String text) {
    RegExp reg = RegExp(r"([#])\w+|(https?|ftp|file|#)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*");
    Iterable<Match> matches = reg.allMatches(text);
    List<String> resultMatches = <String>[];
    for (Match match in matches) {
      if (match.group(0)!.isNotEmpty) {
        var tag = match.group(0);
        resultMatches.add(tag!);
      }
    }
    return resultMatches;
  }

  static String getUserName({
    required String id,
    required String name,
  }) {
    String userName = '';
    if (name.length > 15) {
      name = name.substring(0, 6);
    }
    name = name.split(' ')[0];
    id = id.substring(0, 4).toLowerCase();
    userName = '@$name$id';
    return userName;
  }

  static bool validateCredentials(BuildContext context, String? email, String? password) {
    if (email == null || email.isEmpty) {
      FCustomSnackBar.fixedSnackBar(context, 'Please enter email id');
      return false;
    } else if (password == null || password.isEmpty) {
      FCustomSnackBar.fixedSnackBar(context, 'Please enter password');
      return false;
    } else if (password.length < 8) {
      FCustomSnackBar.fixedSnackBar(context, 'Password must me 8 character long');
      return false;
    }

    var status = validateEmail(email);
    if (!status) {
      FCustomSnackBar.fixedSnackBar(context, 'Please enter valid email id');
      return false;
    }
    return true;
  }

  static bool validateEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    var status = regExp.hasMatch(email);
    return status;
  }

  // static Future<Uri> createLinkToShare(BuildContext context, String id,
  //     {required SocialMetaTagParameters socialMetaTagParameters}) async {
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: 'https://fwitter.page.link',
  //     link: Uri.parse('https://twitter.com/$id'),
  //     androidParameters: AndroidParameters(
  //       packageName: 'com.thealphamerc.flutter_twitter_clone_dev',
  //       minimumVersion: 0,
  //     ),
  //     socialMetaTagParameters: socialMetaTagParameters,
  //   );
  //   Uri url;
  //   final ShortDynamicLink shortLink = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
  //   url = shortLink.shortUrl;
  //   return url;
  // }

  // static createLinkAndShare(BuildContext context, String id,
  //     {required SocialMetaTagParameters socialMetaTagParameters}) async {
  //   var url = await createLinkToShare(context, id, socialMetaTagParameters: socialMetaTagParameters);

  //   share(url.toString(), subject: "Tweet");
  // }

  // static shareFile(List<String> path, {String text = ""}) {
  //   try {
  //     Share.shareXFiles()
  //     // Share.shareFiles(path, text: text);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  static void shareToXFile(List<FSharedInfo> sharedInfos, {String text = ""}) async {
    final files = <XFile>[];
    for (var i = 0; i < sharedInfos.length; i++) {
      files.add(XFile(sharedInfos[i].path, name: sharedInfos[i].name));
    }

    shareXFile(files, text: text);
  }

  static void shareXFile(List<XFile> files, {String text = ""}) async {
    try {
      await Share.shareXFiles(files, text: text);
    } catch (error) {
      // print(error);
    }
  }

  static void copyToClipBoard({
    required BuildContext context,
    required String text,
    required String message,
  }) {
    var data = ClipboardData(text: text);
    Clipboard.setData(data);
    FCustomSnackBar.fixedSnackBar(context, message);
  }

  static Locale getLocale(BuildContext context) {
    return Localizations.localeOf(context);
  }
}
