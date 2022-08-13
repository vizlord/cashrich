import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/coinData.dart';

import '../Network/network_request.dart';

final coinStateFuture = FutureProvider<List<Coin>>((ref) async {
  return fetchCoins();
});