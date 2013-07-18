require 'matrix'

$num_of_genes = 4
$values = []
$genes = []

class Init
    
=begin
  Values    => 1 ~ 9
  Return    => Array
  Parameter => Number of elements to be pushed into the array
            => Default ==> 6
=end
    def init_values(num_of_elements = 6)
    
        values = []
        
        num_of_elements.times do
            
            values.push(rand(9) + 1)
            
        end
            
        return values
      
    end#def init_values
    
    def init_gene(num_of_elements = 6)
        
        gene = []
        
        num_of_elements.times do
            
            gene.push(rand(2))
            
        end
        
        return gene
        
    end#def init_gene
end

# REF http://www.rubylife.jp/ini/module/index2.html
module Basic

=begin
    Return
        false   Lengths of the two parameters not equal
=end
    def array_product(a1, a2)
        # If the lengths not equal, then return nil
        if a1.length != a2.length
            
            return nil
            
        end
        
        product = []
        
        a1.each_index {|i|
        
            product.push(a1[i] * a2[i])
        
        }

        return product
        
    end#def array_product(a1, a2)
    
    def sum_of_elements(a1)
        # If an empty array, then return 0
        if a1.length < 1
            
            return 0
            
        end
        
        sum = 0
        
        a1.each {|x|
        
            sum += x
            
        }
        
        return sum
        
    end#def sum_of_elements(a1)

=begin
  Return
        -1      The array product is nil
=end
    def evaluate(values, gene)
        # If the lengths not equal, then return false
        if values.length != gene.length
            
            return false
            
        end
        
        # Get product
        product = Basic.array_product(values, gene)
        
        # Validate
        if product == nil
            
            return -1
        end
        
        # Get sum
        return Basic.sum_of_elements(product)
        
    end#def evaluate


    def get_weighted_array(genes, values)
        
        # Create a reference array for weighted random choosing
        reference = []
        
        # For each element in genes, get the evaluation  
        # => value of it, then push into the reference 
        # => array the index number of the element for 
        # => evaluation value times
        genes.each_with_index do |elem, i|
            
            Basic.evaluate(values, elem).times do
                
                reference.push(i)
                
            end
            
        end#genes.each_with_index do |elem, i|
        
        return reference
        
    end#def get_weighted_array(genes, values)

    def show_genes(genes, values)
        
        genes.length.times do |i|
            
            print "gene[#{i}] = "; p genes[i]
            
            print "\tProduct => "; p Basic.array_product(values, genes[i])
            print "\tEvaluate => "; p evaluate(values, genes[i])
            
            puts
            
        end
        
    end#def show_genes(genes)
    
    module_function :sum_of_elements
    module_function :array_product
    module_function :evaluate
    module_function :get_weighted_array
    module_function :show_genes
    
end#module Basic

module GeneProc
    
    def choose_parent(genes, values)
        
        # Weighted array
        weighted = Basic.get_weighted_array(genes, values)
        
        # Get parent
        parent1 = genes[weighted[rand(weighted.length)]]
        parent2 = genes[weighted[rand(weighted.length)]]

        
        while parent1 == parent2 do
            
            parent1 = genes[weighted[rand(weighted.length)]]
            parent2 = genes[weighted[rand(weighted.length)]]
            
        end#while parent1 == parent2 do
        
        return [parent1, parent2]
        
    end#def choose_parent(genes)
    
    module_function :choose_parent
    
end#module GeneProc

def do_job
    
    # Instantiate classes
    init = Init.new

    # Init & show values array
    values = init.init_values
    
    print "values="; p values
    print "\tEvaluate => "; puts Basic.sum_of_elements(values)

    # Init genes
    genes = []
    $num_of_genes.times do |i|
        
        genes.push(init.init_gene)
        
    end
    
    # Show genes
    Basic.show_genes(genes, values)
    
    # Show weighted array
    puts
    puts "<Weighted array>"
    
    p Basic.get_weighted_array(genes, values)
    
    # Choose parent
    parents = GeneProc.choose_parent(genes, values)

    puts
    puts "<Parents>"
    p parents

=begin
    g1 = init_gene
    g2 = init_gene
    
    print "g1="; p g1
    print "\tProduct => "; p array_product(values, g1)
    print "\tEvaluate => "; p evaluate(values, g1)

    
    print "g2="; p g2
    print "\tProduct => "; p array_product(values, g2)
    print "\tEvaluate => "; p evaluate(values, g2)
=end    
        
end

do_job

=begin
puts "Hi"

# Show the initial data
print "values="; p values
print "g1="; p g1

# Product
print "Product => "
p array_product(values, g1)

# Evaluate
print "Evaluation => "
p evaluate(values, g1)


mat1 = Matrix[[1,2,3,4]]
#mat2 = Matrix[1,2,3,4]

puts mat1.class.to_s

a = mat1.methods.sort
puts a.length

a.each {|i|
    
    puts i
    
}
=end