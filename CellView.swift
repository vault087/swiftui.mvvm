import SwiftUI

public struct CellView: View {
    @ObservedObject var viewModel: CellViewModel
    
    init(viewModel: CellViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            CellHeaderView(viewModel: viewModel.headerViewModel())
            CellDetailView(viewModel: viewModel.detailsViewModel())
        }
    }

}

class CellViewModel: ObservableObject {
    var id: UUID!
    private var store: CarStore?
    
    deinit {
        print("CellViewModel deinit")
    }

    init(id: UUID, store: CarStore) {
        print("CellViewModel init")
         self.id = id
        self.store = store
    }

    func detailsViewModel() -> CellDetailViewModel {
        return CellDetailViewModel(id: id, store: store!)
    }
    
    func headerViewModel() -> CellHeaderViewModel {
        return CellHeaderViewModel(id: id, store: store!)
    }
}
