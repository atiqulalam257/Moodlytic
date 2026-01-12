//
//  JournalListView.swift
//  Moodlytic
//
//  Created by Atiq Alam on 11/01/26.
//


import SwiftUI

struct JournalListView: View {

    @StateObject private var vm = JournalListViewModel()

    var body: some View {
        VStack(spacing: 16) {

            Text("Journal History")
                .font(AppFont.h1())

            if vm.isLoading {
                ProgressView()
            } else if vm.entries.isEmpty {
                Text("No entries yet")
                    .foregroundColor(AppColors.textSecondary)
            } else {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(vm.entries) { entry in
                            JournalRow(entry: entry)
                        }
                    }
                }
            }
        }
        .padding()
        .appBackground()
        .task {
            await vm.load()
        }
    }
}
