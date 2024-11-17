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
