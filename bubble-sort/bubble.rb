#Bubble sort implementation

#takes in an unsorted array and returns a sorted array
#using the bubble sort algorithm
def bubble_sort(arr)
    n = arr.length 
    i = 0
    j = 1
    for i in i..n do
        for j in j..(n-1) do
            x = arr[j-1]
            y = arr[j]
            #swaps when j is less than j-1
            if x > y then
                arr[j-1] = y
                arr[j] = x 
            end
        end
    #sets inner for loop value to 1
    j = 1
    end
    print arr
    puts ""
    #return arr
end

#testcases
bubble_sort([5,1,4,2,8]) 
bubble_sort([1,2,3])
bubble_sort([3,2,1])

