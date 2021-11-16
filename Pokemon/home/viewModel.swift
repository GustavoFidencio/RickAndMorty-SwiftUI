//
//  viewModel.swift
//  Rick
//
//  Created by Gustavo Fidencio on 05/11/21.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var isLoad = true
    @Published var items = [Character]()
    
    let getUrl = "https://rickandmortyapi.com/api/character"
    
    func loadData(){
        guard let url = URL(string: getUrl) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, res, err) in
            do{
                if let data = data{
                    let result = try JSONDecoder().decode(Model.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.results
                        self.isLoad = false
                    }
                } else {
                    print("No Data")
                    self.isLoad = false
                }
            } catch (let error){
                self.isLoad = false
                print("vortemo pro catch das vida")
                print(error.localizedDescription)
            }
        }.resume()
    }
}
