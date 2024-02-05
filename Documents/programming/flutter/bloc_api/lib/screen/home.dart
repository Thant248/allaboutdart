import 'package:bloc_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_api/screen/addScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../data/model/contact.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetContactCubit>(context).getContact();
    return Scaffold(
        appBar: AppBar(title: Text('Contact List')),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          var result = Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddScreen()));
          if (result != null && result == 'success') {
            BlocProvider.of<GetContactCubit>(context).getContact();
          }
        }),
        body: BlocBuilder<GetContactCubit, GetContactState>(
          builder: (context, state) {
            if (state is GetContactSuccess) {
              List<Contact> contacts = state.contacts;
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return _item(contacts[index]);
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _item(Contact contact) {
    return Card(
      child: Slidable(
        child: ListTile(
            title: Text(contact.name!),
            subtitle: Text(contact.job!),
            trailing: Text("age ${contact.age}")),
      ),
    );
  }
}
