import 'package:challenge_pokedex/app/pokedex/presentation/widgets/custom_popup.dart';
import 'package:flutter/material.dart';

class HeaderPokedex extends StatefulWidget implements PreferredSizeWidget {
  const HeaderPokedex({super.key});

  @override
  State<HeaderPokedex> createState() => _HeaderPokedexState();

  @override
  Size get preferredSize => const Size.fromHeight(108);
}

class _HeaderPokedexState extends State<HeaderPokedex> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 108,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffDC0A2D),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/pokeball.png',
                  height: 24,
                  width: 24,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Pokédex',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurStyle: BlurStyle.inner,
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            blurStyle: BlurStyle.inner,
                            spreadRadius: 1.0,
                            blurRadius: 3.0,
                            offset: Offset(0, 1)),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xffDC0A2D),
                          size: 16,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(bottom: 18),
                        hintText: 'Search',
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: const Color(0xff666666),
                                ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const CustomPopup(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
