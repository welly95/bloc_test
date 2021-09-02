import 'package:bloc/bloc.dart';
import 'package:bloc_test/models/character.dart';
import 'package:bloc_test/repository/characters/characters_repository.dart';
import 'package:equatable/equatable.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
