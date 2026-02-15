class CurrenciesListAPIResponse {
  final List<Crypto> data;

  CurrenciesListAPIResponse({required this.data});

  factory CurrenciesListAPIResponse.fromJson(Map<String, dynamic> json) {
    return CurrenciesListAPIResponse(
      data: List<Crypto>.from(json['data'].map((x) => Crypto.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data.map((x) => x.toJson()).toList(),
    };
  }
}

class Crypto {
  final int id;
  final String key;
  final String symbol;
  final String name;
  final String type;
  final int rank;
  final int categoryId;
  final int lastUpdated;
  final double totalSupply;
  final double maxSupply;
  final double circulatingSupply;
  final double volume24hBase;
  final Images images;
  final double price;
  final double high24h;
  final double low24h;
  final double volume24h;
  final double marketCap;
  final double fullyDilutedValuation;
  final int createdAt;
  final AthAth atl;
  final AthAth ath;

  Crypto({
    required this.id,
    required this.key,
    required this.symbol,
    required this.name,
    required this.type,
    required this.rank,
    required this.categoryId,
    required this.lastUpdated,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.volume24hBase,
    required this.images,
    required this.price,
    required this.high24h,
    required this.low24h,
    required this.volume24h,
    required this.marketCap,
    required this.fullyDilutedValuation,
    required this.createdAt,
    required this.ath,
    required this.atl,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      key: json['key'],
      symbol: json['symbol'],
      name: json['name'],
      type: json['type'],
      rank: json['rank'],
      categoryId: json['categoryId'],
      lastUpdated: json['lastUpdated'],
      totalSupply: (json['totalSupply'] ?? 0).toDouble(),
      maxSupply: (json['maxSupply'] ?? 0).toDouble(),
      circulatingSupply: (json['circulatingSupply'] ?? 0).toDouble(),
      volume24hBase: (json['volume24hBase'] ?? 0).toDouble(),
      images: Images.fromJson(json['images']),
      price: (json['price'] ?? 0).toDouble(),
      high24h: (json['high24h'] ?? 0).toDouble(),
      low24h: (json['low24h'] ?? 0).toDouble(),
      volume24h: (json['volume24h'] ?? 0).toDouble(),
      marketCap: (json['marketCap'] ?? 0).toDouble(),
      fullyDilutedValuation: (json['fullyDilutedValuation'] ?? 0).toDouble(),
      createdAt: json['createdAt'],
      ath: AthAth.fromJson(json['ath']),
      atl: AthAth.fromJson(json['atl']),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "symbol": symbol,
    "name": name,
    "type": type,
    "rank": rank,
    "categoryId": categoryId,
    "lastUpdated": lastUpdated,
    "totalSupply": totalSupply,
    "maxSupply": maxSupply,
    "circulatingSupply": circulatingSupply,
    "volume24hBase": volume24hBase,
    "images": images.toJson(),
    "price": price,
    "high24h": high24h,
    "low24h": low24h,
    "volume24h": volume24h,
    "marketCap": marketCap,
    "fullyDilutedValuation": fullyDilutedValuation,
    "createdAt": createdAt,
    "ath": ath.toJson(),
    "atl": atl.toJson(),
  };
}

class Images {
  final String x60;
  final String x150;
  final String icon;
  final String nativeImage;

  Images({
    required this.x60,
    required this.x150,
    required this.icon,
    required this.nativeImage,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      x60: json['x60'],
      x150: json['x150'],
      icon: json['icon'],
      nativeImage: json['native'],
    );
  }

  Map<String, dynamic> toJson() => {
    "x60": x60,
    "x150": x150,
    "icon": icon,
    "native": nativeImage,
  };
}

class AthAth {
  final int date;
  final double value;
  final double percentChange;

  AthAth({
    required this.date,
    required this.value,
    required this.percentChange,
  });

  factory AthAth.fromJson(Map<String, dynamic> json) {
    return AthAth(
      date: json['date'],
      value: (json['value'] ?? 0).toDouble(),
      percentChange: (json['percentChange'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date,
    "value": value,
    "percentChange": percentChange,
  };
}
