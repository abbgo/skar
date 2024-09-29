import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skar/helpers/call_and_sms.dart';
import 'package:skar/helpers/functions.dart';
import 'package:skar/styles/colors.dart';

class CallBottomSheet extends ConsumerWidget {
  const CallBottomSheet({super.key, required this.shopPhones});

  final List<dynamic> shopPhones;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLightBrightness = isLightTheme(context, ref);

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isLightBrightness ? Colors.white : dialogColorDarkTheme,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Wrap(
        children: shopPhones
            .map(
              (e) => ListTile(
                title: Text(
                  e.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: e.toString()));
                      },
                      icon: Icon(
                        Icons.copy_all,
                        color: isLightBrightness
                            ? elevatedButtonColor
                            : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () => sendSMS(e.toString(), ''),
                      icon: const Icon(Icons.comment, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: () => makePhoneCall(e.toString()),
                      icon: const Icon(Icons.call, color: Colors.green),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
