part of 'character_cubit.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharactersLoaded extends CharacterState {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}
