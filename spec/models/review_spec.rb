RSpec.describe Review, type: :model do
  let(:user) { create(:user) }
  let(:recruit) { create(:recruit) }
  let(:review) { create(:review, user: user, recruit: recruit) }

  # valid
  it "reviewが有効であること" do
    expect(review).to be_valid
  end

  # present
  it "user_idがなければ無効であること" do
    review.user_id = nil
    expect(review).to be_invalid
  end

  it "recruit_idがなければ無効であること" do
    review.recruit_id = nil
    expect(review).to be_invalid
  end

  it "evaluationがなければ無効であること" do
    review.evaluation = " "
    expect(review).to be_invalid
  end

  it "contentがなければ無効であること" do
    review.content = " "
    expect(review).to be_invalid
  end

  # length
  it "contentは140文字以下であること" do
    review.content = "a" * 141
    expect(review).to be_invalid
  end
end
