import 'package:challenge_pokedex/app/pokedex/presentation/bloc/pokedex_list_bloc.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPopup extends StatefulWidget {
  const CustomPopup({super.key});

  @override
  State<CustomPopup> createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  String _filter = 'number';
  CustomPopupMenuController popupMenuController = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenu(
      controller: popupMenuController,
      pressType: PressType.singleClick,
      showArrow: false,
      menuBuilder: () => Container(
        height: 132,
        width: 113,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffDC0A2D),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 24,
                bottom: 10,
              ),
              child: Text(
                'Sort by:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            Container(
              width: 105,
              height: 80,
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                    child: Row(
                      children: [
                        Radio(
                          value: 'number',
                          groupValue: _filter,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffDC0A2D),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _filter = 'number';
                              context
                                  .read<PokedexListBloc>()
                                  .add(PokedexSort(filter: 'number'));
                              popupMenuController.hideMenu();
                            });
                          },
                        ),
                        Text(
                          'Number',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xff1D1D1D),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 16,
                    child: Row(
                      children: [
                        Radio(
                          value: 'name',
                          groupValue: _filter,
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xffDC0A2D),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _filter = 'name';
                              context
                                  .read<PokedexListBloc>()
                                  .add(PokedexSort(filter: 'name'));
                              popupMenuController.hideMenu();
                            });
                          },
                        ),
                        Text(
                          'Name',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xff1D1D1D),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      child: const CircleAvatar(
        radius: 16,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.tag,
          size: 16,
          color: Color(0xffDC0A2D),
        ),
      ),
    );
  }
}
