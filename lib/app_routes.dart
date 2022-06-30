import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/business_logic/characters_cubit.dart';
import 'package:untitled/data/repository/characters_repository.dart';
import 'package:untitled/data/web_services/characters_web_services.dart';
import 'package:untitled/presentation/screens/characters_details.dart';
import 'package:untitled/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'data/models/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
   late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character:character));
    }
  }
}
