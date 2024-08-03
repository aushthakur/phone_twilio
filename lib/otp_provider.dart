import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OTPProvider with ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  void sendOTP() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/send-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phoneNumber': phoneController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('OTP Sent');
    } else {
      print('Failed to send OTP');
    }
  }

  void verifyOTP() async {
    final response = await http.post(
      Uri.parse('http://your_backend_ip:3000/verify-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phoneNumber': phoneController.text,
        'code': otpController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('OTP Verified');
    } else {
      print('Failed to verify OTP');
    }
  }
}
