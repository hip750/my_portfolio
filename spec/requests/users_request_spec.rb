require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "UserAuthentications" do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, name: "") }

    describe 'POST #create' do
      before do
        ActionMailer::Base.deliveries.clear
      end

      context 'パラメータが妥当な場合' do
        it 'リクエストが成功すること' do
          post user_registration_path, params: { user: user_params }
          expect(response.status).to eq 302
        end

        # it '認証メールが送信されること' do
        #   post user_registration_path, params: { user: user_params }
        #   expect(ActionMailer::Base.deliveries.size).to eq 1
        # end

        it 'createが成功すること' do
          expect do
            post user_registration_path, params: { user: user_params }
          end.to change(User, :count).by 1
        end

        it 'リダイレクトされること' do
          post user_registration_path, params: { user: user_params }
          expect(response).to redirect_to user_path(user.id - 1)
        end
      end

      context 'パラメータが不正な場合' do
        it 'リクエストが成功すること' do
          post user_registration_path, params: { user: invalid_user_params }
          expect(response.status).to eq 200
        end

        it '認証メールが送信されないこと' do
          post user_registration_path, params: { user: invalid_user_params }
          expect(ActionMailer::Base.deliveries.size).to eq 0
        end

        it 'createが失敗すること' do
          expect do
            post user_registration_path, params: { user: invalid_user_params }
          end.not_to change(User, :count)
        end

        it 'エラーが表示されること' do
          post user_registration_path, params: { user: invalid_user_params }
          expect(response.body).to include 'エラーが発生したため ユーザ は保存されませんでした。'
        end
      end
    end

    describe 'GET #show' do
      context 'ユーザーが存在する場合' do
        it "アクセスが成功すること" do
          get user_path(user.id)
          expect(response.status).to eq 302
        end
      end

      context 'ユーザーが存在しない場合' do
        it 'エラーが発生すること' do
          user.destroy
          expect(response).not_to have_http_status(:success)
        end
      end
    end
  end
end
