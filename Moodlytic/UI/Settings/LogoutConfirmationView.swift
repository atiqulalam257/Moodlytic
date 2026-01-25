//
//  LogoutConfirmationView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 25/01/26.
//


import SwiftUI

struct LogoutConfirmationView: View {

    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {

            Text(StringHelper.logout.localized)
                .font(.title2)
                .fontWeight(.semibold)

            Text(StringHelper.logout_confirmation_message.localized)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            HStack(spacing: 12) {

                Button {
                    dismiss()
                } label: {
                    Text(StringHelper.cancel.localized)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }

                Button {
                    appState.isLoggedIn = false
                    dismiss()
                } label: {
                    Text(StringHelper.logout.localized)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}
