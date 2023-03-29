//
//  AddBookView.swift
//  BookWorm
//
//  Created by Danjuma Nasiru on 01/02/2023.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    var areFieldsValid : Bool{
        if title.trimmingCharacters(in: .whitespaces).isEmpty || author.trimmingCharacters(in: .whitespaces).isEmpty || genre.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }else{
            return true
        }
        
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title).disableAutocorrection(true)
                    TextField("Author's name", text: $author).disableAutocorrection(true)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    if areFieldsValid{
                        
                    }else{
                        Text("All fields must contain a value").listRowBackground(Color.clear).padding(0).foregroundColor(.red).font(.footnote)
                    }
                }
                

                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now

                        do{
                            try moc.save()
                        }catch{
                            print(error.localizedDescription)
                        }
                        
                        dismiss()
                    }.disabled(!areFieldsValid)
                }
            }
            .navigationTitle("Add Book")
        }

    }
    
    
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
