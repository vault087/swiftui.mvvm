import SwiftUI

public struct CellView: View {
  @EnvironmentObject var appState: AppState
  @ObservedObject var viewModel: CellViewModel
  
  init(viewModel: CellViewModel) {
    print("CellView init")
    self.viewModel = viewModel
  }
  
  public var body: some View {
    VStack(alignment: .leading) {
      Text("CellViewModel: \(viewModel.internalId)")
      CellHeaderView(viewModel: viewModel.headerViewModel(store: appState.carStore))
      CellDetailView(viewModel: viewModel.detailsViewModel(store: appState.carStore))
    }
  }
  
}

