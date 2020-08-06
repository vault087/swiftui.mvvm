import SwiftUI


struct CellHeaderView: View {
  @ObservedObject var viewModel: CellHeaderViewModel

  init(viewModel: CellHeaderViewModel) {
    print("CellHeaderView init")
    self.viewModel = viewModel
  }
  
  var body: some View {
    Text("CellHeaderViewModel: \(viewModel.internalId), Store: \(viewModel.storeCounter)")
      .onTapGesture(count: 1, perform: {
        viewModel.tap()
      })
      .cornerRadius(8.0)
      .background(Color.blue.opacity(0.1))
      
  }
  
}
