describe 'visit articles'  do
  it 'should get articles' do
    #article = create(:article)
    visit articles_path

    page.should have_content '跳跳鱼'

  end
end