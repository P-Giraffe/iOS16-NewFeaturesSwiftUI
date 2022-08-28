//
//  ContentView.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 27/08/2022.
//

import SwiftUI

struct PostDetail: View {
    let _post:Post
    
    var body: some View {
        VStack {
            Text(_post._content).padding(10)
            Spacer()
        }
    }
    
}

struct ContentView: View {
    var _postDirectory = PostDirectory()
    var _categories = Categories.allCases
    
    var body: some View {
        NavigationView {
            List {
                ForEach(_categories, id:\.self) { category in
                    Section(header:Text(category.rawValue)) {
                        ForEach(_postDirectory.filterCategory(category: category), id:\.self) { post in
                            NavigationLink(
                                destination: PostDetail(_post: post).navigationTitle(post._name)){
                                    Text(post._name)
                                }
                        }
                    }
                }
            }
            .navigationViewStyle(.stack)
            .navigationTitle("Categories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
