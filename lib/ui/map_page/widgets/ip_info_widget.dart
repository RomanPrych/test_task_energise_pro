import 'package:flutter/material.dart';
import 'package:test_task_energise_pro/data/models/ip_response.dart';

class IpInfoWidget extends StatelessWidget {
  const IpInfoWidget({super.key, this.model, this.isLoading});

  final IpResponseModel? model;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _item('country', model?.country),
        _item('countryCode', model?.countryCode),
        _item('region', model?.region),
        _item('regionName', model?.regionName),
        _item('city', model?.city),
        _item('zip', model?.zip),
        _item('timezone', model?.timezone),
        _item('organization', model?.org),
        _item('organization full name', model?.isp),
        _item('organization name', model?.ipResponseModelAs),
        _item('ip', model?.query),
      ],
    );
  }

  Widget _item(String? title, String? desk) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '$title:',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.centerLeft,
              child: isLoading == true
                  ? const SizedBox(
                      height: 14,
                      width: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    )
                  : Text(desk == null || desk.isEmpty ? '-' : desk),
            ),
          ),
        ],
      ),
    );
  }
}
