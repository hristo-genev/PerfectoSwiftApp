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
            
    private let biometricIDAuth = BiometricIDAuth()
   
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
                    HStack {
                        
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
                        .accessibilityIdentifier("LoginScreen.loginBtn")
                        
                        Image(systemName: "faceid") 
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.leading, 5)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                print("Login with biometrics tapped!")
                                biometricIDAuth.canEvaluate { (canEvaluate, _, canEvaluateError) in
                                    guard canEvaluate else {
                                        return
                                    }
                                    
                                    biometricIDAuth.evaluate {/* [weak self]*/ (success, error) in
                                        guard success else {
                                            isLoggedIn = false
                                            return
                                        }
                                        
                                        isLoggedIn = true
                                    }
                                }
                            }
                            .accessibilityIdentifier("LoginScreen.loginWithBiometrics")
                        }
                    
                    Button("LoginScreen.Login.Guest".localized) {
                        print("Login as guess!")
                        isLoggedIn = true
                    }
                    .accessibilityIdentifier("LoginScreen.loginAsGuest")
                    .padding(.top, 10)
                    .font(.title3)

                    NavigationView {
                        NavigationLink(destination: AppInfoScreen()
                            .navigationBarHidden(true)
                        ) {
                            Text("Build Info")
                        }
                        .accessibilityIdentifier("openAppInfo")
                        .padding(.bottom, 5)
                    }
                }
                .padding(.top, 50.0)
                                
            }.padding(.top, 30.0)
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .padding(.top, 50)
        .padding(.bottom, 5)
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {

        LoginScreen(isLoggedIn: .constant(false)).environmentObject(LoginViewModel())
    }
}
