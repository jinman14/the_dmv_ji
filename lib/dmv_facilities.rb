class DMVFacility
    attr_reader :dmv_facility, :holiday

    def initialize
        @dmv_facility = []
    end

    def create_facility(office_details)

        office_details.each do |office|

                new_facility = Facility.new({
                    :name => "#{office[:dmv_office]}#{office[:office_name]}#{office[:name]}",
                    :address => "#{office[:address_li]}#{office[:street_address_line_1]}#{office[:address1]} #{office[:city]} #{office[:state]} #{office[:zip_code]}#{office[:zipcode]}#{office[:zip]}",
                    :phone => "#{office[:phone]}#{office[:public_phone_number]}",
                    :hours => "#{office[:hours]}#{office[:daysopen]}"
                    })
            @dmv_facility << new_facility
        end
    end

    # def holidays

    #     if new_facility.name == "Harrisonville"
    #         :holiday => "#{office[:holidayclosed]}"
    #     else
    #         p "No holiday hours information available"
    #     end
    # end
end