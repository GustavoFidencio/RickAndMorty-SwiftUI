//
//  view.swift
//  Pokemon
//
//  Created by Gustavo Fidencio on 05/11/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List(viewModel.items, id: \.name){ item in
                    Text(item.name)
                        .padding()
                }
                Button("teste") {
                    print("pfpdsppfspdfsdf")
                }
            }
            .onAppear(perform: {
                viewModel.loadData()
            })
            .navigationBarTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
