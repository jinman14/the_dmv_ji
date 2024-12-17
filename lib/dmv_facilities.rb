class DMVFacility
    attr_reader :dmv_facility

    def initialize
        @dmv_facility = []
    end

    def create_facility(office_details)

        office_details.each do |office|

                new_facility = Facility.new({
                    :name => "#{office[:dmv_office]}#{office[:office_name]}#{office[:name]}",
                    :address => "#{office[:address_li]}#{office[:street_address_line_1]}#{office[:address1]}",
                    :phone => "#{office[:phone]}#{office[:public_phone_number]}"
                    })

            @dmv_facility << new_facility
        end
    end
end