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



struct EventCard: View {
    @State private var isDetailViewPresented = false
    var event: EventData
    var randomBackgroundColor: Color {
        let colors: [Color] = [.purple, .mint, .orange, .indigo, .purple, .pink]
            return colors.randomElement() ?? .gray
        }
    
    var body: some View {
        ZStack {
            randomBackgroundColor
                            .cornerRadius(12)
            HStack{
                VStack {
                    
                    Text(event.name)
                        .foregroundColor(.black)
                        .font(.system(size:15 ))
                        .padding(.bottom,8)
                        .padding(.top,17)
                    
                    Image(event.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 250, height: 180)
                        .cornerRadius(12)
                        .shadow(radius: 5) // Add shadow for a card-like appearance
                    
                    Button(action: {
                        isDetailViewPresented.toggle()
                    }) {
                        Text("View Details")
                            .foregroundColor(.black)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                        //.background(Color.blue)
                            .cornerRadius(8)
                            .font(.system(size:13 ))
                        
                        
                    }
                    .sheet(isPresented: $isDetailViewPresented) {
                        EventDetailView(event: event)
                    }
                    
                }
                .padding(.horizontal,20)
                
                .frame(width: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(event.frameColor,lineWidth:2)
                    
                )
            }
            
                
            
//            .frame(width: 250)
//            .overlay(
//                RoundedRectangle(cornerRadius: 12)
//                    .stroke(event.frameColor, lineWidth: 2)
//            )
            
        }
    }
}

struct EventDetailView: View {
    var event: EventData
    @State private var isTaskLinkActive = false

    var body: some View {
        
        VStack {
            Text("Event Details")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text(event.name)
                .font(.headline)
                .padding(.bottom, 8)
            
            Image(event.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .padding(8)
                .shadow(radius: 5) // Add shadow for a card-like appearance
            
            // Add overlay for capsule
            ZStack(alignment: .bottom) {
                Capsule()
                    .fill(Color.gray.opacity(1))
                    .frame(height: 50)
                    .overlay(
                        Text("Days : Hours : Minutes")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    )
                    .padding(.horizontal, 40) // Add left and right padding
                    .offset(y: -240) // Move the capsule up to overlap the image
                
                VStack {
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
                    
                    // Link to the task file
                    Button(action: {
                        isTaskLinkActive = true
                    }) {
                        Text("Task")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.bottom, 8)
                    }
                    .sheet(isPresented: $isTaskLinkActive) {
                        // Replace "TaskView" with the view you want to navigate to for the task
                        taskview()
                    }
                }
            }

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
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 0) {
                ForEach(eventData, id: \.self) { event in
                    EventCard(event: event)
                        .padding(100)
                        .frame(width: 250,height: 250)
                    
                }
                .padding(20)
            }
            .padding(20)
             // Adjust the frame size
        }
    }
}

struct MenuView: View {
    @Binding var isMenuExpanded: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Menu").font(.title)) {
                    NavigationLink(destination: UserProfile()) { // Connect to UserProfile view
                        Label("Profile", systemImage: "person.circle")
                    }
                    NavigationLink(destination: NotificationView()) { // Connect to NotificationView view
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
    @State private var isAddEventPresented = false
    let myEventsData = [
        EventData(name: "Birthday Bash", imageName: "invite", frameColor: .pink),
        EventData(name: "Summer Fiesta", imageName: "invite", frameColor: .orange),
        EventData(name: "Joyful Gathering", imageName: "invite", frameColor: .purple)
    ]

    let upcomingEventsData = [
        EventData(name: "Beach Party", imageName: "invite", frameColor: .blue),
        EventData(name: "Dance Night", imageName: "invite", frameColor: .green),
        EventData(name: "Sunset Soiree", imageName: "invite", frameColor: .yellow)
    ]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        withAnimation {
                            isMenuExpanded.toggle()
                            isAddEventPresented = false // Close notification view when menu opens
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
                        .padding(.top, 40)
                    Spacer()

                    NavigationLink(destination: CreateEvent()) { // Use NavigationLink for navigation to CreateEvent view
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .padding(.trailing, 16)
                            .foregroundColor(.blue)
                    }
                    .navigationTitle("home")
                    .navigationBarTitle("", displayMode: .inline)
                }
                .navigationBarTitle("", displayMode: .inline)
                .padding(.top, 20)
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
                        .padding(.bottom, 55)
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
                                CreateEvent()
                                    .frame(width: isAddEventPresented ? UIScreen.main.bounds.width : 0)
                                    .background(Color.white)
                                    .offset(x: isAddEventPresented ? 0 : UIScreen.main.bounds.width)
                            )
                        }
                    }
                }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
