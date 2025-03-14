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
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
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
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOptions == .location ? 120 : 64)
            
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOptions = .location
                }
            }
            
            VStack(alignment: .leading) {
                if selectedOptions == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From",
                                   selection: $startDate,
                                   displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To",
                                   selection: $endDate,
                                   displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }else{
                    CollapesedPickerView(
                        title: "When", description: "Add dates"
                    )
                   
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOptions == .dates ? 180 : 64)
            
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOptions = .dates
                }
            }
            
            VStack {
                
                if selectedOptions == .guests {
                    Text("Who's coming?")
                        .font(.title)
                        .fontWeight(.semibold)
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                    
                }else{
                    CollapesedPickerView(
                        title: "Who", description: "Add guests"
                    )
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOptions == .guests ? 120 : 64)
            
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOptions = .guests
                }
            }
            
           
            
            Spacer()
            
            
            
            
        }
    }
}

#Preview {
    DestinationSearchView(
        show: .constant(false)
    )
}


struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
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
