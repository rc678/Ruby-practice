#Bubble sort implementation

#takes in an unsorted array and returns a sorted array
def bubble_sort(arr)
    n = arr.length 
    i = 1
    j = 0
    for i in i..n do
        for j in j..n do
            x = arr[j]
            y = arr[j + 1]
            if x > y then
                arr[j] = arr[j+1]
                arr[j + 1] = x
                print arr
                puts ""
            end
        end
    end
    #puts arr
    #return arr
end

#testcases
bubble_sort([4,25,99,2,0,2]) 
#bubble_sort([1,2,3])
#bubble_sort([3,2,1])

