part of 'postcontact_cubit.dart';



abstract class PostContactState extends Equatable{

  const PostContactState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostContactInitial extends PostContactState{}
class PostContactLoading extends PostContactState{}
class PostContactSuccess extends PostContactState{}
class PostContactFails extends PostContactState{
  final String error;

  PostContactFails(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];

}

