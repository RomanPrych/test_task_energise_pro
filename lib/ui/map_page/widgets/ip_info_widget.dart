import 'package:flutter/material.dart';
import 'package:test_task_energise_pro/common/extensions/s_extension.dart';
import 'package:test_task_energise_pro/common/extensions/s_keys.dart';
import 'package:test_task_energise_pro/data/models/ip_response.dart';

class IpInfoWidget extends StatelessWidget {
  const IpInfoWidget({super.key, this.model, this.isLoading});

  final IpResponseModel? model;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [//context.s()
        _item(context.s(country), model?.country),
        _item(context.s(countryCode), model?.countryCode),
        _item(context.s(region), model?.region),
        _item(context.s(regionName), model?.regionName),
        _item(context.s(city), model?.city),
        _item(context.s(zip), model?.zip),
        _item(context.s(timezone), model?.timezone),
        _item(context.s(organization), model?.org),
        _item(context.s(organizationFullName), model?.isp),
        _item(context.s(organizationName), model?.ipResponseModelAs),
        _item('IP', model?.query),
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
