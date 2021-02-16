import 'package:intl/intl.dart' as intl;
import 'dart:ui' as ui;

getTextDirection({String languageString = null}) {
  if (intl.Bidi.isRtlLanguage(languageString)) {
    return ui.TextDirection.rtl;
  } else
    return ui.TextDirection.ltr;
}
