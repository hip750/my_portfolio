# RSpec.feature "User_feature", type: :feature do
#   let!(:user) { create(:user) }
#   let(:user_params) { attributes_for(:user) }
#   let(:invalid_user_params) { attributes_for(:user, name: "") }

#   before do
#     visit new_user_registration_path
#   end

#   scenario '正しく新規登録できること' do
#     expect(page).to have_current_path new_user_registration_path
#     fill_in "ユーザーネーム", with: "Foo"
#     fill_in "メールアドレス", with: "hogehoge@example.com"
#     fill_in "パスワード", with: "testuser"
#     fill_in "パスワード(確認用)", with: "testuser"
#     click_on '登録 '
#     find('.submit-button').click
#     expect(current_path).to eq user_path(user.id)
#   end
# end
