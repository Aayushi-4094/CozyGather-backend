// SecondView.swift
import SwiftUI

struct SecondScreen: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ThirdScreen()) {
                VStack(spacing: 3) {
                    Image("logo1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/2)

                    Image("logo2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1/2)
                        .padding(.bottom, 10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
