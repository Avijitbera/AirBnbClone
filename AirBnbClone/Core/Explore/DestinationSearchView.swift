//
//  DestinationSearchView.swift
//  AirBnbClone
//
//  Created by Avijit bera on 03/03/25.
//


import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
    
}

struct DestinationSearchView:View {
    
    @Binding var show:Bool
    @State private var destination: String = ""
    
    @State private var selectedOptions :DestinationSearchOptions = .location
    
    var body: some View {
        VStack{
            Button{
                withAnimation(.snappy){
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            VStack(alignment: .leading){
                if selectedOptions == .location {
                    Text("Where to?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                    CollapesedPickerView(
                        title: "Where to?", description: "Search destinations"
                    )
                    
                }
               
            }
            .padding()
            .frame(height: selectedOptions == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOptions = .location
                }
            }
            
            VStack {
                if selectedOptions == .dates {
                    HStack {
                        Text("Show expanded view")
                        Spacer()
                    }
                }else{
                    CollapesedPickerView(
                        title: "When", description: "Add dates"
                    )
                   
                }
            }
            .padding()
            .frame(height: selectedOptions == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOptions = .dates
                }
            }
            
            VStack {
                
                if selectedOptions == .guests {
                    HStack {
                        Text("Show expanded view")
                        Spacer()
                    }
                }else{
                    CollapesedPickerView(
                        title: "Who", description: "Add guests"
                    )
                }
            }
            .padding()
            .frame(height: selectedOptions == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOptions = .guests
                }
            }
            
           
            
            
            
            
            
            
        }
    }
}

#Preview {
    DestinationSearchView(
        show: .constant(false)
    )
}

struct CollapesedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                Text(description)
            }
            .fontWidth(.standard)
            .font(.subheadline)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius: 10)
    }
}
