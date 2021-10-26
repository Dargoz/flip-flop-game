import 'package:flip_flop_game/domain/firebase/entities/config.dart';
import 'package:flip_flop_game/domain/game/constants.dart';
import 'package:flip_flop_game/domain/maintenance/utils/format_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({
    Key? key,
    required this.config,
    required this.groupId,
  }) : super(key: key);

  final Config config;
  final String groupId;

  @override
  Widget build(BuildContext context) {
    var fileName = GameConfig.pokemon[groupId];
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 187, 231, 255),
        body: LayoutBuilder(
          builder: (context, constraints) {
            int estimateTs =
                DateTime(2021, 11, 5, 15, 0, 0).millisecondsSinceEpoch;
            return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 4),
                    Image.asset(
                      "resources/pokemon/$fileName.png",
                      scale: fileName == config.placeholderName
                          ? config.customScale
                          : 5,
                    ),
                    const Spacer(flex: 4),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                        border: Border.all(
                            color: const Color.fromARGB(200, 69, 69, 69)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          child: Text(
                            config.mtMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromARGB(200, 69, 69, 69),
                                fontSize: 42,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Spacer(flex: 1),
                    StreamBuilder(
                        stream: Stream.periodic(
                            const Duration(seconds: 1), (i) => i),
                        builder: (BuildContext context,
                            AsyncSnapshot<int> snapshot) {
                          var remaining =
                              FormatUtil.formatRemainingDuration(estimateTs);
                          return Container(
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Spacer(),
                                _buildNumberFrame(remaining.daysLeft, "days"),
                                _buildNumberFrame(remaining.hoursLeft, "hours"),
                                _buildNumberFrame(
                                    remaining.minutesLeft, "minutes"),
                                _buildNumberFrame(
                                    remaining.secondsLeft, "seconds"),
                                const Spacer(),
                              ],
                            ),
                          );
                        }),
                    const Spacer(flex: 4),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => launch(config.link),
                        child: Image.asset(
                          "resources/misc/treasure-chest.png",
                          scale: 5,
                        ),
                      ),
                    ),
                    const Spacer(flex: 4),
                  ],
                ));
          },
        ));
  }

  Widget _buildNumberFrame(String number, String dateType) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 175, 212, 238),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              number,
              style: const TextStyle(
                  color: Color.fromARGB(200, 69, 69, 69),
                  fontSize: 42,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text(
          dateType,
          style: const TextStyle(
              color: Color.fromARGB(200, 69, 69, 69),
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
