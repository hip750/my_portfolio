RSpec.describe "Reviews", type: :request do
  let(:user) { create(:user) }
  let(:recruit) { create(:recruit) }
  let!(:review) { create(:review) }
  let(:review_params) { attributes_for(:review) }

  describe "Reviews#create" do
    let(:post_request) { post recruit_reviews_path(recruit.id), params: { review: review } }

    context "ログインしている場合" do
      it "レビューが作成されること" do
        sign_in(user)
        aggregate_failures do
          expect do
            post recruit_reviews_path(recruit.id), params: { review: review_params }
          end.to change(Review, :count).by 1
        end
      end
    end

    context "ログインしていない場合" do
      it "レビューは作成されないこと" do
        expect { post_request }.to change(Review, :count).by(0)
      end

      it "ログイン画面に移ること" do
        expect(post_request).to redirect_to new_user_session_path
      end
    end
  end

  describe "Reviews#destroy" do
    let(:delete_request) { delete recruit_review_path(review.recruit_id, review.id) }

    context "ログインしていない場合" do
      it "レビューは削除されないこと" do
        expect { delete_request }.to change(Review, :count).by(0)
      end

      it "ログイン画面に移ること" do
        expect(delete_request).to redirect_to new_user_session_path
      end
    end
  end
end
