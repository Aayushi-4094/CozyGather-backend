// SecondScreen.swift
import SwiftUI

struct SecondScreen: View {
    @State private var goToThirdScreen = false

    var body: some View {
        NavigationView {
            VStack {
                Image("logo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.15)
                    .padding(.top, 20)

                Text("Where Simplified Planning Meets Stress-Free Celebrations")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)

                Spacer()

                Text("Choose your Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.top, 20)

                HStack {
                    VStack {
                        NavigationLink(destination: VendrSignUp()) {
                            Image("supplier_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.15)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }

                        Text("Supplier")
                            .font(.headline)
                            .padding(.top, 10)
                    }

                    Divider()

                    VStack {
                        NavigationLink(destination: SignUpPage()) {
                            Image("user_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.15)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }

                        Text("User")
                            .font(.headline)
                            .padding(.top, 5)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)

                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
