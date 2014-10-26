describe 'Home page' do

  before { visit root_path }

  subject { page }
  
  it { should have_content('CuReM') }

end