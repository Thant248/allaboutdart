import 'package:bloc/bloc.dart';
import 'package:bloc_api/data/model/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../data/contact_repository.dart';

part 'getcontact_state.dart';

@injectable
class GetContactCubit extends Cubit<GetContactState> {
  final ContactRepository _contactRepository;
  GetContactCubit(this._contactRepository) : super(GetContactInitial()) {
    getContact();
  }

  void getContact() {
    emit(GetContactInitial());
    _contactRepository
        .getContact()
        .then((value) => emit(GetContactSuccess(contacts: value)))
        .catchError((e) => emit(GetContactFail(error: 'Error')));
  }
}
