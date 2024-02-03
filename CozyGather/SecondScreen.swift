// SecondScreen.swift
import SwiftUI

struct SecondScreen: View {
    @State private var goToThirdScreen = false

    var body: some View {
        VStack//(spacing: 3)
        {
            Image("logo1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/5)

            //Spacer()
            
            Image("logo2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/4)
                .padding(.bottom, 10)
        }
        .onTapGesture {
            self.goToThirdScreen = true
        }
        .fullScreenCover(isPresented: $goToThirdScreen) {
            ThirdScreen()
        }
    }
}


struct SecondScreen_Previews: PreviewProvider{
    static var previews: some View{
        SecondScreen()
    }
}
