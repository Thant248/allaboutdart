
class Address {
  String? city;
  String? state;
 
  Address({
    this.city,
    this.state
  });
 
  static fromJson(Map<String, dynamic> parsedJson){
    return Address(
      city: parsedJson["city"],
      state: parsedJson["state"]
    );
  }
}