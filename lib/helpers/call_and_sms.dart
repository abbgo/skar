import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri telUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (await canLaunchUrl(telUri)) {
    await launchUrl(telUri);
  } else {
    throw 'Could not make a call to $phoneNumber';
  }
}

Future<void> sendSMS(String phoneNumber, String message) async {
  final Uri smsUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
    queryParameters: {
      'body': message, // Mesaj içeriği
    },
  );

  if (await canLaunchUrl(smsUri)) {
    await launchUrl(smsUri);
  } else {
    throw 'Could not send SMS to $phoneNumber';
  }
}
