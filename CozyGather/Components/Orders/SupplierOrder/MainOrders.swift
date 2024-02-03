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
                    .padding(.trailing, 16)
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
                    .padding(.leading, 16)

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

                // Order List
                ScrollView {
                    VStack(spacing: 8) {
                        NavigationLink(destination: ViewDetails(), isActive: $isViewDetailsActive) {
                            EmptyView()
                        }
                        CustomCard(imageName: "order1", date: "January 25, 2024", description: "Description 1", hyperlinkText: "View Details")
                            .onTapGesture {
                                isViewDetailsActive = true
                            }

                        CustomCard(imageName: "order2", date: "January 26, 2024", description: "Description 2", hyperlinkText: "View Details")
                            .onTapGesture {
                                isViewDetailsActive = true
                            }

                        CustomCard(imageName: "order3", date: "January 27, 2024", description: "Description 3", hyperlinkText: "View Details")
                            .onTapGesture {
                                isViewDetailsActive = true
                            }

                        CustomCard(imageName: "order4", date: "January 28, 2024", description: "Description 4", hyperlinkText: "View Details")
                            .onTapGesture {
                                isViewDetailsActive = true
                            }

                        VendorToolbar()
                    }
                    .padding(.horizontal, 16)
                }
                .background(Color.gray.opacity(0.1)) // Set a background color to demonstrate separation
            }

            // Toolbar at the bottom
           
        }
    }
}

struct MainOrders_Previews: PreviewProvider {
    static var previews: some View {
        MainOrders()
    }
}
