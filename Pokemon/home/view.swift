//
//  view.swift
//  Rick
//
//  Created by Gustavo Fidencio on 05/11/21.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
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
                                ZStack(alignment: .bottomTrailing){
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
                                    HStack{
                                        HStack{
                                            FontIcon.text(.awesome5Solid(code: .minus), fontsize: 12, color: Color(UIColor.systemBackground))
                                        }
                                            .padding(2)
                                            .background(Color.green)
                                            .cornerRadius(14.0)
                                    }
                                    .padding(5)
                                    .background(colorScheme == .dark ? Color(UIColor.secondarySystemBackground):Color(UIColor.systemBackground))
                                    .cornerRadius(14.0)
                                    .offset(x: 3, y: 3)
                                }
                                VStack{
                                    Text(item.name)
                                        .lineLimit(1)
                                        .font(Font.headline.weight(.heavy))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack{
                                        if(item.gender == "Male"){
                                            FontIcon.text(.ionicon(code: .ios_male), color: .blue)
                                        }else{
                                            FontIcon.text(.ionicon(code: .ios_female), color: .pink)
                                        }
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
