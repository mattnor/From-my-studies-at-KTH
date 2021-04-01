#Mattias Nordstrand
#2021-03

#The program takes a binary tree where each node has a value, then transforms
#this tree such that each parent's value will be the product of its two children's
#values (starting at the bottom of the tree going up i.e. a parent's node can have 
#its children's values changed if they in turn have children of their own, which in turn
#would affect the parent's new value).
#In case a node only has one or no child/children, the node will keep its
#value.

#Use the program by the mult function, or look at the example
#in the bottom of this code. Let each node be on the form
#{:node,val,left,right} or :nil

defmodule CHANGE_TREE do

    #tr is used to traverse and update the tree
    def tr({:node,val,left,right},f) do
        travleft=tr(left,f)
        travright=tr(right,f)

        {val1,val2}= if not(travleft==:nil or travright==:nil) do
            {_,val1,_,_}=travleft
            {_,val2,_,_}=travright
            {val1,val2}
        else
            {val,1}
        end

        {:node,f.(val1,val2),travleft,travright}
    end

    def tr(:nil,_) do :nil end

    #To start the program, use mult with a binary tree
    def mult(tree) do
        a_function=fn(value1,value2)->value1*value2 end
        tr(tree, a_function)
    end

    #example of how to use.
    #Output: {:node, 30, {:node, 5, nil, nil},{:node, 6, {:node, 3, nil, nil}, {:node, 2, nil, nil}}}
    def example() do
        mult({:node,3,{:node,5,:nil,:nil},{:node,9,{:node,3,:nil,:nil},{:node,2,:nil,:nil}}})
    end
end
