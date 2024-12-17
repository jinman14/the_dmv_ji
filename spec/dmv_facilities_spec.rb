require 'spec_helper'
require 'pry'

RSpec.describe DMVFacility do
    before(:each) do
        @dmv_facility_1 = DMVFacility.new
        @dmv_facility_2 = DMVFacility.new
        @dmv_facility_3 = DMVFacility.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    end

    describe '#initialize' do
        it 'is a dmv facility' do
            expect(@dmv_facility_1).to be_an_instance_of(DMVFacility)
        end
    end

    describe '#create_facility' do
        it 'can collect dmv office data from external source' do
            expect(@dmv_facility_1.dmv_facility).to eq([])

            @dmv_facility_1.create_facility(@co_dmv_office_locations)
            # binding.pry
            expect(@dmv_facility_1.dmv_facility[0].name).to eq("DMV Tremont Branch")
            expect(@dmv_facility_1.dmv_facility[0].address).to eq("2855 Tremont Place")
            expect(@dmv_facility_1.dmv_facility[0].phone).to eq("(720) 865-4600")
        end

        it 'can collect from other facilities' do

            @dmv_facility_2.create_facility(@ny_dmv_office_locations)
            # binding.pry
            expect(@dmv_facility_2.dmv_facility[0].name).to eq("LAKE PLACID")
            expect(@dmv_facility_2.dmv_facility[0].address).to eq("2693 MAIN STREET")
            expect(@dmv_facility_2.dmv_facility[1].phone).to eq("5188283350")
        end

        it 'can collect from missouri too' do

            @dmv_facility_3.create_facility(@mo_dmv_office_locations)

            expect(@dmv_facility_3.dmv_facility[0].name).to eq("Harrisonville")
            expect(@dmv_facility_3.dmv_facility[0].address).to eq("2009 Plaza Dr.")
            expect(@dmv_facility_3.dmv_facility[0].phone).to eq("(816) 884-4133")
        end
    end
end