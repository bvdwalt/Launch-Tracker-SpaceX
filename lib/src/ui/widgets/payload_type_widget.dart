import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:launch_tracker_spacex/src/blocs/flights_bloc.dart';
import 'package:launch_tracker_spacex/src/resources/api_response.dart';
import 'package:spacex_api/models/launch/launch.dart';
import 'package:spacex_api/models/payload.dart';

class PayloadTypeWidget extends StatelessWidget {
  const PayloadTypeWidget({
    Key key,
    @required this.bloc,
    @required this.launch,
  }) : super(key: key);

  final SpaceXDataBloc bloc;
  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.payloads,
      builder: (context, AsyncSnapshot<ApiResponse<List<Payload>>> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Text('loading...', style: TextStyle(fontSize: 12));
              break;
            case Status.COMPLETED:
              if (launch.payloads?.length != 0) {
                final payload = snapshot.data.data
                    .toList()
                    .where((payload) => payload.id == launch.payloads.first)
                    .first;
                return AutoSizeText(
                  payload?.type ?? '',
                  textAlign: TextAlign.right,
                  maxLines: 2,
                );
              } else {
                return AutoSizeText('', textAlign: TextAlign.right);
              }
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
