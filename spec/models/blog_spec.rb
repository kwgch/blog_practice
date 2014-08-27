require 'rails_helper'

describe Blog do
  
  context 'with title' do
    subject(:not_empty_blog) { Blog.new(title: 'some title') }
    it { expect(not_empty_blog).to be_valid }
  end
  
  context 'without title' do
    subject(:empty_blog) { Blog.new(title: nil) }
    it { expect(empty_blog).not_to be_valid }
  end
end
