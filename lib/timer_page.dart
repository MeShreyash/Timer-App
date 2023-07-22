import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/main.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '60 Seconds Timer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final time = ref.watch(timerProvider);
          final timerNotifier = ref.watch(timerProvider.notifier);
          final isTimerActive = timerNotifier.isTimerActive;

          return Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //60 text
                Text(
                  time.toString(),
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Seconds",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              timerNotifier.resetTimer();
                            },
                            icon: Transform.scale(
                              scale: 1.8,
                              child: const Icon(
                                Icons.restore_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Reset',
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                      isTimerActive
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          timerNotifier.pauseTimer();
                                        },
                                        backgroundColor: Colors.green,
                                        child: const Icon(Icons.pause_rounded),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text('Pause',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 75),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          timerNotifier.resumeTimer();
                                        },
                                        backgroundColor: Colors.green,
                                        child: const Icon(
                                            Icons.play_arrow_rounded),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text('Resume',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      timerNotifier.startTimer();
                                    },
                                    backgroundColor: Colors.green,
                                    child: const Icon(Icons.play_arrow_rounded),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text('Start',
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
