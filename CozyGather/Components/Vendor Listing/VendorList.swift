import SwiftUI

struct VendorList: View {
    @State private var searchText: String = ""
    @State private var isFilterScreenPresented = false

    var body: some View {
        NavigationView {
            ZStack {
                // Content
                VStack {
                    // Header
                    HStack {
//                        Button(action: {
//                            // Add action for when the back button is tapped
//                        }) {
//                            Image(systemName: "chevron.left")
//                                .font(.title)
//                                .foregroundColor(.blue)
//                        }
//                        .padding(.leading, 16)

                        Spacer()

                        Text("Vendors")
                            .font(.title)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding()

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
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                        .frame(width: 230, height: 100)

                        // Spacer to push Filter button to the right

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
                            .frame(width: 100, height: 60)
                            .background(Color.blue)
                            .cornerRadius(20)
                            .padding(.horizontal, 16)
                        }
                        .sheet(isPresented: $isFilterScreenPresented) {
                            FilterScreen()
                        }
                    }

                    // Vendor List
                    ScrollView {
                        VStack(spacing: 0) {
                            
                                VendorListCustomBox1(
                                    imageName: "venrd1",
                                    title: "Product Title",
                                    description: "Product description goes here.",
                                    numberOfStars: 5,
                                    price: "$19.99",
                                    hyperlinkText: "Details"
                                )
                            

                            VendorListCustomBox1(
                                imageName: "venrd1",
                                title: "Product Title",
                                description: "Product description goes here.",
                                numberOfStars: 5,
                                price: "$19.99",
                                hyperlinkText: "Details"
                            )

                            VendorListCustomBox1(
                                imageName: "venrd1",
                                title: "Product Title",
                                description: "Product description goes here.",
                                numberOfStars: 5,
                                price: "$19.99",
                                hyperlinkText: "Details"
                            )

                            VendorListCustomBox1(
                                imageName: "venrd1",
                                title: "Product Title",
                                description: "Product description goes here.",
                                numberOfStars: 5,
                                price: "$19.99",
                                hyperlinkText: "Details"
                            )
                        }
                    }
                }

                // Toolbar at the bottom
                ZStack {
                    Spacer() // Push the toolbar to the bottom
                    Toolbar()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                        .position(x: 195, y: 750)
                }
            }
        }
    }
}

struct VendorListCustomBox1: View {
    var imageName: String
    var title: String
    var description: String
    var numberOfStars: Int
    var price: String
    var hyperlinkText: String

    var body: some View {
        NavigationLink(destination: View1()) {
            VStack {
                HStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 160)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.black)

                        Text(description)
                            .foregroundColor(.gray)

                        HStack {
                            ForEach(0..<numberOfStars) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 4) {
                        Text(hyperlinkText)
                            .foregroundColor(.blue)
                            .underline()

                        Text(price)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .position(CGPoint(x: 100.0, y: 40.0))
                }
                .frame(width: 400, height: 100)
            }
        }
    }
}






struct VendorList_Previews: PreviewProvider {
    static var previews: some View {
        VendorList()
            .environment(\.colorScheme, .light) // Ensure light mode for preview
    }
}

