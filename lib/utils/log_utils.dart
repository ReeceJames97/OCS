import 'package:flutter/foundation.dart';

void logD(String? logMsg){
  if(kDebugMode) {
    print(logMsg.toString());
  }
}
