//
//  ContentView.swift
//  HackerNews
//
//  Created by Bing Xiong on 12/3/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManger = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManger.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }

            }
            .navigationTitle("Haker News")
        }
        .onAppear(perform: {
            self.networkManger.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


