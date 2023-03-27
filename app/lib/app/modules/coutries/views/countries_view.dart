import 'package:app/app/modules/coutries/controllers/countries_controller.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:app/app/shared/services/loading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CountriesView extends GetView<CountriesController> {
  const CountriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingService loadingService = Get.find<LoadingService>();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Países'),
            Text(
              'Confira a lista de paises disponíveis',
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
      body: Obx(() {
        final countries = controller.countries;

        if (countries.isEmpty && loadingService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];

            return ListTile(
              title: Text(country.name),
              trailing: const Icon(Icons.arrow_right_outlined),
              onTap: () => _goToCities(country.id),
            );
          },
        );
      }),
    );
  }

  void _goToCities(String countryId) {
    Get.toNamed(AppPages.cities, arguments: countryId);
  }
}
