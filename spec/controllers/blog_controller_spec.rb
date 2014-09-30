require 'rails_helper'

RSpec.describe BlogsController, :type => :controller do

	describe 'GET #index' do

		let!(:blog1) { FactoryGirl.create(:blog) }
		let!(:blog2) { FactoryGirl.create(:blog) }
		let!(:blog3) { FactoryGirl.create(:blog) }

    it "@blogsに全てのBlogが入っていること" do
			get :index
			expect(assigns(:blogs)).to eq [blog1, blog2, blog3]
		end
  end

  describe 'POST #create' do
    it "新規作成後に@blogのshowに遷移すること" do
    	@blog = FactoryGirl.attributes_for(:blog)
    	post :create, blog: @blog
      expect(response).to redirect_to blog_path(assigns(:blog))
    end
  end
end

# post :create, { name: 'name' }
# response.should redirect_to blog_path(@blog)
# expect(assigns(:blogs)).to eq @blogs
