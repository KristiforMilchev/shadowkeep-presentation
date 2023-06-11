import 'package:flutter/material.dart';

import '../../../page_view_model.dart';

class OpenBookViewModel extends PageViewModel {
  late BuildContext _context;

  ready(BuildContext context) {
    _context = context;
  }
}
