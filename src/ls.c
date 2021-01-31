#include <stdio.h>
#include <dirent.h>

int
main(int argc, char *argv[])
{
   if(argc == 1)
   {
      return 1;
   }

   DIR *dp;
   struct dirent *ep;
   dp = opendir(argv[1]);

   while(ep = readdir(dp))
   {
      puts(ep->d_name);
   }

   closedir(dp);
}
