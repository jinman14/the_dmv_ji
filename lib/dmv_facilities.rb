class DMVFacility
    attr_reader :dmv_facility

    def initialize
        @dmv_facility = []
    end

    def create_facility(office_details)

        office_details.each do |office|
            new_facility = Facility.new({
                :name => office[:dmv_office],
                :address => office[:address_li],
                :phone => office[:phone]
            })

            @dmv_facility << new_facility
        end
    end
end