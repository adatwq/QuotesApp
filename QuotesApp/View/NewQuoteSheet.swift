//
//  NewQuoteSheet.swift
//  QuotesApp
//
//  Created by Khawlah Khalid on 30/11/2023.
//

import SwiftUI

struct NewQuoteSheet: View{
    @ObservedObject var viewModel: QuotesViewModel
    var body: some View{
        NavigationStack{
            VStack{
                TextField("Write here", text: $viewModel.newQuote, axis: .vertical)
                Spacer()
                
            }.padding()
            .navigationTitle("New Quote")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done"){
                        viewModel.quotes.append(viewModel.newQuote)
                        viewModel.showAddQuoteSheet.toggle()
                        viewModel.newQuote = ""
                    }
                }
            }
        }
    }
}


#Preview {
    NewQuoteSheet(viewModel: QuotesViewModel())
}
