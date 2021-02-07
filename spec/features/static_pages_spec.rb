RSpec.feature "static_pages_feature", type: :feature do
  scenario "Homeページが正しく表示されること" do
    visit root_path
    expect(page).to have_current_path root_path
    expect(page).to have_title "Home | Medpot"
    expect(page).to have_link 'ホーム', href: root_path, count: 2
    expect(page).to have_link 'Medpotとは', href: about_path
    expect(page).to have_link '利用規約', href: terms_of_service_path
    expect(page).to have_link 'プライバシーポリシー', href: privacy_policy_path
    expect(page).to have_link 'お問い合わせ', href: contact_path
  end
end