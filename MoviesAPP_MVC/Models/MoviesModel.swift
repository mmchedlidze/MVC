//
//  DataSourceModel.swift
//  MVC_MoviesApp
//
//  Created by Mariam Mchedlidze on 17.11.23.
//

struct NetworkManagerModel {
    static let shared = NetworkManagerController()
    let baseURL = "https://api.themoviedb.org/3"
    let apiKey = "7fabaf502ac30aa72cc40bb5f42eec9a"
}
