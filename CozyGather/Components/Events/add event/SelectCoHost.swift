import SwiftUI

struct SelectCoHost: View {
    @State private var coHostName: String = ""
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            // Header
            HStack{
                Image(systemName: "arrow.left")
                    .font(.title)
                    .padding()
                
                Text("Select Co-Host")
                    .font(Font.custom("AirbnbCereal_W_Md", size: 24))
                    .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.15))
                    .padding(.bottom, 20)
                Spacer()
                Image(systemName: "multiply")
                    .font(.title)
                    .padding()
            }
            
            SearchBar(text: $searchText, placeholder: "Search Co-Host")

            
            HStack {
                Image(systemName: "message.fill")
                    .font(.title)
                    .padding()
                Spacer()
                Image(systemName: "square.and.arrow.up.fill")
                    .font(.title)
                    .padding()
                Spacer()
                Image(systemName: "envelope")
                    .font(.title)
                    .padding()
            }
            .foregroundColor(.blue)
            .padding()

            
            HStack{
                
                Text("Copy the link")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "doc.on.doc")
                    .font(.title)
                    .padding()
            }
            
            Button("Done") {
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()

            Spacer()
        }
        .padding()
    }
}

struct SelectCoHost_Previews: PreviewProvider {
    static var previews: some View {
        SelectCoHost()
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)

            TextField(placeholder, text: $text)
                .padding(.vertical, 8)
        }
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
        .padding(.horizontal)
    }
}
