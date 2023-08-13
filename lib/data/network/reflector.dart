import 'package:reflectable/reflectable.dart';

import '../../main.reflectable.dart';

class ApiModel extends Reflectable {
  const ApiModel() : super(invokingCapability);
}

class ApiModelReflector {
  static ApiModel? _singleton;

  static ApiModel reflector() {
    if (_singleton == null) {
      initializeReflectable();
      _singleton = const ApiModel();
    }
    return _singleton!;
  }

  ApiModelReflector._();
}
