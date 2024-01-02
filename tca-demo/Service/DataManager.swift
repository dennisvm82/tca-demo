//
//  DataManager.swift
//  tca-demo
//
//  Created by Dennis van Mazijk on 2023/12/30.
//

import SwiftUI
import ComposableArchitecture

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    func fetchData(completion: @escaping (Result<IdentifiedArrayOf<DaySchedule>, Error>) -> Void) {
        fetchGenericJSONData(file: "DaySchedule", completion: completion)
    }
    
    private func fetchGenericJSONData<T: Decodable>(file: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else { return }

        if let data = try? Data(contentsOf: url) {
            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                completion(.success(objects))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
    }
}
