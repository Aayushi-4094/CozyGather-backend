import SwiftUI

struct View1: View {
    
    @State private var isShowingDetailView = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Top Section
                Image("venrd1")
                    .resizable()
                    .frame(width: 390, height: 260)
                
                // Name, Share, and Bookmark Section
                HStack {
                    Text("Vendor Name")
                        .font(.title)
                        .foregroundColor(.black)
                
                    Spacer()
                    
                    Button(action: {
                        // Handle Share action
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        // Handle Bookmark action
                    }) {
                        Image(systemName: "bookmark")
                            .foregroundColor(.blue)
                    }
                }
                
                HStack {
                    Text("⭐️⭐️⭐️⭐️")
                        .font(.title)
                        .foregroundColor(.yellow)
                    
                    Spacer()
                    
                    Text("Srating from")
                        .foregroundColor(.black)
                }
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    
                    Text("Directions")
                    Spacer()

                    Text("$1200")
                        .font(.title)
                        .foregroundColor(.black)
                }
                VStack{
                    
                    Text("Address")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    
                    Text("Hours")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    
                    Text("Phone")
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }.position(CGPoint(x: 100.0, y: 40.0))
                

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
                    .sheet(isPresented: $isShowingDetailView) {
                        ViewVendr1()
                    }
                    .padding()
                }

                // Image Slide View
                TabView {
                    ForEach(0..<5) { index in
                        Image("photo\(index + 1)") // Assuming you have images named photo1, photo2, etc.
                            .resizable()
                            .scaledToFill()
                         //   .frame(width: 300 ,height: 300)
                            .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .padding()
                .frame(width: 300, height: 500)

                // ... (Remaining code)

                // Title: Available Cakes
                Text("Available Cakes")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                // Horizontal Icons for Bakery Products
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
                    
                    Text(" Food")
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(" Food")
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
