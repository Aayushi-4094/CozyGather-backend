
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
                        .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                    Spacer()
                    Text("⭐️⭐️⭐️⭐️")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                }
                

                
                Image("vendor1")
                    .resizable()
                    .frame(width: 250, height: 250)
              
                
                VStack {
                    HStack {
                        Image(systemName: "mappin")
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                        Text("Address")
                            .font(.body)
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                            .multilineTextAlignment(.leading)
                        Spacer()

                    }
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                        Text("Phone")
                            .font(.body)
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                            .multilineTextAlignment(.leading)
                        Spacer()

                    }
                    HStack {
                        Text("Starting from")
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                        Text("$1200")
                            .font(.body)
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                        Spacer()
                    }
                }
                
                // Photos Section
                HStack {
                    Text("Photos")
                        .font(.title)
                        .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                    Spacer()
                    
//                    Button(action: {
//                        isShowingDetailView = true
//                    }) {
//                        Image(systemName: "arrow.right.circle")
//                            .foregroundColor(.blue)
//                    }
                }
                
                TabView {
                    ForEach(0..<5) { index in
                        Image("photo\(index + 1)")
                            .resizable()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .padding()
                .frame(width: 300, height: 300)

                
                Text("Amenities")
                    .font(.title)
                    .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                
                HStack {
                    Text("Parking")
                        .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                    
                    Spacer()
                    
                    Text("Food")
                        .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                    
                    Spacer()
                    
                    Text("Decor")
                        .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
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
                        .background(Color(red: 82/225, green: 72/255, blue: 159/255))
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("Vendor Details", displayMode: .inline)
            .padding()
        }
        .background(Color(red: 250/225, green: 244/255, blue: 250/255))

    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
