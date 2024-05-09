import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test_task_energise_pro/common/extensions/s_extension.dart';
import 'package:test_task_energise_pro/common/extensions/s_keys.dart';
import 'package:url_launcher/url_launcher.dart';

class FunctionalModule extends StatelessWidget {
  const FunctionalModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade50,
      child: Center(
        child: Column(
          children: [
            _buttonWidget(
              label: context.s(rateApp),
              onTap: () => _rate(context),
            ),
            _buttonWidget(
              label: context.s(shareApp),
              onTap: () => _share(context),
            ),
            _buttonWidget(
              label: context.s(contactUs),
              onTap: () => _openLink(context),
            ),
          ],
        ),
      ),
    );
  }

  void _msgToast(BuildContext context, String msg,
      {Color? color, int? milliseconds}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color ?? Colors.red,
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: milliseconds ?? 2500),
      ),
    );
  }

  Future<void> _rate(BuildContext context) async {
    try{
      if(!Platform.isIOS){
        _msgToast(context, 'Only ios supported now');
        return;
      }
      final InAppReview inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      } else {
        _msgToast(context, 'Error rate');
      }
    } catch (e){
      _msgToast(context, 'Error rate $e');
    }
  }

  Future<void> _openLink(BuildContext context) async {
    final Uri url = Uri.parse(
      'https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7',
    );
    if (!await launchUrl(url)) {
      _msgToast(context, 'Could not launch $url');
    }
  }

  Future<void> _share(BuildContext context) async {
    try {
      Share.share(
          'check out  https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7');
    } catch (e) {
      _msgToast(context, 'Error share $e');
    }
  }

  Widget _buttonWidget({
    required String label,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(label),
      ),
    );
  }
}
