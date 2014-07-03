describe 'view /' do

  it 'should show tty' do
    visit '/'
    page.should have_content '跳跳鱼'
  end



end