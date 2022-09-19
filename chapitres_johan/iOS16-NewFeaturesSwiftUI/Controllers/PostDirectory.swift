//
//  PostDirectory.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 27/08/2022.
//
enum Categories: String, CaseIterable {
    case Category1 = "Category 1"
    case Category2 = "Category 2"
}

struct PostDirectory {
    var _postList:[Post]=[]
    
    init() {
        for i in 1...15 {
            self._postList.append(
                Post(_id: i,
                     _name: "Article n°\(i)",
                     _content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                     _category: i%2==0 ?Categories.Category1:Categories.Category2)
            )
        }
    }
    
    public func filterCategory(category:Categories) -> [Post] {
        _postList.filter { $0._category == category}
    }
}
