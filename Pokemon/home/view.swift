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
                        ItemList(character:item)
                    }
                }
            }
            .navigationBarTitle("Characters")
            .onAppear(perform: {
                viewModel.loadData()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
