import SwiftUI

struct Events: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    // Add action for the back button
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.blue)
                }.position(CGPoint(x: 30.0, y: 40.0))

                

                Label("Events", systemImage: "")
                    .font(Font.custom("AirbnbCereal_W_Md", size: 24))
                    .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
                    .position(CGPoint(x: 10.0, y: 40.0))

                Spacer()
            }
            .background(Color.white)
            .navigationBarHidden(true)

            HStack(spacing: 20) {
                Button(action: {
                    // Add action for the "Upcoming" button
                }) {
                    Text("Upcoming")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Button(action: {
                    // Add action for the "Past" button
                }) {
                    Text("Past")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Button(action: {
                    // Add action for the "Cancelled" button
                }) {
                    Text("Cancelled")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal)
            .position(CGPoint(x: 200.0, y: -140.0))

            VStack(spacing: 20) {
                CustomManageBox(imageName: "venrd1", date: "24 jan 2024", description: "hi", hyperlinkText: "view details")


            }
            .padding()
            .background(Color.white)
            .padding(.top, 0)
            .frame(maxWidth: .infinity)
            .position(CGPoint(x: 190.0, y: -220.0))
            
        }
    }
}

struct Events_Preview: PreviewProvider {
    static var previews: some View {
        Events()
    }
}


