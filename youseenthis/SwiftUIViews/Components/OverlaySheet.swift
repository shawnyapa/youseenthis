//
//  FilterSheet.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/23/22.
//

import SwiftUI

enum SheetMode: Int {
    case none
    case onequarter
    case half
    case threequarter
    case full
}

struct OverlaySheet<Content:View>: View {
    
    let content: () -> Content
    var sheetMode: Binding<SheetMode>
    
    init(sheetMode: Binding<SheetMode>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.sheetMode = sheetMode
    }
    
    private func calculateOffset() -> CGFloat {
        
        switch sheetMode.wrappedValue {
        case .none:
            return UIScreen.main.bounds.height
        case .onequarter:
            return UIScreen.main.bounds.height/4
        case .half:
            return UIScreen.main.bounds.height/2
        case .threequarter:
            return (UIScreen.main.bounds.height/4)*3
        case .full:
            return 0
        }
        
    }
    
    var body: some View {
        VStack {
            content()
                .offset(y: calculateOffset())
                .animation(.spring(), value: sheetMode.wrappedValue)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct OverlaySheet_Previews: PreviewProvider {
    static var previews: some View {
        OverlaySheet(sheetMode: .constant(.threequarter)) {
            VStack {
                Text("Filter Sheet across the screen")
            }
        }
    }
}
