require 'rails_helper'

feature 'books' do
  context 'no books have been added' do
    scenario 'should display a link to add a book' do
      visit '/'
      expect(page).to have_content 'No books yet'
      expect(page).to have_link 'Add a book'
    end
  end
end
