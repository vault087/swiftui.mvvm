import SwiftUI



struct CellDetailView: View {
    @ObservedObject var viewModel: CellDetailViewModel
    @State var detailsCounter = Counter()
    var body: some View {
        Text("CellDetailView: \(detailsCounter.getCounter())")
            .onTapGesture(count: 1, perform: {
            viewModel.tap()
        })
    }

}

class CellDetailViewModel: ObservableObject {
    var id: UUID
    private var store: CarStore
    
    deinit {
        print("CellDetailViewModel deinit")
    }
    
    func tap() {
        objectWillChange.send()
    }
    
    init(id: UUID, store: CarStore) {
        print("CellDetailViewModel init")
         self.id = id
        self.store = store
    }
}

