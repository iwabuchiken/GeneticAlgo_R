require 'matrix'

$num_of_genes = 4

=begin
    Return
        false   Lengths of the two parameters not equal
=end
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
    product = array_product(values, gene)
    
    # Validate
    if product == nil
        
        return -1
    end
    
    # Get sum
    return sum_of_elements(product)
    
end#def evaluate

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

def show_genes(genes, values)
    
    genes.length.times do |i|
        
        print "gene[#{i}] = "; p genes[i]
        
        print "\tProduct => "; p array_product(values, genes[i])
        print "\tEvaluate => "; p evaluate(values, genes[i])
        
        puts
        
    end
    
end#def show_genes(genes)

def do_job

    # Init & show values array
#    values = init_values
    values = [1,2,3,4,5,6]
    
    print "values="; p values
    print "\tEvaluate => "; puts sum_of_elements(values)

    # Init genes
    genes = []
    $num_of_genes.times do |i|
        
        genes.push(init_gene)
        
    end
    
    # Show genes
    show_genes(genes, values)

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