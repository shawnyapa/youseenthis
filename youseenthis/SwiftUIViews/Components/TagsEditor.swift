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
                if newTag.isEmpty {
                    Button(action: {
                        // Do Nothing
                    }, label: {
                        HStack {
                            Text("+")
                            Image(systemName: SystemImage.tag.rawValue)
                        }
                    .padding(6)
                    })
                    .foregroundColor(SystemColors.dankyAccentColor)
                    .buttonStyle(.automatic)
                } else {
                    Button(action: {
                        addNewTag(newTag: $newTag)
                    }, label: {
                        HStack {
                            Text("+")
                            Image(systemName: SystemImage.tag.rawValue)
                        }
                        .padding(6)
                    })
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 6).foregroundColor(SystemColors.activeTagFill))
                }
                TextField(ViewStrings.newTag, text: $newTag)
                    .background(.background)
                    .padding()
                    .frame(maxWidth:250)
                Spacer()
            }
            Group {
                WrappingHStack(id: \.self, horizontalSpacing: 10, verticalSpacing: 6) {
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
                        .buttonStyle(.borderless)
                    }
                }
            }
        }
    }
    
    func addNewTag(newTag: Binding<String>) {
        let cleanedTag = newTag.wrappedValue.removeSpecialCharactersAndBlankSpaces()
        if !cleanedTag.isEmpty, !tags.contains(cleanedTag) {
            DispatchQueue.main.async {
                tags.append(cleanedTag)
            }
        }
        newTag.wrappedValue = ""
    }
    
    func deleteTag(tag: String) {
        DispatchQueue.main.async {
            tags = tags.filter { $0 != tag }
        }
    }
}

struct TagsEditor_Previews: PreviewProvider {
    static var previews: some View {
        let tags = ["SciFi", "StarWars", "Detective", "Detective", "ExtraTag"]
        TagsEditor(tags: .constant(tags))
    }
}
