RSpec.feature "User_feature", type: :feature do
  let(:user) { build(:user) }

  # scenario "サインアップ成功時にflashが正しい挙動をすること" do
  #   visit new_user_registration_path
  #   fill_in "ユーザーネーム", with: 'Example User'
  #   fill_in "メールアドレス", with: 'user@example.com'
  #   fill_in "パスワード", with: 'password'
  #   fill_in "パスワード(確認用)", with: 'password'
  #   click_button "サインアップ"
  #   aggregate_failures do
  #     expect(current_path).to eq user_path(user)
  #     expect(has_css?(".notice")).to be_truthy
  #     visit current_path
  #     expect(has_css?(".notice")).to be_falsy
  #   end
  # end

  scenario "不正な入力ではサインアップに失敗すること" do
    visit new_user_registration_path
    expect(page).to have_current_path new_user_registration_path
    fill_in "ユーザーネーム", with: " "
    fill_in "メールアドレス", with: "user@invalid"
    fill_in "パスワード", with: "foo"
    fill_in "パスワード(確認用)", with: "bar"
    click_button "サインアップ"
    expect(current_path).to eq new_user_registration_path
  end
end
