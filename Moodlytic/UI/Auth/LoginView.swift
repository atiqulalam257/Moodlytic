import SwiftUI

struct LoginView: View {

    @StateObject private var vm = AuthViewModel()
    @EnvironmentObject private var appState: AppState

    var body: some View {
        VStack(spacing: 24) {

            Spacer()

            Text("Login")
                .font(AppFont.h1())

            // Email
            MTextField(
                title: "Email",
                placeholder: "Enter your email",
                text: $vm.email,
                fieldType: .email,
                error: vm.errorMessage == AppError.emptyEmail.errorDescription
                    ? vm.errorMessage
                    : nil
            )

            // Password
            MTextField(
                title: "Password",
                placeholder: "Enter your password",
                text: $vm.password,
                fieldType: .secure,
                error: vm.errorMessage == AppError.weakPassword.errorDescription
                    ? vm.errorMessage
                    : nil
            )

            // Backend / auth error
            if let error = vm.errorMessage,
               error == AppError.invalidCredentials.errorDescription {
                Text(error)
                    .font(AppFont.caption())
                    .foregroundColor(AppColors.danger)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            // Forgot password
            HStack {
                Spacer()
                NavigationLink("Forgot Password?") {
                    ForgotPasswordView()
                }
                .font(AppFont.caption())
            }

            // Login button
            MButton(title: "Login",
                    isLoading: vm.isLoading,
                    isDisabled: vm.isLoading
            ){
                Task {
                    await vm.login()
                        if vm.isLoggedIn {
                            appState.isLoggedIn = true
                        }
                }
            }
            
            Spacer()

            // Register
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(AppColors.textSecondary)

                NavigationLink("Sign Up") {
                    RegisterView()
                }
                .fontWeight(.semibold)
            }
        }
        .padding()
        .appBackground()
    }
}
