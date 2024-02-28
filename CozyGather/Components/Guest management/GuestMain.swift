import SwiftUI

struct GuestMain: View {
    @State private var selectedTab: EventsTab = .upcoming
    @State private var isAddGuestAvailable = false
    @State private var selectedSegment = 0

    enum EventsTab {
        case upcoming, past, cancelled
    }

    // Replace with your actual logic to fetch guests
    let guests: [GuestModel] = [
        GuestModel(id: UUID(), name: "Aarushi", phoneNo: "+91 xxxxxxxxxx", email: "xxxx@gmail.com", imageName: "noti1", isAccepted: true),
        GuestModel(id: UUID(), name: "Aarushi", phoneNo: "+91 xxxxxxxxxx", email: "xxxx@gmail.com", imageName: "noti1", isAccepted: false),
        GuestModel(id: UUID(), name: "Aarushi", phoneNo: "+91 xxxxxxxxxx", email: "yyyy@gmail.com", imageName: "noti1", isAccepted: true),
        GuestModel(id: UUID(), name: "Aarushi", phoneNo: "+91 xxxxxxxxxx", email: "xxxx@gmail.com", imageName: "noti1", isAccepted: true),
        GuestModel(id: UUID(), name: "Aarushi", phoneNo: "+91 xxxxxxxxxx", email: "xxxx@gmail.com", imageName: "noti1", isAccepted: false),
    ]

    var filteredGuests: [GuestModel] {
        switch selectedSegment {
        case 0:
            return guests // Show all guests for segment 0
        case 1:
            return guests.filter { $0.isAccepted } // Show accepted guests for segment 1
        case 2:
            return guests.filter { !$0.isAccepted } // Show rejected guests for segment 2
        default:
            return guests // Handle unexpected segment values (optional)
        }
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Guests")
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    isAddGuestAvailable.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
            .background(Color.white)
            .navigationBarHidden(true)
            .sheet(isPresented: $isAddGuestAvailable) {
                AddGuest() // Assuming AddGuest is defined elsewhere
            }

            Picker(selection: $selectedSegment, label: Text("")) {
                Text("All").tag(0)
                Text("Accepted").tag(1)
                Text("Rejected").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            List {
                ForEach(filteredGuests) { guest in
                    GuestBox(guest: guest)
                }
            }
            .listStyle(PlainListStyle()) // Remove separators for a cleaner look

            // Optional toolbar content (replace with your needs)
            // Toolbar()
        }
        .edgesIgnoringSafeArea(.bottom) // Allow content to extend below safe area
    }
}

struct GuestBox: View {
    let guest: GuestModel

    var body: some View {
        HStack {
            Image(guest.imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)

            VStack(alignment: .leading, spacing: 4) {
                Text(guest.name)
                    .font(.headline)
                    .foregroundColor(.black)

                Text(guest.phoneNo)
                    .foregroundColor(.black)
                Text(guest.email)
                    .foregroundColor(.black)
            }
            .padding()

            Spacer()

            // Add status indicator based on guest.isAccepted property
            if guest.isAccepted {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .font(.system(size: 20))
            } else {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
            }
        }
    }
}

struct GuestModel: Identifiable {
    let id: UUID
    let name: String
    let phoneNo: String
    let email: String
    let imageName: String
    let isAccepted: Bool // Replace with your logic to determine acceptance status
}

struct GuestMain_Previews: PreviewProvider {
    static var previews: some View {
        GuestMain()
    }
}
