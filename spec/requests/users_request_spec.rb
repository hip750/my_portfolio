RSpec.describe "Users", type: :request do
  describe "UserSingnup" do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, name: "") }

    describe "User#new" do
      it "リクエストが成功すること" do
        get new_user_registration_path
        expect(response).to have_http_status :success
      end
    end

    describe "User#create" do
      context "正しいパラメーターの場合" do
        it "createが成功すること" do
          aggregate_failures do
            expect do
              post user_registration_path, params: { user: user_params }
            end.to change(User, :count).by 1
            expect(response).to have_http_status(302)
            expect(response).to redirect_to user_path(User.last)
          end
        end
      end

      context "不正なパラメーターの場合" do
        it "createが失敗すること" do
          aggregate_failures do
            expect do
              post user_registration_path, params: { user: invalid_user_params }
            end.not_to change(User, :count)
            expect(response.body).to include 'つのエラーを検知しました'
          end
        end
      end
    end

    describe "User#show" do
      context "ユーザーが存在する場合" do
        it "アクセスが成功すること" do
          sign_in(user)
          get user_path(user)
          expect(response).to have_http_status :success
        end
      end

      context "ユーザーが存在しない場合" do
        it "アクセスが失敗すること" do
          user.destroy
          expect(response).not_to have_http_status :success
        end
      end
    end

    describe "User#destroy" do
      it 'deleteが成功すること' do
        sign_in user
        delete destroy_user_session_path
        aggregate_failures do
          expect(response).to redirect_to root_path
          expect(user_signed_in?).to be_falsy
        end
      end
    end

    describe "User#edit" do
      it "アクセスが成功すること" do
        sign_in user
        get edit_user_registration_path
        expect(response).to have_http_status :success
      end
    end

    describe 'User#update' do
      it '正しいページにリダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to user_path(user.id - 1)
      end
    end
  end
end
