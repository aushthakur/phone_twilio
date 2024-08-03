import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'otp_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OTPProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OTPScreen(),
    );
  }
}

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth OTP'),
      ),
      body: OTPForm(),
    );
  }
}

class OTPForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OTPProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: provider.phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => provider.sendOTP(),
            child: Text('Send OTP'),
          ),
          TextField(
            controller: provider.otpController,
            decoration: InputDecoration(labelText: 'OTP'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => provider.verifyOTP(),
            child: Text('Verify OTP'),
          ),
        ],
      ),
    );
  }
}
