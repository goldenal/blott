import 'dart:io';

import 'package:blott_app/features/feeds/domain/data_model.dart';
import 'package:blott_app/features/feeds/network/apis.dart';
import 'package:blott_app/util/errorPage.dart';
import 'package:blott_app/util/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final feedsProvider = ChangeNotifierProvider((ref) => FeedsProvider());

class FeedsProvider extends ChangeNotifier {
  bool isloading = true;
  List<FeedsData> data = [];

  String? retrieveName() {
    return Storage.prefs.getString("name");
  }

  fetchData(BuildContext context) async {
    try {
      isloading = true;
      notifyListeners();
      data = await fetchNews();
      isloading = false;
      notifyListeners();
    } on DioException catch (e) {
      isloading = false;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Errorpage(
                    txt: handleError(e),
                  )));
    }
  }

  convertTime(int time) {
    // Convert time since epoch to DateTime object
    final dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    // Format the DateTime object as "12 June 2021"
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  String handleError(message) {
    if (message.error is SocketException ||
        (message.type == DioErrorType.connectionTimeout)) {
      return "Bad Network";
    } else {
      return "";
    }
  }
}
