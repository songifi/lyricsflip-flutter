import 'package:flutter/material.dart';

class UsernameProvider with ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  String? _status;
  bool _isError = false;
  bool _isAvailable = false;

  String? get status => _status;
  bool get isError => _isError;
  bool get isAvailable => _isAvailable;

  void checkUsername(String value) {
    if (value == 'johnabrazi99') {
      _status = 'Username has been taken, please try another name';
      _isError = true;
      _isAvailable = false;
    } else if (value.isNotEmpty) {
      _status = 'Username is available';
      _isError = false;
      _isAvailable = true;
    } else {
      _status = null;
      _isError = false;
      _isAvailable = false;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
