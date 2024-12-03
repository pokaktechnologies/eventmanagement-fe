import 'dart:async';


class OtpBloc {
  final _otpController = StreamController<String>.broadcast();
  final _currentOtp = List<String>.filled(4, '');

  Stream<String> get otpStream => _otpController.stream;

  void updateOtp(int index, String value) {
    if (value.length == 1) {

      _currentOtp[index] = value;
      _otpController.sink.add(_currentOtp.join());
    } else if (value.isEmpty && index > 0) {
      _currentOtp[index] = '';
      
      _otpController.sink.add(_currentOtp.join());
    }
  }

  void dispose() {
    _otpController.close();
  }
}
