# RSpec.feature "User_feature", type: :feature do
#   let(:user) { create(:user) }
#   let(:user_params) { attributes_for(:user) }
#   let(:invalid_user_params) { attributes_for(:user, name: "") }

#   scenario '正しく新規登録できること' do
#     visit new_user_registration_path
#     expect(page).to have_current_path new_user_registration_path
#     fill_in "ユーザーネーム", with: "Foobar"
#     fill_in "メールアドレス", with: "hogehoge@example.com"
#     fill_in "パスワード", with: "testuser"
#     fill_in "パスワード(確認用)", with: "testuser"
#     find('.submit-button').click
#     expect(current_path).to eq user_path(user)
#     expect(page).to have_content 'アカウント登録が完了しました。'
#   end
# end
