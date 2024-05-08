import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
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
                label: 'Rate App',
                onTap: () async {
                  final InAppReview _inAppReview = InAppReview.instance;
                  if (await _inAppReview.isAvailable()) {
                    await _inAppReview.requestReview();
                  } else {
                    print('FACCCCCC');
                  }
                }),
            _buttonWidget(
                label: 'Share App',
                onTap: () {
                  Share.share(
                      'check out  https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7');
                }),
            _buttonWidget(
                label: 'Contact us',
                onTap: () async {
                  final Uri url = Uri.parse(
                    'https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7',
                  );
                  if (!await launchUrl(url)) {
                    print('Could not launch $url');
                  }
                }),
          ],
        ),
      ),
    );
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
