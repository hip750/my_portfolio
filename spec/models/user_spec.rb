RSpec.describe User, type: :model do
  let(:user) { create(:user) }

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

  #regex
  it "正しいフォーマットのemailのみ登録されること" do
    valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                          first.last@foo.jp alice+bob@baz.cn)
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid 
    end
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

  it '空文字のpasswordは無効であること' do
    user.password = user.password_confirmation = " " * 6
    expect(user).to be_invalid
  end

  it "passwordは6文字以上であること" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).to be_invalid
  end

  it "first_nameは50文字以下であること" do
    user.first_name = "a" * 51
    expect(user).to be_invalid
  end

  it "last_nameは50文字以下であること" do
    user.last_name = "a" * 51
    expect(user).to be_invalid
  end

  it "first_name_rubyは50文字以下であること" do
    user.first_name_ruby = "a" * 51
    expect(user).to be_invalid
  end

  it "last_name_rubyは50文字以下であること" do
    user.last_name_ruby = "a" * 51
    expect(user).to be_invalid
  end

  it "licenseは255文字以下であること" do
    user.license = "a" * 256
    expect(user).to be_invalid
  end

  it "postcodeは8文字以下であること" do
    user.postcode = "1" * 9
    expect(user).to be_invalid
  end
  
  it "cityは50文字以下であること" do
    user.city = "a" * 51
    expect(user).to be_invalid
  end
  
  it "streetは255文字以下であること" do
    user.street = "a" * 256
    expect(user).to be_invalid
  end
  
  it "phone_numberは13文字以下であること" do
    user.phone_number = "a" * 14
    expect(user).to be_invalid
  end

  it "careerは1000文字以下であること" do
    user.career = "a" * 1001
    expect(user).to be_invalid
  end

  it "self_promotionは1000文字以下であること" do
    user.self_promotion = "a" * 1001
    expect(user).to be_invalid
  end

  it "work_timesは255文字以下であること" do
    user.work_times = "a" * 256
    expect(user).to be_invalid
  end

  describe "dependent: :destroy" do
    it "userが削除されたらrecruitも削除されること" do
      user.recruits.create!(co_name: "クリニック", description: "駅近のクリニックです")
      expect do
        user.destroy
      end.to change(Recruit, :count).by -1
    end
  end
end
