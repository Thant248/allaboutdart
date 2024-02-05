import 'package:bloc_api/bloc/post/postcontact_cubit.dart';
import 'package:bloc_api/data/model/contact.dart';
import 'package:bloc_api/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostcontactCubit>(
      create: (context) => PostcontactCubit(getit.call()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Contact'),
        ),
        body: BlocBuilder<PostcontactCubit, PostContactState>(
          builder: (context, state) {
            if (state is PostContactLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostContactSuccess) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Success'),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'success');
                        },
                        child: Text('Go Home'))
                  ],
                ),
              );
            } else if (state is PostContactFails) {
              return Center(child: Text(state.error));
            }

            return ContactForm();
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _age, _job;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Name';
              }
              return null;
            },
            onSaved: (value) {
              this._name = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Age'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Age';
              }
              return null;
            },
            onSaved: (value) {
              this._age = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Job'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Job';
              }
              return null;
            },
            onSaved: (value) {
              this._job = value;
            },
          ),
          SizedBox(height: 10),
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Contact contact = Contact(_name, _job, _age);
                  context.read<PostcontactCubit>().addContact(contact);
                }
              },
              child: Text('Add Contact'))
        ],
      ),
    );
  }
}
