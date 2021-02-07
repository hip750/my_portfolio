RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title(page_title)" do
    context "page_titleが存在する場合" do
      it "page_title + BASE_TITLE を表示" do
        expect(full_title("Home")).to eq "Home | Medpot"
      end
    end

    context "page_titleがnilの場合" do
      it "BASE_TITLE のみを表示" do
        expect(full_title(nil)).to eq "Medpot"
      end
    end

    context "page_titleがemptyの場合" do
      it "BASE_TITLE のみを表示" do
        expect(full_title("")).to eq "Medpot"
      end
    end
  end
end
