class Gene
    
    # Class vars
    @@current_generation = 1    # Generation number
                                # => Increment by 1 after
                                # =>    finishing generating 
                                # =>    a whole generation
    
    attr_accessor :suited, :gene, :generation, :in_generation_serial
    
    # Instance vars
    @suited = 0     # Integer   // Value for suitedness
    @gene           # Array     // Gene set
    @generation     # Integer   // Generation number
    @in_generation_serial     # Integer // ID inside the generation
    
    # class << self
        # attr_accessor :current_generation
    # end
    
    def initialize
        
        # @gene = []
        # @@current_generation = 1
        
    end#    def initialize
    
    #REF get class var => http://www.namaraii.com/rubytips/?%A5%AF%A5%E9%A5%B9%A4%C8%A5%AA%A5%D6%A5%B8%A5%A7%A5%AF%A5%C8#l4 "クラス変数は主にクラスのインスタンスやサブクラスのインスタンス間で"
    def get_current_generation
        
        return @@current_generation
        
    end#    def get_current_generation
    
    def set_current_generation(number)
        
        @@current_generation = number
        
    end#    def set_current_generation
    
end