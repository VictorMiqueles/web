RSpec.describe 'Board features', type: :feature do
  context "with an empty board" do
    it 'Says we have no adverts on the board' do
      visit '/board'
      expect(page).to have_content "Your board has no adverts."
    end
  end

  it "Adds and lists adverts" do
    visit "/board"
    click_link "Add Advert"
    fill_in "Number", with: "07364843763"
    fill_in "Description", with: "Ginger cat"
    click_button "Post"
    expect(page).to have_content "07364843763"
    expect(page).to have_content "Ginger cat"
  end  

  it "Adds and lists multiple adverts" do
    visit "/board"
    click_link "Add Advert"
    fill_in "Number", with: "07364843763"
    fill_in "Description", with: "Ginger cat"
    click_button "Post"
    
    click_link "Add Advert"
    fill_in "Number", with: "07364843766"
    fill_in "Description", with: "Black cat"
    click_button "Post" 

    expect(page).to have_content "07364843763"
    expect(page).to have_content "Ginger cat"
    expect(page).to have_content "07364843766"
    expect(page).to have_content "Black cat"
  end

  it "deletes board adverts" do
    visit "/board"
    click_link "Add Advert"
    fill_in "Number", with: "07364843763"
    fill_in "Description", with: "Ginger cat"
    click_button "Post"
    
    click_link "Add Advert"
    fill_in "Number", with: "07364843766"
    fill_in "Description", with: "Black cat"
    click_button "Post" 
    
    click_link "Add Advert"
    fill_in "Number", with: "07364843769"
    fill_in "Description", with: "White cat"
    click_button "Post" 

    click_button "delete_1"

    expect(page).to have_content "07364843763"
    expect(page).to have_content "Ginger cat"
    expect(page).not_to have_content "07364843766"
    expect(page).not_to have_content "Black cat"
    expect(page).to have_content "07364843769"
    expect(page).to have_content "White cat"
  end
  
  it "update board adverts" do
    visit "/board"
    click_link "Add Advert"
    fill_in "Number", with: "07364843763"
    fill_in "Description", with: "Ginger cat"
    click_button "Post"
    
    click_link "Add Advert"
    fill_in "Number", with: "07364843766"
    fill_in "Description", with: "Black cat"
    click_button "Post" 
    
    click_link "Add Advert"
    fill_in "Number", with: "07364843769"
    fill_in "Description", with: "White cat"
    click_button "Post" 

    click_button "edit_1"

    fill_in "Number", with: "07364843799"
    fill_in "Description", with: "Big Black cat"
    click_button "Update"

    expect(page).to have_content "07364843763"
    expect(page).to have_content "Ginger cat"
    expect(page).not_to have_content "07364843766"
    expect(page).not_to have_content "Black cat"
    expect(page).to have_content "07364843799"
    expect(page).to have_content "Big Black cat"
    expect(page).to have_content "07364843769"
    expect(page).to have_content "White cat"
  end

end