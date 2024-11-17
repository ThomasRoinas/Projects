#include <stdio.h>

int main(void)
{
    int nums[] = {3, 3};
    int i;
    int j;
    int target = 6;

    for(i=0; i<2; i++)
    {
        for(j=0; j<2; j++)
        {
            if((nums[i] + nums[j]) == target && (i != j))
            {
                printf("[%d, %d]", i, j);
                goto end;
            }
        
        }
    }
end:
    return 0;
}

/*    
    Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    
    You may assume that each input would have exactly one solution, and you may not use the same element twice.
    
    You can return the answer in any order.

    Only one valid answer exists.
*/
