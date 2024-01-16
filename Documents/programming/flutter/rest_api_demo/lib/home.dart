import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_demo/api/apiService.dart';
import 'package:dio/dio.dart';
import 'package:rest_api_demo/model/countries.dart';

class Home extends StatelessWidget {
  ApiService apiService = ApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries List"),
      ),
      body: FutureBuilder<List<Country>>(
          future: apiService.getCountries(),
          builder: (context, snapshop) {
            if (snapshop.hasData) {
              List<Country>? country = snapshop.data;
              

              return ListView.builder(
                  itemCount: country?.length,
                  itemBuilder: (context, position) {
                    return item(country![position]);
                  });
            } else if (snapshop.hasError) {
              return const Center(
                child: Text(
                  'Hi Error Occur',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget item(Country country) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: "https://flagsapi.com/${country.languages}/:style/:size.png",
        width: 100,
        height: 100,
      ),
      title: Text(country.name),
      subtitle: Text(country.capital),
    );
  }
}
