import SwiftUI

struct LoginView: View {

    @StateObject private var vm = AuthViewModel()
    @EnvironmentObject private var appState: AppState

    var body: some View {
        VStack(spacing: 24) {

            Spacer()

            Text(text: Language.login)
                .font(AppFont.h1())

            // Email
            MTextField(
                title: Language.email.localized,
                placeholder: Language.enter_your_email.localized,
                text: $vm.email,
                fieldType: .email,
                error: vm.errorMessage == AppError.emptyEmail.errorDescription
                    ? vm.errorMessage
                    : nil
            )

            // Password
            MTextField(
                title: Language.password.localized,
                placeholder: Language.enter_your_password.localized,
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
                NavigationLink(Language.forgot_password.localized) {
                    ForgotPasswordView()
                }
                .font(AppFont.caption())
            }

            // Login button
            MButton(title: Language.login.localized,
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
                Text(Language.dont_have_an_account.localized)
                    .foregroundColor(AppColors.textSecondary)

                NavigationLink(Language.signup.localized) {
                    RegisterView()
                }
                .fontWeight(.semibold)
            }
        }
        .padding()
        .appBackground()
    }
}
