import SwiftUI

struct EventData: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
    let frameColor: Color // Added property for frame color

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: EventData, rhs: EventData) -> Bool {
        return lhs.id == rhs.id
    }
}

struct NotificationView: View {
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

struct EventCard: View {
    @State private var isDetailViewPresented = false
    var event: EventData
    
    var body: some View {
        ZStack {
            VStack {
                Image(event.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 200, height: 200)
                    .cornerRadius(12)
                    //.padding(8)
                    .shadow(radius: 5) // Add shadow for a card-like appearance

                HStack {
                    Text(event.name)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.bottom, 4)
                        .padding(.leading, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()

                    Button(action: {
                        isDetailViewPresented.toggle()
                    }) {
                        Text("View Details")
                            .foregroundColor(.blue)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            //.background(Color.blue)
                            .cornerRadius(8)
                            .padding(.trailing, 8)
                    }
                    .sheet(isPresented: $isDetailViewPresented) {
                        EventDetailView(event: event)
                    }
                }
                .padding(.horizontal, 8)
                .frame(width: UIScreen.main.bounds.width - 32, alignment: .leading)
            }
            
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(event.frameColor, lineWidth: 2)
            )
        }
    }
}

struct EventDetailView: View {
    var event: EventData
    
    var body: some View {
        VStack {
            Text("Event Details")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .padding(8)
                .shadow(radius: 5) // Add shadow for a card-like appearance

            Text(event.name)
                .font(.headline)
                .padding(.bottom, 8)
            
            Capsule()
                .fill(Color.gray.opacity(1))
                .frame(height: 50)
                .overlay(
                    Text("Days : Hours : Minutes")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                )
                .padding(.horizontal, 40) // Add left and right padding

            // Add more details as needed
            
            Text("Co-Host")
                .font(.headline)
                .padding(.bottom, 8)
            Text("Date and time")
                .font(.headline)
                .padding(.bottom, 8)
            Text("Location")
                .font(.headline)
                .padding(.bottom, 8)
            Text("Description")
                .font(.headline)
                .padding(.bottom, 8)
            Text("Vendor assigned")
                .font(.headline)
                .padding(.bottom, 8)
            Text("Task")
                .font(.headline)
                .padding(.bottom, 8)

            Spacer()
        }
        .navigationBarTitle("Event Detail", displayMode: .inline)
    }
}

struct SeeAllView: View {
    var eventData: [EventData]

    var body: some View {
        NavigationView {
            GridView(eventData: eventData)
                .navigationBarTitle("See All", displayMode: .inline)
        }
    }
}

struct GridView: View {
    var eventData: [EventData]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 10) {
                ForEach(eventData, id: \.self) { event in
                    EventCard(event: event)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .center) // Adjust the frame size
        }
    }
}

struct MenuView: View {
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

struct UserHomeView: View {
    @State private var isSeeAllPresented = false
    @State private var isMenuExpanded = false
    @State private var isNotificationViewPresented = false
    let myEventsData = [
        EventData(name: "Birthday Bash", imageName: "img2", frameColor: .pink),
        EventData(name: "Summer Fiesta", imageName: "img2", frameColor: .orange),
        EventData(name: "Joyful Gathering", imageName: "img3", frameColor: .purple)
    ]

    let upcomingEventsData = [
        EventData(name: "Beach Party", imageName: "img4", frameColor: .blue),
        EventData(name: "Dance Night", imageName: "img5", frameColor: .green),
        EventData(name: "Sunset Soiree", imageName: "img6", frameColor: .yellow)
    ]

    var body: some View {
            NavigationView {
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            withAnimation {
                                isMenuExpanded.toggle()
                                isNotificationViewPresented = false // Close notification view when menu opens
                            }
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .padding(.leading, 16)
                                .foregroundColor(.blue)
                        }

                        Spacer()
                        Text("Hi Aayushi!!")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, 16)
                        Spacer()

                        Image(systemName: "bell")
                            .imageScale(.large)
                            .padding(.trailing, 16)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                isMenuExpanded = false // Close menu when notification icon is tapped
                                isNotificationViewPresented.toggle()
                            }
                    }
                    .padding(.top, 10)
                    Divider()

                HStack {
                    Text("My Events")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .fontWeight(.bold)
                        .padding(.leading, 16)

                    Spacer()

                    Button(action: {
                        isSeeAllPresented.toggle()
                    }) {
                        Text("See All")
                            .foregroundColor(.blue)
                            .padding(.trailing, 16)
                    }
                    .sheet(isPresented: $isSeeAllPresented) {
                        SeeAllView(eventData: myEventsData)
                    }
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(myEventsData, id: \.self) { event in
                            EventCard(event: event)
                        }
                    }
                }
                Divider()
                HStack {
                    Text("Upcoming Events")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .fontWeight(.bold)
                        .padding(.leading, 16)

                    Spacer()

                    Button(action: {
                        isSeeAllPresented.toggle()
                    }) {
                        Text("See All")
                            .foregroundColor(.blue)
                            .padding(.trailing, 16)
                    }
                    .sheet(isPresented: $isSeeAllPresented) {
                        SeeAllView(eventData: upcomingEventsData)
                    }
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(upcomingEventsData, id: \.self) { event in
                            EventCard(event: event)
                        }
                    }
                }

                Spacer()

                HStack {
                    Spacer()
                    Toolbar()
                        .background(Color.white)
                        .padding(.bottom, -35)
                }
            }
                .navigationBarHidden(true)
                            .padding(.horizontal, 16)
                            .overlay(
                                MenuView(isMenuExpanded: $isMenuExpanded)
                                    .frame(width: isMenuExpanded ? UIScreen.main.bounds.width : 0)
                                    .background(Color.white)
                                    .offset(x: isMenuExpanded ? 0 : -UIScreen.main.bounds.width)
                            )
                            .overlay(
                                NotificationView(isNotificationViewPresented: $isNotificationViewPresented)
                                    .frame(width: isNotificationViewPresented ? UIScreen.main.bounds.width : 0)
                                    .background(Color.white)
                                    .offset(x: isNotificationViewPresented ? 0 : UIScreen.main.bounds.width)
                            )
                        }
                    }
                }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
