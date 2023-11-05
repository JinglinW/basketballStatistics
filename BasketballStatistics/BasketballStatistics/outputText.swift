//
//  outputText.swift
//  BasketballStatistics
//
//  Created by Jinglin Wang on 2023. 06. 08..
//

import Foundation

class BasketballData: ObservableObject {
    @Published var totalGamesPlayed: Double = 0
    @Published var totalGamesWon: Double = 0
    @Published var totalPoints: Double = 0
    @Published var totalRebounds: Double = 0
    @Published var totalAssists: Double = 0
    @Published var totalSteals: Double = 0
    @Published var totalBlocks: Double = 0
    @Published var outputText: String = ""
}
