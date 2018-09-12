require 'rails_helper'

RSpec.describe Coach, type: :model do
  fixtures :coaches

  describe "scopes" do
    let(:subject) { Coach }

    it { should respond_to(:with_country) }
    it { should respond_to(:with_postal_code) }
    it { should respond_to(:with_name) }

    context "with_country" do
      it "should return matching coaches" do
        expected_coaches = [coaches(:uk_london_coach_1)]
        actual_coaches = Coach.with_country('United Kingdom')

        expect(expected_coaches).to eq(actual_coaches)
        expect(coaches().size).to_not eq(actual_coaches.size)
      end
    end

    context "with_province" do
      it "should return matching coaches" do
        expected_coaches = coaches(:canada_bc_coach_1, :canada_bc_coach_2).sort_by(&:id)
        actual_coaches = Coach.with_province('BC').order(id: :asc)

        expect(expected_coaches).to eq(actual_coaches)
        expect(coaches().size).to_not eq(actual_coaches.size)
      end
    end

    context "with_postal_code" do
      it "should return matching coaches" do
        expected_coaches = [coaches(:uk_london_coach_1)]
        actual_coaches = Coach.with_postal_code('EC2A 4LB')

        expect(expected_coaches).to eq(actual_coaches)
        expect(coaches().size).to_not eq(actual_coaches.size)
      end
    end

    context "with_name" do
      it "should return matching coaches" do
        expected_coaches = [coaches(:canada_bc_coach_2)]
        actual_coaches = Coach.with_name('CBC2')

        expect(expected_coaches).to eq(actual_coaches)
        expect(coaches().size).to_not eq(actual_coaches.size)
      end
    end
  end
end
