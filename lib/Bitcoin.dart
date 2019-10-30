import 'package:bitcoin_ticker/coin_data.dart';

import 'network.dart';

const BASE_URL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class Bitcoin {
  getPriceBySymbol({String symbol = 'USD'}) async {
    Map<String, String> cryptoPrices = {};

    for (String cypto in cryptoList) {
      print(cypto);
      NetworkHelper nh = NetworkHelper('$BASE_URL/$cypto$symbol');
      var jsonData = await nh.getData();
      double price = jsonData["last"];

      cryptoPrices[cypto] = price.toStringAsFixed(0);
    }

    return cryptoPrices;
  }
}
