require "spec_helper"

feature "Signup" do
  
  scenario "with valid attributes" do
    visit root_path  
    click_link t("menu.signup")
    fill_in label("user.name"), with: "Carlos Ribeiro"
    fill_in label("user.email"), with: "duduribeiro.gba@gmail.com"
    fill_in label("user.password"), with: "123456"
    fill_in label("user.password_confirmation"), with: "123456"
    click_button submit("user.create")
    expect(current_path).to eql(login_path)
    expect(page).to have_notice("signup.create")
  end

  scenario "with invalid attributes"

  scenario "already logged in"

end