#include <stdio.h>

int
main(int argc, char *argv[])
{
   if(argc == 1)
   {
      return 1;
   }

   while(1)
   {
      puts(argv[1]);
   }
}
