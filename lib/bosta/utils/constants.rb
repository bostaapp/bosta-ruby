module Bosta
    # Set your pick in Time Slot '10:00 to 13:00'
    TIME_SLOT_10_TO_13 = '10:00 to 13:00'

    # Set your pick in Time Slot '13:00 to 16:00'
    TIME_SLOT_13_TO_16 = '13:00 to 16:00'


    #=== Four different types
    #
    #* SEND => 10
    #* CASH_COLLECTION => 15
    #* CRP => 25
    #* EXCHANGE => 30
    #

    DELIVERY_TYPES = {
        :SEND => {
            :code => 10,
            :value => "Package Delivery"
        },
        :CASH_COLLECTION => {
            :code => 15,
            :value => "Cash Collection"
        },
        :CRP => {
            :code => 25,
            :value => "Customer Return Pickup"
        },
        :EXCHANGE => {
            :code => 30,
            :value => "Exchange"
        }
    }

    #=== Three different sizes
    #
    #* SMALL
    #* MEDIUM
    #* LARGE
    #
    DELIVERY_SIZES = {
        :SMALL => "SMALL",
        :MEDIUM => "MEDIUM",
        :LARGE => "LARGE"
    }
end