//
//  ProgressManager.swift
//  Emoji Madness
//
//  Created by BRIAN VALENTINE on 4/22/25.
//

import Foundation

struct Progress: Codable {
    let answer: String
    let wasSuccessful: Bool
    let timeSpent: Double
}

class ProgressManager {
    static let shared = ProgressManager()

    private let storageKey = "RebusProgress"
    private var allProgress: [String: [Int: Progress]] = [:] // [Level.rawValue: [Index: Progress]]

    private init() {
        loadFromDisk()
    }

    func update(level: Level, index: Int, success: Bool, answer: String, timeSpent: Double) {
        var levelProgress = allProgress[level.rawValue] ?? [:]
        levelProgress[index] = Progress(answer: answer, wasSuccessful: success, timeSpent: timeSpent)
        allProgress[level.rawValue] = levelProgress
        saveToDisk()
    }

    func getProgress(for level: Level) -> [Int: Progress]? {
        return allProgress[level.rawValue]
    }

    func getProgress(for level: Level, index: Int) -> Progress? {
        return allProgress[level.rawValue]?[index]
    }

    private func saveToDisk() {
        if let data = try? JSONEncoder().encode(allProgress) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    private func loadFromDisk() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([String: [Int: Progress]].self, from: data) {
            allProgress = decoded
        }
    }

    func resetAllProgress() {
        allProgress.removeAll()
        UserDefaults.standard.removeObject(forKey: storageKey)
    }
}
