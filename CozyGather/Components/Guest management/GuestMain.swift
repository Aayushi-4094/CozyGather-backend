import SwiftUI

struct GuestMain: View {
    @State private var selectedTab: EventsTab = .upcoming
    @State private var isAddGuestAvailable = false
    @State private var selectedSegment = 0
    
    
    enum EventsTab {
        case upcoming, past, cancelled
    }

    var body: some View {
        VStack{
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
            AddGuest()
            }
            Picker(selection: $selectedSegment, label: Text("")) {
                Text("All").tag(0)
                Text("Accepted").tag(1)
                Text("Rejected").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            List {
                guestbox(imageName: "noti1", name: "Aarushi",phoneNo: "+91 xxxxxxxxxx",email: "xxxx@gmail.com")
                guestbox(imageName: "noti1", name: "Aarushi",phoneNo: "+91 xxxxxxxxxx",email: "xxxx@gmail.com")
                guestbox(imageName: "noti1", name: "Aarushi",phoneNo: "+91 xxxxxxxxxx",email: "yyyy@gmail.com")
            }
            Toolbar()
        }
        .edgesIgnoringSafeArea(.bottom) // Allow content to extend below safe area
    }
}
//struct CustomButton1: View {
//    var title: String
//    var isSelected: Bool
//    var action: () -> Void
//    var body: some View {
//        Button(action: action) {
//            Text(title)
//                .foregroundColor(isSelected ? .white : .black)
//                .padding()
//                .background(isSelected ? Color.blue : Color.white)
//                .cornerRadius(8)
//        }
//    }
//}

struct guestbox: View {
    var imageName: String
    var name: String
    var phoneNo: String
    var email: String
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(.black)

                Text(phoneNo)
                    .foregroundColor(.black)
                Text(email)
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}
struct GuestMain_Previews: PreviewProvider {
    static var previews: some View {
        GuestMain()
    }
}
