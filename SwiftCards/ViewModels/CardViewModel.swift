//
//  CardViewModel.swift
//  SwiftCards
//
//  Created by Ibragim Akaev on 08/08/2021.
//

import Combine

final class CardViewModel: ObservableObject, Identifiable {
    
    @Published var swiftCard: SwiftCard
    private let cardRepository = CardRepository()
    private var cancellables: Set<AnyCancellable> = []
    var id = ""
    
    init(swiftCard: SwiftCard) {
        self.swiftCard = swiftCard
        $swiftCard
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
