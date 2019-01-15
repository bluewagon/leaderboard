require 'spec_helper'

describe 'Ranking Pages' do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  describe 'ranking creation' do
    describe 'with anonymous user' do
      before { visit new_ranking_path }
      specify { current_path.should == new_user_session_path }
    end

    describe 'with signed-in user' do
      before do
        sign_user_in user
        visit new_ranking_path
      end

      describe 'with invalid information' do
         it 'should not create a group' do
           expect { click_button "Create" }.not_to change(Ranking, :count)
         end
      end

      describe "with valid information" do
        before do
          fill_in "Name", with: "Test Ranking"
          fill_in "Description", with: "Test Description"
        end

        it 'should create a group' do
          expect { click_button "Create" }.to change(Ranking, :count).by(1)
        end

        it 'should create user_ranking' do
          expect { click_button "Create" }.to change(UserRanking, :count).by(1)
        end
      end
    end
  end
end