class Player
    attr_accessor :num, :name, :sign

    def initialize(num, name, sign)
        @num = num
        @name = name
        @wins = 0
        @sign = sign
    end

end