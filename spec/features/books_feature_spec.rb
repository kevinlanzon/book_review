require 'rails_helper'

feature "Books" do

  context "no books have been added" do
    scenario "should display a message 'No books yet'" do
      when_the_user_visits_the_homepage
      then_they_should_see_the_message_no_books_yet
      and_they_should_see_a_link_to_add_a_book
    end
  end

  context "books have been added" do
    before do
      Book.create(title: 'Learn Ruby on Rails')
    end

    scenario "should display a book" do
      when_the_user_visits_the_homepage
      then_they_should_see_a_book
    end
  end

  context "creating books" do
    scenario "prompts user to fill out a form, then displays the new book" do
      when_the_user_visits_the_homepage
      and_they_create_a_new_book
      then_they_should_see_a_book
    end
  end

  def when_the_user_visits_the_homepage
    visit root_path
  end

  def then_they_should_see_the_message_no_books_yet
    expect(page).to have_content "No books yet"
  end

  def and_they_should_see_a_link_to_add_a_book
    expect(page).to have_link "Add a book"
  end

  def then_they_should_see_a_book
    expect(page).to have_content "Learn Ruby on Rails"
    expect(page).not_to have_content "No books yet"
    expect(current_path).to eq '/'
  end

  def and_they_create_a_new_book
    click_link "Add a book"
    expect(current_path).to eq '/books/new'
    fill_in "Book Title", with: "Learn Ruby on Rails"
    fill_in "Description", with: "Learn Ruby on Rails"
    fill_in "Author", with: "Kevin Lanzon"
    click_button "Create Book"
  end
end
