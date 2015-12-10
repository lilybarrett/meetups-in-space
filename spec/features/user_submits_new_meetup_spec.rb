require "spec_helper"

feature "User submits new meetup" do

  scenario "user submits new meetup" do
    visit "/meetups"
    click_link "Create New Meetup"
    visit "/meetups/new"

    fill_in "Name", with: "Playing ping-pong in space"
    fill_in "Description", with: "For serious space ping-pong players only."
    fill_in "Location", with: "Mars"

    click_button "Create!"

    expect(page).to have_content "Playing ping-pong in space"
    expect(page).to have_content "You have successfully created a meetup!"
  end

  scenario "fails to add a meetup with valid information and stays on the same page" do
	    visit "/meetups/new"

	    click_button "Create!"

	    expect(page).to have_content "Please fill in all required fields"
	    expect(page).to have_content "Name"
	  end

end
