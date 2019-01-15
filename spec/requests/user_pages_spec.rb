require 'spec_helper'

describe 'User Pages' do
  subject { page }

  describe 'registration page' do
    before { visit new_user_registration_path }

    it { should have_selector('h2', text: 'Sign up') }
    it { should have_field('Email', type: 'email') }
    it { should have_field('Password', type: 'password') }
    it { should have_field('Password confirmation', type: 'password') }
  end

  describe 'index' do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_user_in user
      visit user_show_path user
    end

    describe 'user panel' do
      it { should have_css('img.gravatar', count: 1) }
      it { should have_selector('h2', text: user.email) }
    end

    describe 'standings' do
      it { should have_selector('h2', text: 'Current Points') }

      describe 'when user has rankings' do
        it { should have_selector('li', text: 'Not part of any leaderboards') }
      end
    end


  end
end