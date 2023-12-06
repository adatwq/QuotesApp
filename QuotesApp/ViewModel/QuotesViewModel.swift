//
//  QuotesViewModel.swift
//  QuotesApp
//
//  Created by Khawlah Khalid on 30/11/2023.
//

import Foundation
class QuotesViewModel: ObservableObject{
   @Published var showAddQuoteSheet: Bool = false
   @Published var newQuote: String = ""
    
    init(){  fetchQuotes() }
    
    func fetchQuotes(){
        MyQuotes.quotes =  ["Be yourself; everyone else is already taken", "A room without books is like a body without a soul", "Be the change that you wish to see in the world"]
    }
   

}
