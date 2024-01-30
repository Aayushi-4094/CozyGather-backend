import SwiftUI

struct VendorList: View {
    @State private var searchText: String = ""
    @State private var isFilterScreenPresented = false

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

                    Text("Vendors")
                        .font(.title)
                        .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
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
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    }


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
                        .frame(width: 100, height: 60)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .padding(.horizontal, 16)
                    }
                    .sheet(isPresented: $isFilterScreenPresented) {
                        FilterScreen()
                    }
                }
                .padding(.horizontal, 16)

                // Vendor List
                ScrollView {
                    VStack(spacing: 8) {
                        VendorListCustomBox(
                            imageName: "vendr1",
                            title: "Product Title",
                            description: "Product description goes here.",
                            numberOfStars: 5,
                            price: "$19.99",
                            hyperlinkText: "Details"
                        )

                        VendorListCustomBox(
                            imageName: "vendr1",
                            title: "Product Title",
                            description: "Product description goes here.",
                            numberOfStars: 5,
                            price: "$19.99",
                            hyperlinkText: "Details"
                        )

                        VendorListCustomBox(
                            imageName: "vendr1",
                            title: "Product Title",
                            description: "Product description goes here.",
                            numberOfStars: 5,
                            price: "$19.99",
                            hyperlinkText: "Details"
                        )

                        VendorListCustomBox(
                            imageName: "vendr1",
                            title: "Product Title",
                            description: "Product description goes here.",
                            numberOfStars: 5,
                            price: "$19.99",
                            hyperlinkText: "Details"
                        )
                    }
                    .padding(.horizontal, 16)
                }
                .background(Color.gray.opacity(0.1)) // Set a background color to demonstrate separation
            }

            // Toolbar at the bottom
            VStack {
                Spacer() // Push the toolbar to the bottom
                Toolbar()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
            }
        }
    }
}

struct VendorList_Previews: PreviewProvider {
    static var previews: some View {
        VendorList()
    }
}
