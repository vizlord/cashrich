import 'dart:convert';
import '../Model/coinData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

List<Coin> parseCoin(String responseBody){
  // print(responseBody);
  // var mapObject = json.decode(responseBody);
  // print(mapObject);
  //dynamic coins = mapObject.map((model) => CoinData.fromJson(model));
  CoinData coins = CoinData.fromJson(json.decode(responseBody));
  if (kDebugMode) {
    print(coins.data);
  }
  List<Data> dataList = [];
  List<Coin> coinObjects = [];

  try{
    dataList.add(coins.data as Data);
    coinObjects.add(dataList[0].bTC as Coin);
    coinObjects.add(dataList[0].eTH as Coin);
    coinObjects.add(dataList[0].lTC as Coin);
  }catch(e){
    print(e);
  }

  // for (int i = 0; i <= dataList.length; i++) {
  //   try {
  //     coinObjects.add(dataList[i] as Coin);
  //     print(coinObjects);
  //   } catch (e) {
  //     print('Error Post : ' + e.toString());
  //   }
  // }

  return coinObjects ;
}

Future<List<Coin>> fetchCoins() async{
  var url = Uri.parse("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETH,LTC");
  final response = await http.get(url, headers: {
    'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149',
  });

  if(response.statusCode == 200){
    return compute(parseCoin,response.body);
  }else{
    throw Exception("Can't get Data");
  }


}