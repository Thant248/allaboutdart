import 'package:bloc_api/data/contact_repository.dart';
import 'package:bloc_api/data/model/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:io';

import 'package:injectable/injectable.dart';

part 'postcontact_state.dart';

@injectable
class PostcontactCubit extends Cubit<PostContactState> {
  final ContactRepository _contactRepository;
  PostcontactCubit(this._contactRepository) : super(PostContactInitial());

  void contact(Contact contact) {
    emit(PostContactLoading());

    _contactRepository
        .addContact(contact)
        .then((value) => emit(PostContactSuccess()))
        .catchError((e) => emit(PostContactFails('Error')))
        ;
  }

  void addContact(Contact contact) {}
}
