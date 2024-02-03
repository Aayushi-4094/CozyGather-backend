// ThirdScreen.swift
import SwiftUI

struct ThirdScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose your Profile")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 120)

                Spacer()

                HStack//(spacing: 0)
                {
                    VStack {
                        NavigationLink(destination: SignUpPage()) { // Change destination to SignUpPage
                            Image("supplier_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 5)
                                .cornerRadius(10)
                        }

                        Text("Supplier")
                            .font(.title)
                            .padding(.top, 10)
                    }

                    Divider()

                    VStack {
                        NavigationLink(destination: SignUpPage()) { 
                            Image("user_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 5)
                                .cornerRadius(10)
                        }

                        Text("User")
                            .font(.title)
                            .padding(.top, 5)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)

                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
    }
}
