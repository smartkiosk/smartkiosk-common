module Smartkiosk
  module PaymentTypes
    CASH         = 0
    INNER_CARD   = 1
    FOREIGN_CARD = 2
    IBANK        = 3
    MBANK        = 4
    PURSE        = 5
    ACCOUNT      = 6

    def self.as_json
      Hash[
        *Smartkiosk::PaymentTypes.constants.map do|x| 
          [x.to_s, Smartkiosk::PaymentTypes.const_get(x)]
        end.flatten
      ]
    end
  end
end