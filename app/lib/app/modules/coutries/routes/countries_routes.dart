import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesRoutes extends StatelessWidget {
  const CountriesRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
      delegate: Get.nestedKey(null),
      builder: (context) {
        return GetRouterOutlet(
          anchorRoute: Routes.countries,
          initialRoute: AppPages.countriesList,
          filterPages: (afterAnchor) {
            return afterAnchor.take(1);
          },
        );
      },
    );
  }
}
