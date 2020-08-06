import SwiftUI

struct CellDetailView: View {
  @ObservedObject var viewModel: CellDetailViewModel

  init(viewModel: CellDetailViewModel) {
    print("CellDetailView init")
    self.viewModel = viewModel
  }
  
  var body: some View {
    Text("CellDetailViewModel: \(viewModel.internalId)")
      .onTapGesture(count: 1, perform: {
        viewModel.tap()
      })
  }
}
