RSpec.describe MessageMailer, type: :request do
  let(:message) { build(:message) }

  describe '#send_mail' do
    subject(:mail) do
      described_class.received_email(message).deliver_now
      ActionMailer::Base.deliveries.last
    end

    context 'when send_mail' do
      it { expect(mail.from.first).to eq("from@example.com") }
      it { expect(mail.to.first).to eq(ENV["MAIL_ADDRESS"]) }
      it { expect(mail.subject).to eq("Medpot | 応募メール") }
      it { expect(mail.body).to match(/こちらはMedpodです。/) }
    end
  end
end
