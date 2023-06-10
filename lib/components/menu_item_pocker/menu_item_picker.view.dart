import 'package:domain/models/dropdown_item.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/menu_item_pocker/mene_item_picker.viewmodel.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class MenuItemPicker extends StatelessWidget {
  List<DropdownItem> bindingData;
  MenuItemPicker({super.key, required this.bindingData});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MenuItemPickerViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(bindingData),
      builder: (context, viewModel, child) => DropdownButton(
        dropdownColor: ThemeStyles.secondaryColor,
        alignment: Alignment.center,
        icon: const Icon(
          Icons.arrow_downward,
          color: ThemeStyles.fontPrimary,
        ),
        underline: Container(),
        style: ThemeStyles.regularParagraph,
        items: viewModel.items
            .map(
              (e) => DropdownMenuItem(
                value: e.id,
                child: Text(e.name),
              ),
            )
            .toList(),
        menuMaxHeight: 300,
        value: viewModel.itemSelected!.id,
        onChanged: viewModel.onProjectSelected,
      ),
    );
  }
}
