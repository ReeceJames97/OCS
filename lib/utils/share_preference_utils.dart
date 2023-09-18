class SharePreferenceUtils{

  bool getBool(bool? value){
    return value??false;
  }

  String getString(String? value){
    return value??"";
  }

  int getInt(int? value){
    return value??0;
  }
}