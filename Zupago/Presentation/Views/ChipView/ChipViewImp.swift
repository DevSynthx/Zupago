//
//  ChipViewImp.swift
//  Zupago
//
//  Created by Inyene Etoedia on 28/08/2023.
//

import Foundation
import UIKit


class ChipViewModel: ObservableObject{
    
    @Published var rows: [[ChipModel]] = []
    @Published var tags: [ChipModel] = [  ChipModel(name: "Data", image: "data"),
                                    ChipModel(name: "Airtime", image: "phone"),
                                    ChipModel(name: "Betting", image: "betting"),
                                    ChipModel(name: "Bills", image: "bills"),                                          
                                    ChipModel(name: "Internet", image: "router"),
                                    ChipModel(name: "Buy/Sell", image: "bitcoin"),
                                    ChipModel(name: "Coin Swap", image: "coinline"),
                                    ChipModel(name: "Gift Card", image: "gift"),]
    @Published var tagText = ""
    @Published var image = "data"
    
    init(){
        getTags()
    }
    
    func addTag(){
        tags.append(ChipModel(name: tagText, image: image))
        tagText = ""
        getTags()
    }
    
    func removeTag(by id: String){
        tags = tags.filter{ $0.id.description != id }
        getTags()
    }
    
    
    func getTags(){
        var rows: [[ChipModel]] = []
        var currentRow: [ChipModel] = []
        
        var totalWidth: CGFloat = 0
        
        let screenWidth = UIScreen.screenWidth - 10
        let tagSpaceing: CGFloat = 56
        
        if !tags.isEmpty{
            
            for index in 0..<tags.count{
                self.tags[index].size = tags[index].name.getSize()
            }
            
            tags.forEach{ tag in
                
                totalWidth += (tag.size + tagSpaceing)
                
                if totalWidth > screenWidth{
                    totalWidth = (tag.size + tagSpaceing)
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(tag)
                }else{
                    currentRow.append(tag)
                }
            }
            
            if !currentRow.isEmpty{
                rows.append(currentRow)
                currentRow.removeAll()
            }
            
            self.rows = rows
        }else{
            self.rows = []
        }
        
    }
}


struct ChipModel: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var image: String
    var size: CGFloat = 0
}
