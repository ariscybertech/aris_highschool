import 'package:highschool/util/base/index.dart';
import 'dart:io' show Platform;

// const BASE_URL = "http://localhost:8080/";

String get BASE_URL {
  if (Platform.isAndroid) {
    return "http://10.0.2.2:8080/";
  } else {
    return "http://localhost:8080/";
  }
}

class ResponseStatus<int> extends Enum<int> {
  const ResponseStatus(int value) : super(value);

  static const ResponseStatus StatusOK = const ResponseStatus(200);
  static const ResponseStatus StatusNotFound = const ResponseStatus(4041);
}
