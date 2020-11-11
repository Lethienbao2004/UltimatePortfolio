//
//  ItemRowView.swift
//  UltimatePortfolio
//
//  Created by Mark Le on 11/11/20.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var item: Item
    var body: some View {
        NavigationLink(item.itemTitle, destination: EditItemView(item: item))
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: Item.example)
    }
}
