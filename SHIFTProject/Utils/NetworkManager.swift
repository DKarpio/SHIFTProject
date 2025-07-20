//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Дмитрий К on 22.02.2024.
//

import Foundation
import UIKit

final class NetworkManager
{
    static let shared = NetworkManager()
    
    static let url = "https://fakerapi.it/api/v1/books"
    
    private init() {}
	
    func getBooks() async throws -> BookResponse
	{
        guard let url = URL(string: NetworkManager.url) else
		{
            throw URLError(.badURL)
		}
		
		let (data, _) = try await URLSession.shared.data(from: url)
		
		do {
			let decoder = JSONDecoder()
			let decodedResponse = try decoder.decode(BookResponse.self, from: data)
            return decodedResponse
		} catch {
            throw URLError(.cannotParseResponse)
		}
	}
}

struct BookResponse: Decodable
{
    //let total: Int
    let data: [Data]
}

struct Data: Decodable
{
    let id: Int
    let title: String
    let author: String
}
