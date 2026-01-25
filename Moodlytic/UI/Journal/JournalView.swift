//
//  JournalView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 28/12/25.
//

import SwiftUI


import SwiftUI

struct JournalView: View {

    @StateObject var vm: JournalViewModel
    @FocusState private var isEditorFocused: Bool

    init(vm: JournalViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }

    var body: some View {
        VStack(spacing: 20) {

            // Header
            Text(StringHelper.write_your_thoughts.localized)
                .font(AppFont.h1())
                .foregroundColor(AppColors.textPrimary)
            
            // ✅ Success Message
                if vm.isSuccess {
                    Text(StringHelper.journal_saved_success.localized)
                        .font(AppFont.caption())
                        .foregroundColor(AppColors.success)
                }

            // ❌ Error Message
                if let error = vm.errorMessage {
                    Text(error)
                        .font(AppFont.caption())
                        .foregroundColor(AppColors.danger)
                }

            // Journal text
            TextEditor(text: $vm.text)
                .focused($isEditorFocused)
                .padding()
                .frame(minHeight: 160)
                .background(AppColors.card)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(AppColors.divider, lineWidth: 1)
                )

            // Mood selector (NOW CONNECTED)
            MoodSelector(
                selectedMood: $vm.mood
            )

            // Submit button
            MButton(title: StringHelper.reflect.localized,
                    isLoading: vm.isLoading,
                    isDisabled: vm.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            ){
                Task { await vm.submit() }
            }
            
            Spacer()
        }
        .padding()
        .appBackground()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isEditorFocused = true
            }
        }
        .onDisappear {
           vm.reset()   // ✅ CLEARS DATA ON BACK PRESS
        }
    }
}

