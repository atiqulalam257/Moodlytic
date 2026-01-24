import SwiftUI
import Combine

@MainActor
final class AuthViewModel: ObservableObject {

    // MARK: - UI State
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var gender: Gender = .male

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    @Published var showSuccess: Bool = false

    // MARK: - UseCases
    private let loginUseCase: LoginUseCase
    private let registerUseCase: RegisterUseCase
    private let resetPasswordUseCase: ResetPasswordUseCase

    // MARK: - Init
    init(
        loginUseCase: LoginUseCase = AppContainer.shared.loginUseCase,
        registerUseCase: RegisterUseCase = AppContainer.shared.registerUseCase,
        resetPasswordUseCase: ResetPasswordUseCase = AppContainer.shared.resetPasswordUseCase
    ) {
        self.loginUseCase = loginUseCase
        self.registerUseCase = registerUseCase
        self.resetPasswordUseCase = resetPasswordUseCase
    }

    // MARK: - Actions
    func login() async {
        await perform {
            try await loginUseCase.execute(
                email: email,
                password: password
            )
            isLoggedIn = true
        }
    }

    func register() async {
        await perform {
            try await registerUseCase.execute(
                email: email,
                password: password,
                gender: gender
            )
            showSuccess = true
        }
    }

    func resetPassword() async {
        await perform {
            try await resetPasswordUseCase.execute(email: email)
            showSuccess = true
        }
    }

    // MARK: - Helper
    private func perform(_ action: () async throws -> Void) async {
        isLoading = true
        errorMessage = nil

        do {
            try await action()
        } catch let error as AppError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = AppError.unknown.errorDescription
        }

        isLoading = false
    }
}
