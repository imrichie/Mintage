//
//  CoinData.swift
//  Mintage
//
//  Created by Richie Flores on 6/14/22.
//

import Foundation

struct CoinData: Codable {
  let rate: Double      // i.e., $20.65
  let currency: String  // i.e., USD
  let crypto: String    // i.e., BTC
  
}

extension CoinData {
  enum CodingKeys: String, CodingKey {
    case rate
    case currency = "asset_id_quote"
    case crypto = "asset_id_base"
  }
}


// Display top 5 crypto currencies
// BTC
// ETH
// DOGE
// USDT
// USDC
