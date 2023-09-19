//
//  Route.swift
//  Zupago
//
//  Created by Inyene Etoedia on 18/09/2023.
//

import Foundation
final class Router<T: Hashable>: ObservableObject {
    @Published var root: T
    @Published var paths: [T] = []
    
    init(root: T){
        self.root = root
    }
    
    func push(_ path: T){
        paths.append(path)
        
    }
    
    func popLast(){
        paths.removeLast()
    }
    
    func updateRoot(root: T){
        self.root = root
    }
    
    func popToRoot(){
        paths = []
    }
    
}


enum Routes {
    case MainScreen
    case BuySell
}
