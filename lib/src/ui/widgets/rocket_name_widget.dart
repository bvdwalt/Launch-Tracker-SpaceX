import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:launch_tracker_spacex/src/blocs/flights_bloc.dart';
import 'package:launch_tracker_spacex/src/resources/api_response.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/rocket/rocket.dart';

class RocketNameWidget extends StatelessWidget {
  const RocketNameWidget({
    Key key,
    @required this.bloc,
    @required this.launch,
  }) : super(key: key);

  final SpaceXDataBloc bloc;
  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.rockets,
      builder: (context, AsyncSnapshot<ApiResponse<List<Rocket>>> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Text('loading...', style: TextStyle(fontSize: 12));
              break;
            case Status.COMPLETED:
              final rocket = snapshot.data.data
                  .toList()
                  .where((rocket) => rocket.id == launch.rocket)
                  .first;
              return AutoSizeText(
                rocket.name ?? '',
                textAlign: TextAlign.right,
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
