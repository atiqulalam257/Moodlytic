import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel
    @State private var navigateToJournal = false
    @State private var openJournalScreen: Bool = false

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 24) {

            Text(StringHelper.today.localized)
                .font(AppFont.h1())
                .foregroundColor(AppColors.textPrimary)

            Text(viewModel.todayDate)
                .font(AppFont.caption())
                .foregroundColor(AppColors.textSecondary)

            CardView {
                VStack(spacing: 16) {
                    Text(StringHelper.how_are_you_feeling.localized)
                        .font(AppFont.body())
                
                    // ✅ FIXED
                    MoodSelector(selectedMood: $viewModel.selectedMood)
                }
            }

            Button(StringHelper.write_todays_thoughts.localized) {
                navigateToJournal = true
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button(StringHelper.open_journal.localized) {
                openJournalScreen = true
            }
            .buttonStyle(PrimaryButtonStyle())

            Spacer()
        }
        .padding()
        .appBackground()
        .navigationDestination(isPresented: $navigateToJournal) {
            // ✅ FIXED
            JournalView(
                vm: JournalViewModel(
                    initialMood: viewModel.selectedMood
                )
            )
        }
        .navigationDestination(isPresented: $openJournalScreen) {
            JournalListView()
         }
    }
}
