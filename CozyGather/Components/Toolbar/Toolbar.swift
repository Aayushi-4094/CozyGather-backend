import SwiftUI

struct Toolbar: View {
    @State private var selectedTab: Tab = .home
    @State private var isHomeUserViewActive = false
    @State private var isCreateEventViewActive = false
    @State private var isCreateVendorList = false
    @State private var isBudgetApp = false


    
    var body: some View {
        HStack(spacing: 0) {
            
            VStack {
                            Image(systemName: selectedTab == .home ? "house.fill" : "house")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(selectedTab == .home ? Color.blue : Color.gray)
                            Text("Home")
                                .font(.system(size: 10, weight: .regular, design: .default))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(selectedTab == .home ? Color.blue : Color.gray)
                        }
                        .frame(width: 393 / 5, height: 83)
                        .onTapGesture {
                            selectedTab = .home
                            isHomeUserViewActive.toggle()
                        }
                        .fullScreenCover(isPresented: $isHomeUserViewActive) {
                            UserHomeView()
                        }
            
            VStack {
                Image(systemName: selectedTab == .events ? "calendar.badge.plus ": "calendar.badge.plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedTab == .events ? Color.blue : Color.gray)
                Text("Create Event")
                    .font(.system(size: 10, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(selectedTab == .events ? Color.blue : Color.gray)
            }
            .frame(width: 393 / 5, height: 83)
            .onTapGesture {
                selectedTab = .events
                isCreateEventViewActive.toggle()
            }
            .fullScreenCover(isPresented: $isCreateEventViewActive) {
                CreateEvent()
            }
            
            VStack {
                Image(systemName: selectedTab == .vendorListing ? "list.bullet.fill" : "list.bullet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedTab == .vendorListing ? Color.blue : Color.gray)
                Text("Vendor Listing")
                    .font(.system(size: 10, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(selectedTab == .vendorListing ? Color.blue : Color.gray)
            }
            .frame(width: 393 / 5, height: 83)
            .onTapGesture {
                selectedTab = .events
                isCreateVendorList.toggle()
            }
            .fullScreenCover(isPresented: $isCreateVendorList) {
                VendorList()
            }
            
            VStack {
                Image(systemName: selectedTab == .guests ? "person.2.fill" : "person.2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedTab == .guests ? Color.blue : Color.gray)
                Text("Guests")
                    .font(.system(size: 10, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(selectedTab == .guests ? Color.blue : Color.gray)
            }
            .frame(width: 393 / 5, height: 83)
            .onTapGesture {
                selectedTab = .guests
                // Add navigation or perform actions related to the Guests tab
            }
            
            VStack {
                Image(systemName: selectedTab == .budget ? "dollarsign.circle.fill" : "dollarsign.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedTab == .budget ? Color.blue : Color.gray)
                Text("Budget")
                    .font(.system(size: 10, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(selectedTab == .budget ? Color.blue : Color.gray)
            }
            .frame(width: 393 / 5, height: 83)
            .onTapGesture {
                selectedTab = .budget
                isBudgetApp.toggle()
            }
            .fullScreenCover(isPresented: $isBudgetApp) {
                BudgetApp()
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

enum Tab {
    case home, events, vendorListing, guests, budget
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar()
    }
}
