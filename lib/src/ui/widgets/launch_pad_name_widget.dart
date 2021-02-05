import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:launch_tracker_spacex/src/blocs/flights_bloc.dart';
import 'package:launch_tracker_spacex/src/models/launchPad.dart';
import 'package:launch_tracker_spacex/src/resources/api_response.dart';
import 'package:spacex_api/models/launch/launch.dart';

class LaunchPadNameWidget extends StatelessWidget {
  const LaunchPadNameWidget({
    Key key,
    @required this.bloc,
    @required this.launch,
    this.shortName = true,
  }) : super(key: key);

  final SpaceXDataBloc bloc;
  final Launch launch;
  final bool shortName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.launchpads,
      builder: (context, AsyncSnapshot<ApiResponse<List<Launchpad>>> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Text('loading...', style: TextStyle(fontSize: 12));
              break;
            case Status.COMPLETED:
              final launchpad = snapshot.data.data
                  .toList()
                  .where((launchpad) => launchpad.id == launch.launchpad)
                  .first;
              return AutoSizeText(
                shortName ? launchpad?.name : launchpad?.fullName ?? '',
                textAlign: TextAlign.right,
                minFontSize: 10,
                maxLines: 2,
              );
              break;
            case Status.ERROR:
              return Text('Not Found', style: TextStyle(fontSize: 12));
              break;
          }
        }
        return Container();
      },
    );
  }
}
