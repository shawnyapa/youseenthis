//
//  TagsEditor.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/30/22.
//

import SwiftUI
import WrappingStack

struct TagsEditor: View {
    @State var newTag: String = ""
    @Binding var tags: [String]
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    addNewTag(newTag: $newTag)
                }, label: { Text("+")
                            Image(systemName: SystemImage.tag.rawValue)
                })
                TextField(ViewStrings.newTag, text: $newTag)
                    .background(.background)
                    .padding()
                    .frame(maxWidth:250)
                Spacer()
            }
            Group {
                WrappingHStack(id: \.self) {
                    ForEach(tags, id: \.self) { tag in
                        Button(action: {
                            deleteTag(tag: tag)
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
    
    func addNewTag(newTag: Binding<String>) {
        let cleanedTag = newTag.wrappedValue.removeSpecialCharactersAndBlankSpaces()
        if !cleanedTag.isEmpty, !tags.contains(cleanedTag) {
            tags.append(newTag.wrappedValue)
        }
        newTag.wrappedValue = ""
    }
    
    func deleteTag(tag: String) {
        print(tag)
        tags = tags.filter { $0 != tag }
    }
}

struct TagsEditor_Previews: PreviewProvider {
    static var previews: some View {
        let tags = ["SciFi", "StarWars", "Detective", "Detective", "ExtraTag"]
        TagsEditor(tags: .constant(tags))
    }
}
