import 'package:flutter/material.dart';
import 'package:test_task_energise_pro/common/enums/supported_locales.dart';

class AppBarChangeLanguage extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarChangeLanguage(
      {super.key, this.callBack, this.currentLocaleInApp});

  final Function(SupportedLocales)? callBack;

  final SupportedLocales? currentLocaleInApp;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: _titleWidget(),
    );
  }

  Row _titleWidget() {
    return Row(
      children: [
        const Text('Change language:'),
        ...SupportedLocales.values.map(
          (e) => _buttonWidget(e),
        ),
      ],
    );
  }

  Widget _buttonWidget(SupportedLocales local) {
    return GestureDetector(
      onTap: () => callBack?.call(local),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: currentLocaleInApp == local
              ? Colors.deepOrange
              : Colors.blueAccent,
        ),
        child: Text(local.value),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
