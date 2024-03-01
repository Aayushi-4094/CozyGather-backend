import SwiftUI

struct VendorList: View {
    @State private var searchText: String = ""
    @State private var isFilterScreenPresented = false
    
    var vendors: [Vendor] = [ // Replace with your actual vendor data
        Vendor(id: UUID().uuidString, imageName: "vendor1", title: "Vendor 1", description: "Description for Vendor 1", numberOfStars: 4, price: "$12.99", hyperlinkText: "Details"),
        Vendor(id: UUID().uuidString, imageName: "Vendor2", title: "Vendor 2", description: "Description for Vendor 2", numberOfStars: 2, price: "$19.99", hyperlinkText: "Details"),
        Vendor(id: UUID().uuidString, imageName: "Vendor3", title: "Vendor 3", description: "Description for Vendor 3", numberOfStars: 4, price: "$12.99", hyperlinkText: "Details"),
        Vendor(id: UUID().uuidString, imageName: "Vendor4", title: "Vendor 4", description: "Description for Vendor 4", numberOfStars: 1, price: "$19.99", hyperlinkText: "Details"),
        // Add additional vendors here
    ]
    
    var body: some View {
        NavigationView {
            List {
                // Search & Filter section in a single HStack
                Section {
                    HStack(spacing: 16) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .padding(.horizontal, 8)
                            
                            TextField("Search", text: $searchText)
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .shadow(radius: 2)
                        }
                        .cornerRadius(20)
                        .background(Color.secondary.opacity(0.2))
                        .foregroundColor(.gray)
                        
                        Spacer() // Spacer to push the filter button to the right
                        
                        Button(action: {
                            isFilterScreenPresented.toggle()
                        }) {
                            Label("Filter", systemImage: "slider.horizontal.3")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color(red: 82/225, green: 72/255, blue: 159/255))
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $isFilterScreenPresented) {
                            FilterScreen() // Placeholder for your FilterScreen view
                        }
                    }
                    .frame(height: 44)
                }
                
                // Vendor List section
                ForEach(vendors) { vendor in
                    VendorListCustomBox1(vendor: vendor)
                        .padding(.vertical, 8)
                }
            }
            .listStyle(GroupedListStyle()) // Maintain grouped list style
            .navigationBarTitleDisplayMode(.inline) // Display title inline
            .navigationBarItems(
                leading: Text("Vendors").font(.title.bold())
            )
            
            // Add toolbar at the bottom
            .toolbar {
                Toolbar()
                    .position(CGPoint(x: 170.0, y: 755.0))
                    
            }
        }
    }
}

struct VendorListCustomBox1: View {
    var vendor: Vendor
    
    var body: some View {
        NavigationLink(destination: View1()) { // Replace View1() with your actual destination view
            VStack {
                HStack {
                    Image(vendor.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 160)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(vendor.title)
                            .font(.headline)
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                        Text(vendor.description)
                            .foregroundColor(.gray)
                        
                        HStack {
                            ForEach(0..<vendor.numberOfStars) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                                    .fixedSize()
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text(vendor.hyperlinkText)
                            .foregroundColor(Color(red: 82/225, green: 72/255, blue: 159/255))
                            .underline()
                        
                        Text(vendor.price)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 400, height: 100)
            }
        }
    }
}

struct Vendor: Identifiable {
    let id: String // Unique identifier for each vendor
    let imageName: String
    let title: String
    let description: String
    let numberOfStars: Int
    let price: String
    let hyperlinkText: String
}

struct VendorList_Previews: PreviewProvider {
    static var previews: some View {
        VendorList()
            .environment(\.colorScheme, .light) // Ensure light mode for preview
    }
}
