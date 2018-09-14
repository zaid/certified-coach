require 'rails_helper'

RSpec.describe Api::V1::CoachDirectoryController, type: :request do
  fixtures :coaches

  describe "GET :index" do
    context "json format" do
      it "should be successful" do
        get '/api/v1/coach_directory.json'

        expect(response).to be_successful
      end
    end

    context "html format" do
      it "should be successful" do
        expect do
          get '/api/v1/coach_directory'
        end.to_not raise_error
      end

      it "should return a JSON response" do
        get '/api/v1/coach_directory'
        coaches = []

        expect { coaches = JSON.parse(response.body) }.to_not raise_error
        expect(coaches.size).to_not be_zero
      end
    end

    context "with country filter" do
      it "should return matching coaches" do
        expected_result = coaches(:uk_london_coach_1)

        get '/api/v1/coach_directory.json?country=United+Kingdom'

        expect(response).to be_successful

        json_response = JSON.parse(response.body)
        coach = json_response['coaches'].first

        expect(json_response).to have_key('coaches')
        expect(json_response['coaches'].length).to eq(1)
        expect(coach['country']).to eq(expected_result.country)
        expect(coach['province']).to eq(expected_result.province)
        expect(coach['postalcode']).to eq(expected_result.postalcode)
        expect(coach['fullname']).to eq(expected_result.fullname)
      end
    end

    context "with province filter" do
      it "should return matching coaches" do
        expected_result = coaches(:canada_bc_coach_1, :canada_bc_coach_2)

        get '/api/v1/coach_directory.json?province=BC'

        expect(response).to be_successful

        json_response = JSON.parse(response.body)
        coach1 = json_response['coaches'].first
        coach2 = json_response['coaches'].last

        expect(json_response).to have_key('coaches')
        expect(json_response['coaches'].length).to eq(2)

        expect(coach1['country']).to eq(expected_result.first.country)
        expect(coach1['province']).to eq(expected_result.first.province)
        expect(coach1['postalcode']).to eq(expected_result.first.postalcode)
        expect(coach1['fullname']).to eq(expected_result.first.fullname)

        expect(coach2['country']).to eq(expected_result.last.country)
        expect(coach2['province']).to eq(expected_result.last.province)
        expect(coach2['postalcode']).to eq(expected_result.last.postalcode)
        expect(coach2['fullname']).to eq(expected_result.last.fullname)
      end
    end

    context "with postal_code filter" do
      it "should return matching coaches" do
        expected_result = coaches(:canada_ontario_coach_1)

        get '/api/v1/coach_directory.json?postal_code=A0B+1C0'

        expect(response).to be_successful

        json_response = JSON.parse(response.body)
        coach = json_response['coaches'].first

        expect(json_response).to have_key('coaches')
        expect(json_response['coaches'].length).to eq(1)
        expect(coach['country']).to eq(expected_result.country)
        expect(coach['province']).to eq(expected_result.province)
        expect(coach['postalcode']).to eq(expected_result.postalcode)
        expect(coach['fullname']).to eq(expected_result.fullname)
      end
    end

    context "with name filter" do
      it "should return matching coaches" do
        expected_result = coaches(:canada_ontario_coach_2)

        get '/api/v1/coach_directory.json?name=CONC2'

        expect(response).to be_successful

        json_response = JSON.parse(response.body)
        coach = json_response['coaches'].first

        expect(json_response).to have_key('coaches')
        expect(json_response['coaches'].length).to eq(1)
        expect(coach['country']).to eq(expected_result.country)
        expect(coach['province']).to eq(expected_result.province)
        expect(coach['postalcode']).to eq(expected_result.postalcode)
        expect(coach['fullname']).to eq(expected_result.fullname)
      end
    end
  end
end
