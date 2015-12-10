require "spec_helper"

feature "user views list of all meetups" do

  let!(:meetup) do
    #let without the exclamation point is lazy, which means the code won't execute until you call it (a la "meetup"). The exclamation point makes it not lazy.
    Meetup.create(
      name: "Eating Doritos in space",
      description: "Self-explanatory",
      location: "Jupiter",
      creator: "Lily & Chelsea"
    )
  end

  scenario "views list of meetups" do
    visit "/"
    expect(page).to have_content meetup.name
  end

  scenario "each meetup should have a link to its own show page" do
    visit "/:meetup.name"

  end
end
