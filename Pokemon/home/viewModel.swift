//
//  viewModel.swift
//  Pokemon
//
//  Created by Gustavo Fidencio on 05/11/21.
//

import Foundation

class ViewModel : ObservableObject {

    @Published var items = [BasicPoke]()
    let getUrl = "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20"
    
    func loadData(){
        print("oi")
        guard let url = URL(string: getUrl) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, res, err) in
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(Model.self, from: data)
                    print(result)
                    DispatchQueue.main.async {
                        self.items = result.results
                    }
                } else {
                    print("No Data")
                }
            } catch (let error){
                print(error.localizedDescription)
            }
        }.resume()
    }
}
