import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokedex_list_bloc.dart';
import 'package:challenge_pokedex/app/pokedex/presentation/pages/pokedex_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(
            fontSize: 14,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            fontSize: 10,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) =>
              GetIt.instance.get<PokedexListBloc>()..add(PokedexGetAll()),
          child: const PokedexListPage()),
    );
  }
}
