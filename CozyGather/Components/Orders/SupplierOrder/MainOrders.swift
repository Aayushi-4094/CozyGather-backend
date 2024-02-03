import SwiftUI

struct MainOrders: View {
    @State private var searchText: String = ""
    @State private var isFilterScreenPresented = false
    @State private var isViewDetailsActive = false

    var body: some View {
        ZStack {
            // Content
            VStack {
                // Header
                HStack {
                    Button(action: {
                        // Add action for when the back button is tapped
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .padding(.leading, 16)

                    Spacer()

                    Text("Orders")
                        .font(Font.custom("AirbnbCereal_W_Md", size: 24))
                        .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
                        .padding(.bottom, 20)

                    Spacer()

                    Button(action: {
                        // Add action for when the notifications button is tapped
                    }) {
                        Image(systemName: "bell")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 25 )
                    .padding(.top, -20)
                }
                

                // Search and Filter
                HStack {
                    // Search TextField
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                            .padding(.leading, 10)

                        TextField("Search", text: $searchText)
                            .padding()
                            
                    }
                    .padding(.leading, 16)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .frame(width: 250)


                    // Spacer to push Filter button to the right
                    Spacer()

                    // Filter Button
                    Button(action: {
                        isFilterScreenPresented.toggle()
                    }) {
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.white)
                            Text("Filter")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .frame(width: 100, height: 40)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .padding(.trailing, 16)
                    }
                    .sheet(isPresented: $isFilterScreenPresented) {
                        FilterScreen()
                    }
                }
                .padding()
                .frame(height: 80)

                // Order List
                ScrollView {
                    VStack(spacing: 8) {

                        CustomCard1(imageName: "order1", date: "January 25, 2024", description: "Description 1", hyperlinkText: "View Details")
                            .onTapGesture {
                                isViewDetailsActive = true
                            }
                        CustomCard1(imageName: "order1", date: "January 25, 2024", description: "Description 1", hyperlinkText: "View Details")
                            .onTapGesture {
                                isViewDetailsActive = true
                            }
                        CustomCard1(imageName: "order1", date: "January 25, 2024", description: "Description 1", hyperlinkText: "View Details")
                            .onTapGesture {
                                isViewDetailsActive = true
                            }



  



          
                    }
                    .padding(.horizontal, 16)
                }
                .background(Color.gray.opacity(0.1)) // Set a background color to demonstrate separation
                
                
                
            }

            VendorToolbar()
                .position(CGPoint(x: 200.0, y: 760.0))
        }
    }
}



struct CustomCard1: View {
    var imageName: String
    var date: String
    var description: String
    var hyperlinkText: String

    var body: some View {
        VStack{
            HStack {
                Image(imageName) // Use the custom image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(date)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(description)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                    
                }
                .padding()
                
                
                Spacer()
            }
            
            
            HStack{
                Spacer()
                Text(hyperlinkText)
                    .foregroundColor(.blue)
                    .underline()
                    .font(.system(size: 12))
                    .position(CGPoint(x: 310.0, y: -30.0))
            }
            
            
            
        }
    }
}

struct MainOrders_Previews: PreviewProvider {
    static var previews: some View {
        MainOrders()
    }
}

