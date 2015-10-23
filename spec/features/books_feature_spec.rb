require 'rails_helper'

feature "books" do
  context "no books have been added" do
    scenario "should display a message" do
      visit "/"
      expect(page).to have_content "No books yet"
      expect(page).to have_link "Add a book"
    end
  end

  context "books have been added" do
    before do
      Book.create(title: 'Learn Ruby on Rails')
    end

    scenario "should display a book" do
      visit "/"
      expect(page).to have_content "Learn Ruby on Rails"
      expect(page).not_to have_content "No books yet"
    end
  end

 context "creating books" do
    scenario "prompts user to fill out a form, then displays the new book" do
      visit "/"
      click_link "Add a book"
      expect(current_path).to eq '/books/new'
      fill_in "Book Title", with: "Learn Ruby on Rails"
      fill_in "Description", with: "Learn Ruby on Rails"
      fill_in "Author", with: "Kevin Lanzon"
      click_button "Create Book"
      expect(page).to have_content "Learn Ruby on Rails"
      expect(current_path).to eq '/'
    end
  end
end
