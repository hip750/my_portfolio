RSpec.describe Recruit, type: :model do
  let(:user) { create(:user) }
  let(:recruit) { create(:recruit) }
  let!(:recruit_2) { create(:recruit, :recruit_2) }
  let!(:recruit_3) { create(:recruit, :recruit_3) }
  let!(:recruit_4) { create(:recruit, :recruit_4) }

  #valid
  it "recruitが有効であること" do
    expect(recruit).to be_valid
  end

  # present
  it "user_idがなければ無効であること" do
    recruit.user_id = nil
    expect(recruit).to be_invalid
  end

  it "co_nameがなければ無効であること" do
    recruit.co_name = " "
    expect(recruit).to be_invalid
  end

  it "descriptionがなければ無効であること" do
    recruit.description = " "
    expect(recruit).to be_invalid
  end

  # length
  it "co_nameは50文字以下であること" do
    recruit.co_name = "a" * 51
    expect(recruit).to be_invalid
  end

  it "titleは50文字以下であること" do
    recruit.title = "a" * 51
    expect(recruit).to be_invalid
  end

  it "descriptionは1000文字以下であること" do
    recruit.description = "a" * 1001
    expect(recruit).to be_invalid
  end

  it "payは255文字以下であること" do
    recruit.pay = "a" * 256
    expect(recruit).to be_invalid
  end

  it "postcodeは8文字以下であること" do
    recruit.postcode = "1" * 9
    expect(recruit).to be_invalid
  end

  it "cityは50文字以下であること" do
    recruit.city = "a" * 51
    expect(recruit).to be_invalid
  end

  it "streetは255文字以下であること" do
    recruit.street = "a" * 256
    expect(recruit).to be_invalid
  end

  it "work_styleは255文字以下であること" do
    recruit.work_style = "a" * 256
    expect(recruit).to be_invalid
  end

  it "accessは255文字以下であること" do
    recruit.access = "a" * 256
    expect(recruit).to be_invalid
  end

  it "phone_numberは13文字以下であること" do
    recruit.phone_number = "a" * 14
    expect(recruit).to be_invalid
  end
  
  it "web_siteは255文字以下であること" do
    recruit.web_site = "a" * 256
    expect(recruit).to be_invalid
  end

  it "transportationは255文字以下であること" do
    recruit.transportation = "a" * 256
    expect(recruit).to be_invalid
  end

  it "required_licenseは255文字以下であること" do
    recruit.required_license = "a" * 256
    expect(recruit).to be_invalid
  end

  describe "order(created_at: :desc)" do
    it "最新の投稿が最も上に表示されること" do
      expect(Recruit.first).to eq recruit_4
    end
  end

end
