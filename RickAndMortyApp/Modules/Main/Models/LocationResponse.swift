//
//  LocationResponse.swift
//  RickAndMortyApp
//
//  Created by furkan on 20.02.2024.
//

import Foundation

struct LocationResponse: Decodable {
    let info: LocationInfoResponse?
    let results: [LocationResultResponse]?
}

struct LocationInfoResponse: Decodable {
    let next: String?
    let prev: String?
}

struct LocationResultResponse: Decodable {
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [URL]?
}

