//
//  itemList.swift
//  Rick
//
//  Created by Gustavo Fidencio on 12/11/21.
//

import SwiftUI
import SwiftUIFontIcon

struct StatusIcon : View {
    
    var status: String
    @Environment(\.colorScheme) var colorScheme
    
    func getColor()->Color{
        switch (status){
           case "Alive":
                return Color.green
           case "dead":
                return Color.red
           default:
               return Color.gray
           }
    }
    
    var body: some View{
        HStack{
            FontIcon.text(.awesome5Solid(code: .minus), fontsize: 12, color: Color(UIColor.systemBackground))
        }
            .padding(5)
            .background(getColor())
            .cornerRadius(14.0)
            .overlay(
                RoundedRectangle(cornerRadius: 99)
                    .stroke(colorScheme == .dark ? Color(UIColor.secondarySystemBackground):Color(UIColor.systemBackground), lineWidth: 6)
            )
            .offset(x: 3, y: 3)
    }
}

struct ItemList : View {
    
    var character: Character
    
    func genderIcon(gender:String)-> some View {
        gender == "Male" ?
            FontIcon.text(.ionicon(code: .ios_male), color: .blue)
            :
            FontIcon.text(.ionicon(code: .ios_female), color: .pink)
    }
    
    var body: some View{
        VStack{
            HStack{
                ZStack(alignment: .bottomTrailing){
                    AsyncImage(url: URL(string: character.image)!,
                       placeholder: { Text("Loading ...") },
                            image: {
                                Image(uiImage: $0)
                                    .resizable()
                            }
                    )
                        .cornerRadius(7.0)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .center)
                    StatusIcon(status: character.status)
                }
                VStack{
                    Text(character.name)
                        .lineLimit(1)
                        .font(Font.headline.weight(.heavy))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        genderIcon(gender:character.gender)
                        Text(character.species)
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
            print(character.name)
        }
        Button("") {
            print("pfpdsppfspdfsdf", character.image)
        }
    }
}
