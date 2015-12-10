require "spec_helper"

feature "user views list of all meetups" do

  let!(:meetup) do
    Meetup.create(
      name: "Eating Doritos in space",
      description: "Self-explanatory",
      location: "Jupiter",
      creator: "Lily & Chelsea"
    )
  end

  scenario "each meetup name should be a link to that meetup's show page" do
    visit "/"
    click_link meetup.name
    visit "/:meetup.name"
    expect(page).to have_content meetup.description
  end

  scenario "each meetup should have a link to its own show page" do
    visit "/:meetup.name"

  end
end
