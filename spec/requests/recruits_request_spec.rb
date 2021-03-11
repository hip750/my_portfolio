RSpec.describe "Recruits", type: :request do
  let(:user) { create(:user) }
  let!(:recruit) { create(:recruit) }
  let(:recruit_params) { attributes_for(:recruit) }

  describe "Recruits#index" do
    it "リクエストが成功すること" do
      sign_in(user)
      get recruits_path
      expect(response).to have_http_status :success
    end
  end

  describe "Recruits#show" do
    it "リクエストが成功すること" do
      sign_in(user)
      get recruit_path(recruit.id)
      expect(response).to have_http_status :success
    end
  end

  describe "Recruits#new" do
    it "リクエストが成功すること" do
      sign_in(user)
      get new_recruit_path
      expect(response).to have_http_status :success
    end
  end

  describe "Recruits#create" do
    let(:post_request) { post recruits_path, params: { recruit: recruit } }

    context "ログインしている場合" do
      it "求人が作成されること" do
        sign_in(user)
        aggregate_failures do
          expect do
            post recruits_path, params: { recruit: recruit_params }
          end.to change(Recruit, :count).by 1
        end
      end
    end

    context "ログインしていない場合" do
      it "求人は作成されないこと" do
        expect { post_request }.to change(Recruit, :count).by(0)
      end

      it "ログイン画面に移ること" do
        expect(post_request).to redirect_to new_user_session_path
      end
    end
  end

  describe "Recruits#destroy" do
    let(:delete_request) { delete recruit_path(recruit) }

    context "ログインしていない場合" do
      it "求人は削除されないこと" do
        expect { delete_request }.to change(Recruit, :count).by(0)
      end

      it "ログイン画面に移ること" do
        expect(delete_request).to redirect_to new_user_session_path
      end
    end

    context "他のユーザーが削除しようとした場合" do
      it "求人は削除されないこと" do
        expect { delete_request }.to change(Recruit, :count).by(0)
      end

      it "ホーム画面に移ること" do
        expect(delete_request).to redirect_to new_user_session_path
      end
    end
  end
end
