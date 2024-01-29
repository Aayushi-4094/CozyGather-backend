import SwiftUI

struct UserHomeView: View {
    @State private var isSeeAllPresented = false
    let myEventsImages = ["img2", "img2", "img2"]
    let upcomingEventsImages = ["img2", "img2", "img2"]

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "line.3.horizontal")
                    .imageScale(.large)
                    .padding(.leading, 16)
                    .foregroundColor(.blue)
                
                Spacer()
                
                Image(systemName: "bell")
                    .imageScale(.large)
                    .padding(.trailing, 16)
                    .foregroundColor(.blue)
            }
            .padding(.top, 10)
            
            Text("Hi Aayushi!!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading, 16)
            
            Spacer().frame(height: 16)
            
            HStack {
                Text("My Events")
                    .font(.system(size: 30, weight: .bold, design: .default)) // Adjust the size as needed
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
                    SeeAllView(images: myEventsImages)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(myEventsImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 250)
                            .cornerRadius(12)
                            .padding(8)
                    }
                }
            }
            
            HStack {
                Text("Upcoming Events")
                    .font(.system(size: 30, weight: .bold, design: .default)) // Adjust the size as needed
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
                    SeeAllView(images: upcomingEventsImages)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(upcomingEventsImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 250)
                            .cornerRadius(12)
                            .padding(8)
                    }
                }
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .padding(.horizontal, 16)
    }
}

struct SeeAllView: View {
    var images: [String]

    var body: some View {
        NavigationView {
            GridView(images: images)
                .navigationBarTitle("See All", displayMode: .inline)
        }
    }
}

struct GridView: View {
    var images: [String]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 100)
                        .cornerRadius(12)
                }
            }
            .padding(16)
        }
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
