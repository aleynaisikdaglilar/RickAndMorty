//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Aleyna Işıkdağlılar on 17.10.2024.
//

import Foundation

// Responsibilities
// - show search results
// - show no results view
// - kick off API requests

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    private var searchText = ""
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOption,String)) -> Void)?
    private var searchResultHandler: (() -> Void)?
    
    //    MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    //    MARK: - Public
    
    public func registerSearchResultHandler(_ block: @escaping() -> Void) {
        self.searchResultHandler = block
    }
    
    public func executeSearch() {
        print(searchText)
        
        //        Build arguments
        
        //        var queryParams: [URLQueryItem] = [URLQueryItem(name: "name", value: searchText)]
        var queryParams: [URLQueryItem] = [URLQueryItem(name: "name", value: searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))]
        
        //        Add options
        queryParams.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
            let key: RMSearchInputViewViewModel.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        }))
        
        //        Create request
        let  request = RMRequest(endpoint: config.type.endpoint, queryParameters: queryParams)
        
        print(request.url?.absoluteString)
        
        RMService.shared.execute(request, expecting: RMGetAllCharactersResponse.self) { result in
            //        notify view of results, no results or error
            
            switch result {
            case .success(let model):
                print(model.results.count)
            case .failure:
                break
            }
        }
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(_ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void) {
        self.optionMapUpdateBlock = block
    }
}
