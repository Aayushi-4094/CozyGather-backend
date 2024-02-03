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

                Image(imageName) // Replace with your own image from assets
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

struct VendorHomePage: View {
    @State private var isOverviewButtonPressed = false
    @State private var percentage: Double = 50 // Adjust the default percentage as needed

    var body: some View {
    
        NavigationView {
            ScrollView{
                
                ZStack{
                    VStack {
                        HStack {Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .padding(.leading, 16)
                                .foregroundColor(.blue)
                            
                            Spacer()
                            Text("Vendor Home Page")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                            Image(systemName: "bell")
                                .imageScale(.large)
                                .padding(.trailing, 16)
                                .foregroundColor(.blue)
                        
                        .padding(.top, 10)
                            
                            
                        }
                        
                        //Button(action: {
                         //   isOverviewButtonPressed.toggle()
                        //}) {
                        //    Text("Overview")
                         //       .foregroundColor(.white)
                        //        .padding()
                         //       .background(isOverviewButtonPressed ? Color.purple : Color.gray)
                         //       .cornerRadius(20)
                       // }
                       // .padding()
                       // .padding(.top, 10) // Add padding to separate the button from the box
                        
                        // Use the VendorHomeBox structure
                        VendorHomeBox(
                            title: "Order Management",
                            description: "Here you can manage the orders",
                            imageName: "venrd1",
                            isOverviewButtonPressed: $isOverviewButtonPressed,
                            percentage: $percentage
                        )
                        
                        Spacer()
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
                    VendorToolbar().position(CGPoint(x: 200, y: 750))
                    
                }
              
                
              
                
            }
            
            .navigationBarHidden(true)
            //.background(VendorToolbar().frame(width: 500 ,height: 70))
            
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct VendorHomePage_Previews: PreviewProvider {
    static var previews: some View {
        VendorHomePage()
    }
}
