import 'package:cashrich/Model/coinData.dart';
import '../state/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coin Rich',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  List<int> index = [0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Coin>> coins = ref.watch(coinStateFuture);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Coin Rich')),
      ),
      body: coins.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('$err+Error')),
        data: (coins) {
          // final data = coins as List<CoinData>;
          return ListView.builder(
              itemCount: coins.length,
              itemBuilder: (context, index) {
                // return Column(
                //   children: [
                //     ListTile(
                //       title: Text(coins[index].bTC!.name.toString()),
                //     )
                //   ],
                // );
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      index == 0 ? Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.pie_chart,
                              color: Colors.amberAccent,
                            ),
                            Text(
                              'Show Chart',
                              style: TextStyle(
                                  color: Colors.amberAccent, fontSize: 20),
                            ),
                            Spacer(),
                            Text(
                              'Count 5',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 20),
                            ),
                          ],
                        ),
                      ) : SizedBox.shrink(),

                      Container(
                        height: 90,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            // border: Border.all(
                            //   color: Colors.red[500],
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  //coins[index].bTC!.name.toString(),
                                  coins[index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.amberAccent, fontSize: 20),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_upward_rounded,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: " " +
                                                coins[index]
                                                    //.bTC!
                                                    .quote!
                                                    .uSD!
                                                    .percentChange24h
                                                    .toString()
                                                    .substring(0, 4),
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 15),
                                          ),
                                          TextSpan(
                                            text: '%',
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 25,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade900,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        //coins[index].bTC!.symbol.toString(),
                                        coins[index].symbol.toString(),
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 15),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\$',
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15),
                                      ),
                                      TextSpan(
                                        text: coins[index]
                                            //.bTC!
                                            .quote!
                                            .uSD!
                                            .price
                                            .toString()
                                            .substring(0, 5),
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  //'\$1.08',
                                  // coins[index].bTC!.quote!.uSD!.marketCapDominance.toString().substring(0,5),
                                  // style: TextStyle(
                                  //     color: Colors.white60,
                                  //     fontSize: 15
                                  // ),
                                ),
                                Text(
                                  //coins[index].bTC!.cmcRank.toString(),
                                  coins[index].cmcRank.toString(),
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 15),
                                ),
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.amberAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        },
      ),

      // body: Center(
      //
      //   child: Column(
      //
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       Padding(
      //         padding: EdgeInsets.all(10),
      //         child: Row(
      //
      //           children: [
      //             Icon(Icons.pie_chart,color: Colors.amberAccent,),
      //             Text(
      //               'Show Chart',
      //               style: TextStyle(
      //                   color: Colors.amberAccent,
      //                   fontSize: 20
      //               ),
      //
      //             ),
      //             Spacer(),
      //             Text(
      //               'Count 5',
      //               style: TextStyle(
      //                   color: Colors.white60,
      //                   fontSize: 20
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         height: 90,
      //         margin: EdgeInsets.all(5),
      //         decoration: BoxDecoration(
      //
      //             color: Colors.black45,
      //             // border: Border.all(
      //             //   color: Colors.red[500],
      //             // ),
      //             borderRadius: BorderRadius.all(Radius.circular(20))
      //         ),
      //         padding: EdgeInsets.all(10),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Row(
      //               children: [
      //                 Text(
      //                   'Cardano',
      //                   style: TextStyle(
      //                       color: Colors.amberAccent,
      //                       fontSize: 20
      //                   ),
      //                 ),
      //                 SizedBox(width: 30,),
      //                 Row(
      //                   children: [
      //                     Icon(Icons.arrow_upward_rounded,color: Colors.green,size: 20,),
      //                     Text(
      //                       '395%',
      //                       style: TextStyle(
      //                           color: Colors.white60,
      //                           fontSize: 15
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //
      //                 Spacer(),
      //                 Container(
      //                   height: 25,
      //                   width: 70,
      //                   decoration: BoxDecoration(
      //                       color: Colors.grey.shade900,
      //                       borderRadius: BorderRadius.all(Radius.circular(5))
      //                   ),
      //                   child: Center(
      //                     child: Padding(
      //                       padding: EdgeInsets.all(5),
      //                       child: Text(
      //                         'ADA',
      //                         style: TextStyle(
      //                             color: Colors.white60,
      //                             fontSize: 15
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   'Price',
      //                   style: TextStyle(
      //                       color: Colors.white60,
      //                       fontSize: 15
      //                   ),
      //                 ),
      //                 Text(
      //                   '\$1.08',
      //                   style: TextStyle(
      //                       color: Colors.white60,
      //                       fontSize: 15
      //                   ),
      //                 ),
      //                 Text(
      //                   'Rank 7',
      //                   style: TextStyle(
      //                       color: Colors.white60,
      //                       fontSize: 15
      //                   ),
      //                 ),
      //                 Icon(Icons.arrow_circle_right_outlined,color: Colors.amberAccent,),
      //               ],
      //             ),
      //           ],
      //         ),
      //       )
      //
      //     ],
      //   ),
      // ),
    );
  }
}

// class _MyHomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade900,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Center(child: Text('Coin Rich')),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Row(
//
//                 children: [
//                   Icon(Icons.pie_chart,color: Colors.amberAccent,),
//                   Text(
//                     'Show Chart',
//                     style: TextStyle(
//                       color: Colors.amberAccent,
//                       fontSize: 20
//                     ),
//
//                   ),
//                   Spacer(),
//                   Text(
//                     'Count 5',
//                     style: TextStyle(
//                         color: Colors.white60,
//                         fontSize: 20
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 90,
//               margin: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//
//                 color: Colors.black45,
//                   // border: Border.all(
//                   //   color: Colors.red[500],
//                   // ),
//                   borderRadius: BorderRadius.all(Radius.circular(20))
//               ),
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         'Cardano',
//                         style: TextStyle(
//                             color: Colors.amberAccent,
//                             fontSize: 20
//                         ),
//                       ),
//                       SizedBox(width: 30,),
//                       Row(
//                         children: [
//                           Icon(Icons.arrow_upward_rounded,color: Colors.green,size: 20,),
//                           Text(
//                             '395%',
//                             style: TextStyle(
//                                 color: Colors.white60,
//                                 fontSize: 15
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       Spacer(),
//                       Container(
//                         height: 25,
//                         width: 70,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.shade900,
//                             borderRadius: BorderRadius.all(Radius.circular(5))
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.all(5),
//                             child: Text(
//                               'ADA',
//                               style: TextStyle(
//                                   color: Colors.white60,
//                                   fontSize: 15
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Price',
//                         style: TextStyle(
//                             color: Colors.white60,
//                             fontSize: 15
//                         ),
//                       ),
//                       Text(
//                         '\$1.08',
//                         style: TextStyle(
//                             color: Colors.white60,
//                             fontSize: 15
//                         ),
//                       ),
//                       Text(
//                         'Rank 7',
//                         style: TextStyle(
//                             color: Colors.white60,
//                             fontSize: 15
//                         ),
//                       ),
//                       Icon(Icons.arrow_circle_right_outlined,color: Colors.amberAccent,),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//
//           ],
//         ),
//       ),
//
//     );
//   }
// }
