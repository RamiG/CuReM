describe 'Home page' do

  subject {
    visit root_path
    last_respnose
  }

  its(:status) { should eq(200) }

end