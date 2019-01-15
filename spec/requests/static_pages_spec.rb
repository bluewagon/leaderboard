require 'spec_helper'

describe 'Static Pages' do

  subject { page }

  describe 'Home page' do

    before { visit root_path }

    it { should have_title('Leaderboard') }

    # Header
    it { should have_link('Leaderboard', href: root_path) }
    it { should have_link('Login', href: new_user_session_path) }
    it { should have_link('Register', href: new_user_registration_path) }
    it { should_not have_link('Logout', href: destroy_user_session_path) }

    # Body
    it { should have_selector('h1', text: 'Leaderboard') }

    describe 'for signed-in users' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        user.save!
        sign_user_in(user)
      end

      it { should_not have_link('Login', href: new_user_session_path) }
      it { should_not have_link('Register', href: new_user_registration_path) }
      it { should have_link('Logout', href: destroy_user_session_path) }

      it { should have_link('Profile', href: "") }
      it { should have_link('Leaderboards', href: "") }
      it { should have_link('Create Leaderboard', href: new_ranking_path) }

      it { should have_selector('h1', user.email) }
      it { should have_selector('h2', 'Current Standings') }
    end

  end
end
