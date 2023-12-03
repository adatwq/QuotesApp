//
//  ContentView.swift
//  QuotesApp
//
//  Created by Khawlah Khalid on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = QuotesViewModel()
    var body: some View {
        NavigationStack{
            List {
                ForEach(MyQuotes.quotes, id: \.self){ quote in
                    Text(quote)
                        .italic()
                }
            }.listStyle(.plain)
            .navigationTitle("My quotes")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        viewModel.showAddQuoteSheet.toggle()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showAddQuoteSheet) {
                NewQuoteSheet(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
