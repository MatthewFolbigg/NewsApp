//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Folbigg on 21/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: NewsArticles
    
    init(newsArticles: NewsArticles) {
        _vm = .init(wrappedValue: newsArticles)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if vm.articles.isEmpty {
                    ProgressView()
                } else {
                    List() {
                        ForEach(vm.articles, id: \.self.id) { article in
                            ArticleRowView(article: article, vm: vm)
                        }
                        .listRowBackground(EmptyView())
                        .listRowSeparator(.hidden, edges: .top)
                        .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    }
                }
            }
            .navigationTitle(Text(vm.section.name))
            .toolbar() {
                ToolbarItem(placement: .automatic) {
                    Menu(content: {
                        ForEach(GuardianConstants.Section.allCases) { section in
                            Button {
                                vm.set(section: section)
                            } label: {
                                Text(section.name)
                            }
                        }
                    }, label: {
                        Image(systemName: "newspaper.fill")
                    })
                }
            }
            
        }
        .task {
            await vm.getNewsArticles()
        }
        .refreshable {
            await vm.getNewsArticles()
        }
    }


    

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(newsArticles: NewsArticles(service: GuardianLocalTestService()))
    }
}
