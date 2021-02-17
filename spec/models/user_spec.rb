RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:other_user) do
    create(:other_user, name: "other_user",
                        email: "other_user@example.com",
                        password: password)
  end
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  # valid
  it "name,email,passwordが有効であること" do
    expect(user).to be_valid
  end

  # present
  it "nameがなければ無効であること" do
    user.name = " "
    expect(user).to be_invalid
  end

  it "emailがなければ無効であること" do
    user.email = " "
    expect(user).to be_invalid
  end

  it "passwordがなければ無効であること" do
    user.password = " "
    expect(user).to be_invalid
  end

  # uniqueness
  it "重複したnameは無効であること" do
    duplicate_user = user.dup
    duplicate_user.name = user.name.upcase
    user.save!
    expect(duplicate_user).to be_invalid
  end

  it "重複したemailは無効であること" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save!
    expect(duplicate_user).to be_invalid
  end

  # length
  it "nameは50文字以下であること" do
    user.name = "a" * 51
    expect(user).to be_invalid
  end

  it "emailは255文字以下であること" do
    user.email = "a" * 244 + "@example.com"
    expect(user).to be_invalid
  end

  it "passwordは6文字以上であること" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).to be_invalid
  end
end
