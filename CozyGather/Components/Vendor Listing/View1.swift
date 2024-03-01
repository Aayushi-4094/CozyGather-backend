import SwiftUI

struct View1: View {
    @State private var isShowingDetailView = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Top Section
                HStack {
                    Text("Vendor Name")
                        .font(.title)
                        .foregroundColor(.black)
                    Spacer()
                    Text("⭐️⭐️⭐️⭐️")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                }
                
                VStack {
                    HStack {
                        Text("Starting from")
                            .foregroundColor(.black)
                        Text("$1200")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                
                Image("venrd1")
                    .resizable()
                    .frame(width: 390, height: 260)
                
                VStack {
                    HStack {
                        Image(systemName: "mappin")
                        Text("Address")
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                    HStack {
                        Image(systemName: "phone")
                        Text("Phone")
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                // Photos Section
                HStack {
                    Text("Photos")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingDetailView = true
                    }) {
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(.blue)
                    }
                }
                
                TabView {
                    ForEach(0..<5) { index in
                        Image("photo\(index + 1)") // Assuming you have images named photo1, photo2, etc.
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .padding()
                .frame(width: 300, height: 500)
                
                Text("Available Cakes")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                HStack {
                    Image("photo1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                    Spacer()
                    
                    Image("photo2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                    Spacer()
                    
                    Image("photo1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                .padding()
                
                Text("Amenities")
                    .font(.title)
                
                HStack {
                    Text("Parking")
                    
                    Spacer()
                    
                    Text("Food")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("Food")
                        .foregroundColor(.black)
                }
                
                // Book Button
                Button(action: {
                    // Handle Book action
                }) {
                    Text("Book Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("Vendor Details", displayMode: .inline)
            .padding()
        }
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
