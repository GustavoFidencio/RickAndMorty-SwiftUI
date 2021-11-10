//
//  view.swift
//  Rick
//
//  Created by Gustavo Fidencio on 05/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if viewModel.isLoad {
                    ProgressView()
                }else{
                    List(viewModel.items, id: \.name){ item in
                        VStack{
                            HStack{
                                AsyncImage(url: URL(string: item.image)!,
                                   placeholder: { Text("Loading ...") },
                                        image: {
                                            Image(uiImage: $0)
                                                .resizable()
                                        }
                                )
                                    .cornerRadius(7.0)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80, alignment: .center)
                                
                                VStack{
                                    Text(item.name)
                                        .lineLimit(1)
                                        .font(Font.headline.weight(.heavy))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack{
                                        Image(systemName: "square.and.pencil")
                                        Text(item.gender)
                                            .lineLimit(1)
                                            .font(Font.headline.weight(.light))
                                        Text(item.species)
                                            .lineLimit(1)
                                            .font(Font.headline.weight(.light))
                                        Text(item.status)
                                            .lineLimit(1)
                                            .font(Font.headline.weight(.light))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(
                                    maxWidth: .infinity,
                                    maxHeight: .infinity
                                )
                                .padding()
                            }

                        }
                        .onAppear(){
                            print(item.name)
                        }
                        Button("") {
                            print("pfpdsppfspdfsdf", item.image)
                        }
                    }
                }
            }
            .onAppear(perform: {
                print("oi eu sou o pear")
                viewModel.loadData()
            })
            .navigationBarTitle("Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
