describe 'chech user' do
  it 'should  create success' do
    u = create(:user)
    u.should be_valid
  end

end