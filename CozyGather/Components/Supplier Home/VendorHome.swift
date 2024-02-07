import SwiftUI

struct VendorHomeBox: View {
    var title: String
    var description: String
    var imageName: String
    @Binding var isOverviewButtonPressed: Bool
    @Binding var percentage: Double

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue) // Customize the title color

                Spacer()

                Image(systemName: imageName) // Replace with your own image from assets
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue) // Customize the image color
            }
            .padding()

            Text(description)
                .padding()

            Slider(value: $percentage, in: 0...100, step: 1)
                .padding()
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding()
    }
}

struct vNotificationView: View {
    @Binding var isNotificationViewPresented: Bool
    var body: some View {
        NavigationView {
            Form {
                Text("Notification").font(.title)
                Text("Notification").font(.title)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Notification", displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        withAnimation {
                            isNotificationViewPresented.toggle()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use stack style for iPhone
    }
}

struct vMenuView: View {
    @Binding var isMenuExpanded: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Menu").font(.title)) {
                    NavigationLink(destination: Text("Profile")) {
                        Label("Profile", systemImage: "person.circle")
                    }
                    NavigationLink(destination: Text("Notification")) {
                        Label("Notification", systemImage: "bell")
                    }
                    NavigationLink(destination: Text("Payments")) {
                        Label("Payments", systemImage: "creditcard")
                    }
                    NavigationLink(destination: Text("Linked Accounts")) {
                        Label("Linked Accounts", systemImage: "link")
                    }
                }

                Section(header: Text("Settings").font(.title)) {
                    NavigationLink(destination: Text("Privacy Policy")) {
                        Label("Privacy Policy", systemImage: "shield")
                    }
                    NavigationLink(destination: Text("Report")) {
                        Label("Report", systemImage: "flag")
                    }
                    NavigationLink(destination: Text("Settings")) {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Menu", displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        withAnimation {
                            isMenuExpanded.toggle()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                    }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use stack style for iPhone
    }
}

struct VendorHomePage: View {
    @State private var isOverviewButtonPressed = false
    @State private var percentage: Double = 50 // Adjust the default percentage as needed
    @State private var isMenuExpanded = false
    @State private var isNotificationViewPresented = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                isMenuExpanded.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .padding(.leading, 16)
                                .foregroundColor(.blue)
                        }

                        Spacer()

                        Text("Vendor Home Page")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()

                        Spacer()

                        Button(action: {
                            withAnimation {
                                isNotificationViewPresented.toggle()
                            }
                        }) {
                            Image(systemName: "bell")
                                .imageScale(.large)
                                .padding(.trailing, 16)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.top, 10)
                    Divider()
                        VendorHomeBox(
                            title: "Order Management",
                            description: "Here you can manage the orders",
                            imageName: "venrd1",
                            isOverviewButtonPressed: $isOverviewButtonPressed,
                            percentage: $percentage
                        )
                        Divider()
                        VStack{
                            HStack{
                                VendorHomeBox(
                                    title: "Products",
                                    description: "Description",
                                    imageName: "venrd1",
                                    isOverviewButtonPressed: $isOverviewButtonPressed,
                                    percentage: $percentage
                                )
                                Spacer()
                                VendorHomeBox(
                                    title: "Inbox",
                                    description: "Description",
                                    imageName: "venrd1",
                                    isOverviewButtonPressed: $isOverviewButtonPressed,
                                    percentage: $percentage
                                )
                                
                                Spacer()
                            }
                        }
                    }
                .overlay(
                    VendorToolbar()
                        .position(CGPoint(x: 190.0, y: 750.0))
                )
                }
            }
        .navigationBarHidden(true)
                    .padding(.horizontal, 16)
                    .overlay(
                        vMenuView(isMenuExpanded: $isMenuExpanded)
                            .frame(width: isMenuExpanded ? UIScreen.main.bounds.width : 0)
                            .background(Color.white)
                            .offset(x: isMenuExpanded ? 0 : -UIScreen.main.bounds.width)
                    )
                    .overlay(
                        vNotificationView(isNotificationViewPresented: $isNotificationViewPresented)
                            .frame(width: isNotificationViewPresented ? UIScreen.main.bounds.width : 0)
                            .background(Color.white)
                            .offset(x: isNotificationViewPresented ? 0 : UIScreen.main.bounds.width)
                    )
                }
            }
        

        struct VendorHomePage_Previews: PreviewProvider {
            static var previews: some View {
                VendorHomePage()
            }
        }
