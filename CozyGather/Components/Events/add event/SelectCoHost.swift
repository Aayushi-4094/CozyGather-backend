import SwiftUI

struct SelectCoHost: View {
    @State private var coHostName: String = ""
    @State private var searchText: String = ""
    @State private var selectedCoHosts: [String] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray5)
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Image("noti1")
                            Spacer()
                            Text("Select Co-Host")
                                .font(Font.custom("AirbnbCereal_W_Md", size: 24))
                                .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
                            Spacer()
                            // Button to navigate back
                            Button(action: {
                                // Handle the back action
                            }) {
                                Image(systemName: "multiply")
                                    .font(.title)
                                    .padding()
                            }
                        }
                        
                        Divider()
                        
                        SearchBar(text: $searchText, placeholder: "Search Co-Host")
                        
                        Divider()
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<3) { index in
                                    VStack {
                                        Image("Avatar Image-\(index + 1)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.blue, lineWidth: 2)
                                                    .overlay(
                                                        Button(action: {
                                                            // Handle the click on the plus sign
                                                            let selectedHost = "Avatar Image-\(index + 1)"
                                                            if !selectedCoHosts.contains(selectedHost) {
                                                                selectedCoHosts.append(selectedHost)
                                                            }
                                                        }) {
                                                            HStack {
                                                                Spacer()
                                                                Image(systemName: "plus.circle.fill")
                                                                    .font(.system(size: 20))
                                                                    .foregroundColor(.green)
                                                                    .offset(y: 40)
                                                            }
                                                            .padding()
                                                        }
                                                    )
                                            )
                                            .shadow(radius: 5)
                                            .padding()

                                        Text("Avatar Image-\(index + 1)")
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                }
                            }
                            .padding()
                        }
                        
                
                        
                        // Display the selected co-hosts
                        ForEach(selectedCoHosts, id: \.self) { coHost in
                            HStack {
                                Text("\(coHost) added as a co-host")
                                    .foregroundColor(.green)
                                
                                // Add a button or icon for removing the co-host
                                Button(action: {
                                    // Handle the removal of the co-host
                                    if let index = selectedCoHosts.firstIndex(of: coHost) {
                                        selectedCoHosts.remove(at: index)
                                    }
                                }) {
                                    Image(systemName: "x.circle.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.red)
                                }
                            }
                            .padding()
                        }
                        
                        Divider()
                        
                        HStack {
                            Image("Airdrop")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .clipShape(RoundedRectangle(cornerRadius: 20)) // Use Circle for rounded edges
                                .padding()
                            
                            Spacer()
                            
                            Image("Messages")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .clipShape(RoundedRectangle(cornerRadius: 20)) // Use RoundedRectangle for rounded edges
                                .padding()
                            
                            Spacer()
                            
                            Image("Mail")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .clipShape(RoundedRectangle(cornerRadius: 5)) // Use RoundedRectangle for rounded edges
                                .padding()
                        }
                        .foregroundColor(.blue)
                        .padding()
                        
                        Divider()
                        
                        HStack {
                            Text("Copy the link")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "doc.on.doc")
                                .font(.title)
                                .padding()
                        }
                        .padding(.horizontal, 20) // Left and right padding
                        .background(RoundedRectangle(cornerRadius: 10)// Rounded edges
                                .foregroundColor(.white) // White rectangular box
                        )
                        
                        Divider()
                        
                        Button("Done") {
                            // Add your action here
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        
                        Spacer()
                   
                    }
                    .padding()
                }
            }
        }
    }
}

struct SelectCoHost_Previews: PreviewProvider {
    static var previews: some View {
        SelectCoHost()
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
            TextField(placeholder, text: $text)
                .padding(.vertical, 8)
        }
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
        .padding(.horizontal)
    }
}
