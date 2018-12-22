require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it 'can add a question to a specific topic' do
    stub_oauth_user

    visit '/'
    click_on 'Login with Google'

    user = User.last
    topic = create(:topic, user: user)

    visit '/topics'
    within(first(".topic")) do
      fill_in 'question[text]', with: 'What is a query'
      click_on 'Save'
    end

    expect(current_path).to eq('/topics')
    expect(page).to have_content('What is a query')
  end
end
