import 'package:bloc_api/data/model/contact.dart';

import 'api/apiservice.dart';

class ContactRepository {
  final ApiService _apiService;

  ContactRepository(this._apiService);

  Future<List<Contact>> getContact() => _apiService.getContact();

  Future<Contact> addContact(Contact contact) =>
      _apiService.addContact(contact);

  Future<Contact> updateContact(int id, Contact contact) =>
      _apiService.updateContact(id, contact);
      
  Future<Contact> deleteContact(int id) => _apiService.deleteContact(id);
}
