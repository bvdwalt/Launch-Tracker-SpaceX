import 'package:flutter_test/flutter_test.dart';
import 'package:launch_tracker_spacex/src/helpers/url_helper.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Helper tests:", () {
    test('URL Helper test', () async {
      launchURL(null);

      launchURL("google.com");
    });
  });
}
