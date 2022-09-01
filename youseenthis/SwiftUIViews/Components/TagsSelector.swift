//
//  TagsSelector.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI
import WrappingStack

struct TagsSelector: View {
    @State var searchString: String = ""
    @State var existingTags: [String]
    var filteredTags: [String] {
        if searchString.isEmpty {
            return existingTags
        }
        return existingTags.filter { $0.contains($searchString.wrappedValue)}
    }
    @Binding var selectedTags:[String]
    
    var body: some View {
        VStack {
            Group {
                WrappingHStack(id: \.self) {
                    ForEach(filteredTags, id: \.self) { tag in
                        Button(action: {
                            selectTag(tag: tag)
                        }) {
                            Label(tag, systemImage: SystemImage.create.rawValue)
                                .padding(5)
                                .foregroundColor(Color(UIColor.systemBackground))
                        }
                        .background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(SystemColors.deactiveTagFill))
                    }
                }
            }
            Divider()
            HStack {
                Image(systemName: SystemImage.search.rawValue)
                    .padding(10)
                TextField(ViewStrings.searchTags, text: $searchString)
                Spacer()
            }
            Divider()
            Group {
                WrappingHStack(id: \.self) {
                    ForEach(selectedTags, id: \.self) { tag in
                        Button(action: {
                            deselectTag(tag: tag)
                        }) {
                            Label(tag, systemImage: SystemImage.deleteX.rawValue)
                                .padding(5)
                                .foregroundColor(Color(UIColor.systemBackground))
                        }
                        .background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(SystemColors.activeTagFill))
                    }
                }
            }
        }
    }
    
    
    
    func selectTag(tag: String) {
        if !tag.isEmpty, !selectedTags.contains(tag) {
            selectedTags.append(tag)
            existingTags = existingTags.filter { $0 != tag }
        }
        if filteredTags.isEmpty {
            $searchString.wrappedValue = ""
        }
        
    }
    
    func deselectTag(tag: String) {
        if !tag.isEmpty {
            existingTags.append(tag)
            selectedTags = selectedTags.filter { $0 != tag }
        }
    }
}

struct TagsSelector_Previews: PreviewProvider {
    static var previews: some View {
        let existingTags = ExampleData.createRandomTags()
        TagsSelector(existingTags: existingTags, selectedTags: .constant([String]()))
    }
}
