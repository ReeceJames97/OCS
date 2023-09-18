import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isNetworkAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

Future<bool> isNetworkConnected() async {
  return true;

  // if(kIsWeb){
  //   return true;
  // }else {
  //   try {
  //     var connectivityResult = await (Connectivity().checkConnectivity());
  //     logD('connectivityResult = $connectivityResult');
  //     if (connectivityResult == ConnectivityResult.mobile  || connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.ethernet || connectivityResult == ConnectivityResult.none) {
  //       try {
  //         final result = await InternetAddress.lookup('www.google.com');
  //         if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //           logD('connected = ${result[0].rawAddress}');
  //           return true;
  //         } else {
  //           logD('not connected = resultNull');
  //           return false;
  //         }
  //       } on SocketException catch (e) {
  //         logD('not connected = ${e.message}');
  //         return false;
  //       }
  //     }  else {
  //       logD('No Connection connected = ');
  //       return false;
  //     }
  //   } catch (e) {
  //     logD('ERROR connected = $e');
  //     return false;
  //   }
  // }
}
