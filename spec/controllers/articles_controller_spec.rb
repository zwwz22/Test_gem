describe ArticlesController,:type => :controller  do
  it 'should get articles' do
    #article = create(:article)
    get :index

    response.should be_success

  end
end