import 'package:country_api/api/model/country_model.dart';
import 'package:country_api/bloc/country_list_bloc_cubit.dart';
import 'package:country_api/bloc/search/search_country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<CountryListBlocCubit>(context).getCountryList();
  }

  @override
  Widget build(BuildContext context) {
    SearchCountryBloc searchCountryBloc =
        BlocProvider.of<SearchCountryBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Country List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAnchor(
                isFullScreen: false,
                builder: (context, controller) {
                  controller.addListener(() {
                    if (controller.text.isNotEmpty) {
                      searchCountryBloc.add(SearchCountry(controller.text));
                    }
                  });
                  return SearchBar(
                    onTap: () {
                      controller.openView();
                    },
                    hintText: 'Search',
                  );
                },
                suggestionsBuilder: (context, controller) {
                  return [
                    BlocBuilder<SearchCountryBloc, SearchCountryState>(
                      builder: (context, state) {
                        if (state is SearchCountrySuccess) {
                          List<CountryModel> countryList = state.countryList;
                          return SizedBox(
                              height: 500,
                              child: ListView.builder(
                                  itemCount: countryList.length,
                                  itemBuilder: (context, position) {
                                    CountryModel countryModel =
                                        countryList[position];
                                    return Card(
                                      child: ListTile(
                                        leading: Image.network(
                                            width: 80,
                                            countryModel.flags?.png ?? ''),
                                        title: Text(countryModel.name ?? ''),
                                      ),
                                    );
                                  }));
                        } else if (state is SearchCountryLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return const Center(
                          child: Text('Empty'),
                        );
                      },
                    )
                  ];
                }),
          ),
          Expanded(
            child: BlocBuilder<CountryListBlocCubit, CountryListBlocState>(
              builder: (context, state) {
                if (state is CountryListBlocSuccess) {
                  List<CountryModel> countryList = state.countryList;
                  return ListView.builder(
                      itemCount: countryList.length,
                      itemBuilder: (context, position) {
                        CountryModel countryModel = countryList[position];
                        return Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    '${countryModel.flags?.png}',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text(
                                        '${countryModel.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      Text(
                                          'Capital city : ${countryModel.capital}'),
                                      Text('Region : ${countryModel.region}'),
                                      Text(
                                          'SubRegion : ${countryModel.subregion}')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else if (state is CountryListBlocFailed) {
                  return Center(
                    child: Text('Something wrong ${state.error}'),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
