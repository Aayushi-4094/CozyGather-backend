
import SwiftUI
struct messagelist: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    // Add action for the back button
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.blue)
                        .position(CGPoint(x: 40.0, y: -200.0))
                }
                Spacer()
                Text("Messages")
                    .font(.title)
                    .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
                    .padding(.bottom, 20)
                    .position(CGPoint(x: 0.0, y: -190.0))
                Spacer()
                Button(action: {
                    // Add action for the bell button
                }) {
                    Image(systemName: "bell")
                        .font(.title)
                        .foregroundColor(.blue)
                        .position(CGPoint(x: 100.0, y: -200.0))
                }
            }
            .padding()
            .background(Color.white)
            .padding(.top , -120)
            .frame(width: 450, height: 10)// Push everything down by adding top padding
            

            messageboxsample(imageName: "noti2", name:"Notty1", date: "Jan 25", description: "Hi", timeButtonText: "2")
                .padding()
                .position(CGPoint(x: 210.0, y: -250.0))
                .frame(width: 430, height: 10)

            
            messageboxsample(imageName: "noti1", name:"Notty2" , date: "Feb 2", description: "Hello", timeButtonText: "5")
                .padding()
                .position(CGPoint(x: 210.0, y: -180.0))
                .frame(width: 430, height: 10)

        }
        .padding(.horizontal)
        .background(Color.white)
        .navigationBarHidden(true)
         // This line looks suspicious, you might want to review it

        // Hide the navigation bar
        .overlay(
            VendorToolbar()
                .position(CGPoint(x: 235.0, y: 415.0))
        )
    }
}
struct messageboxsample: View {
    var imageName: String
    var name: String
    var date: String
    var description: String
    var timeButtonText: String
    var body: some View {
        HStack {
            HStack{
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .position(CGPoint(x: 70.0, y: 10.0))
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(description)
                        .foregroundColor(.gray)
                }.position(CGPoint(x: 10.0, y: 10.0))
                
                
            }
            VStack{
                Text(date)
                Text(timeButtonText)
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
            Spacer()
        }
    }
    
    }
struct messagelist_preview: PreviewProvider {
    static var previews: some View {
        messagelist()
    }
}





