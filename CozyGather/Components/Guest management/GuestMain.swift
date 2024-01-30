import SwiftUI

struct GuestMain: View {
    @State private var selectedTab: EventsTab = .upcoming
    
    enum EventsTab {
        case upcoming, past, cancelled
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    // Add action for the back button
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .position(CGPoint(x: 30.0, y: 40.0))

                Label("Guests", systemImage: "")
                    .font(Font.custom("AirbnbCereal_W_Md", size: 24))
                    .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
                    .position(CGPoint(x: 10.0, y: 40.0))
            }
            .background(Color.white)
            .navigationBarHidden(true)

            HStack(spacing: 20) {
                CustomButton1(title: "All", isSelected: selectedTab == .upcoming) {
                    selectedTab = .upcoming
                }
                .frame(width: 120)

                CustomButton1(title: "Accepted", isSelected: selectedTab == .past) {
                    selectedTab = .past
                }
                .frame(width: 120)

                CustomButton1(title: "Declined", isSelected: selectedTab == .cancelled) {
                    selectedTab = .cancelled
                }
                .frame(width: 120)
                
            }
            .padding(.top, 20)
            .padding(.horizontal)
            .position(CGPoint(x: 190, y: -100))
            

            VStack(spacing: 20) {
                CustomManageBox(imageName: "venrd1", date: "24 jan 2024", description: "hi", hyperlinkText: "view details")
                CustomManageBox(imageName: "venrd1", date: "24 jan 2024", description: "hi", hyperlinkText: "view details")
            }
            .padding()
            .background(Color.white)
            .padding(.top, 0)
            .frame(maxWidth: .infinity)
            .position(CGPoint(x: 190.0, y: -150.0))

            Spacer() // Add spacer to push content to the top

            Toolbar()
        }
        .edgesIgnoringSafeArea(.bottom) // Allow content to extend below safe area
    }
}


struct CustomButton1: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(isSelected ? .white : .black)
                .padding()
                .background(isSelected ? Color.blue : Color.white)
                .cornerRadius(8)
        }
    }
}


struct GuestMain_Previews: PreviewProvider {
    static var previews: some View {
        GuestMain()
    }
}
