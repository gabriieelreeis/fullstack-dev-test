import 'package:app/app/modules/coutries/controllers/cities_controller.dart';
import 'package:app/app/shared/services/loading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CitiesView extends GetView<CitiesController> {
  const CitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingService loadingService = Get.find<LoadingService>();

    final String? countryId = Get.arguments;
    controller.loadCities(countryId!);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Países'),
            Text(
              'Confira a lista de cidades disponíveis',
              style: TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
      ),
      body: Obx(() {
        final cities = controller.cities;

        if (cities.isEmpty && loadingService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];

            return ListTile(
              title: Text(city.name),
            );
          },
        );
      }),
    );
  }
}
