//
//  ContentView.swift
//  quotesApp
//
//  Created by Vasileios Gkreen on 30/01/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var quotes : [Quote]
    
//    var quotes : [Quote] = [
//        Quote(quote: "First Quote", name: "Robert Doney Jr."),
//        Quote(quote: "First Quote", name: "Robert Doney Jr."),
//        Quote(quote: "First Quote", name: "Robert Doney Jr."),
//        Quote(quote: "First Quote", name: "Robert Doney Jr."),
//        Quote(quote: "First Quote", name: "Robert Doney Jr."),
//        Quote(quote: "First Quote", name: "Robert Doney Jr."),
//        Quote(quote: "First Quote", name: "Robert Doney Jr."),
//        Quote(quote: "First Quote", name: "Robert Doney Jr.")
//    ]
    
    
    var body: some View {
        VStack {
            CircleImage(imageName: "lilly")
                .frame(width: 160, height: 160)
                .padding(.top, 89)
                .padding(.bottom, 20)
            
            MainView(quotes: self.quotes)
            
            Spacer()
            
        }.background(
            Image("motivation_bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}






struct MainView: View {
    
    var quotes : [Quote]
        
    var body: some View {
        VStack(){
            
            HStack(){
                
                Text("\(self.quotes.count) Quotes Available")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.white)
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                
                    ForEach(self.quotes, id: \.name){
                        quote in
                        VStack(){
                            CircleImage(imageName: "lilly")
                            Text(quote.quote)
                                .font(.headline)
                                .italic()
                            
                            Divider()
                            
                            Text("By - \(quote.name)")
                                .italic()
                                .font(.custom("Helvetica neue", size: 14))
                            
                        }.frame(width: 300, height: 300)
                            .foregroundColor(.gray)
                            .padding(4)
                            .background(Color.white)
                            .cornerRadius(13)
                            .overlay(
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.clear, .pink]),
                                            startPoint: .center, endPoint: .topLeading
                                        )
                                    ).clipped().shadow(radius: 8)
                        )
                    }
                }
            }
        }
    }
}



struct CircleImage: View {
    var imageName: String
    
    var body: some View{
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 10)
            .frame(width: 100, height: 100)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quotes: quoteData)
    }
}
