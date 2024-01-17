import SwiftUI
import MapKit

struct LoginScreen: View {
    
    @Binding var isLoggedIn: Bool
    @State private var loginErrorMessage: String = ""
    @EnvironmentObject var loginModel: LoginViewModel
    @State var isErrorHidden: Bool = true
//    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
//        center: LocationHelper.currentLocation,
//        span: MKCoordinateSpan(latitudeDelta: MapDefaultCoordinates.zoom, longitudeDelta: MapDefaultCoordinates.zoom))
            
    
    var body: some View {
        
        VStack {
            
            LogoView()
           
            VStack {
                    
                ErrorMessageText(
                    loginErrorMessage: $loginErrorMessage,
                    isErrorHidden: $isErrorHidden)
                
                UsernameTextField()
            
                PasswordFields()
                
                VStack {
                    Button(
                        action: {
                            Task {
                                await loginModel.login { result in
                                    switch result {
                                    case .success(true):
                                        isLoggedIn = true
                                        print("Successfully logged in")
//                                                print(loginModel.isLoggedIn)
                                    case .failure(let error):
                                        print("Failed loggin in: \(error)")
                                        loginErrorMessage = "LoginScreen.Failed".localized
                                    case .success(false):
                                        loginErrorMessage = "LoginScreen.Failed".localized
                                        print("Failed loggin in")
                                    }
                                }
                            }
                            
                        },
                        label: {
                            Text("LoginScreen.LoginButton.Title".localized)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .padding(.vertical, 7)
                                .padding(.horizontal, 40)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    )
                    .accessibilityIdentifier("LoginScreen.LoginBtn")
                    
                    Button("LoginScreen.With.Biometrics".localized) {
                        print("Login with biometrics tapped!")
                        loginModel.sensorAuthenticate { result in
                            switch result {
                            case .success(true):
                                print("Successfully logged in")
                                isErrorHidden = true
                            case .failure(let error):
                                print("Failed loggin in: \(error)")
                                loginErrorMessage = "LoginScreen.Failed".localized
                                isErrorHidden = false
                            case .success(false):
                                loginErrorMessage = "LoginScreen.Failed".localized
                                print("Failed loggin in")
                                isErrorHidden = false
                            }
                        }
                    }
                    .padding(.top, 30)
                    .font(.title3)
                    
                    Button("LoginScreen.Login.Guest".localized) {
                        print("Login as guess!")
                        isLoggedIn = true
                    }
                    .accessibilityIdentifier("LoginScreen.loginAsGuest")
                    .padding(.top, 10)
                    .font(.title3)
                    
                    Button("Settings") {
                        
                    }
                    .padding(.top, 10)
                    .font(.title3)

                }
                .padding(.top, 50.0)
            }.padding(.top, 30.0)
            
            
            AppInfoScreen()
            
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .padding(.top, 50)
        .padding(.bottom, 5)
//        .onAppear(perform: loginModel.clearForm)
    
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {

        LoginScreen(isLoggedIn: .constant(false)).environmentObject(LoginViewModel())
    }
}
