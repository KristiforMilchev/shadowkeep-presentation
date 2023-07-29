import 'package:domain/models/page_size.dart';
import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ipage_size_service.dart';
import 'package:stacked/stacked.dart';

class PageSizeDropdownViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late IPageSizeService _sizeService;
  List<PageSize> _sizes = [];

  List<({Widget content, String key})> _pageSizes = [];
  List<({Widget content, String key})> get pages => _pageSizes;

  String _selectedPageSize = "A4 Landscape (297x210)";
  get pageSize => _selectedPageSize;

  ready(BuildContext context) async {
    _sizeService = getIt.get<IPageSizeService>();

    _sizes = _sizeService.getSizes();

    for (var element in _sizes) {
      _pageSizes.add((
        content: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "${element.name} (W: ${element.width.roundToDouble()} H:${element.height.roundToDouble()})",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 14,
              color: ThemeStyles.fontPrimary,
            ),
          ),
        ),
        key: element.name,
      ));
    }

    _selectedPageSize = _sizes.first.name;
    notifyListeners();
  }

  onChanged(String value) {
    _selectedPageSize = value;
    //TODO add notifier to set the page size
    notifyListeners();
  }
}
