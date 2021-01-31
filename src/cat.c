#include <stdio.h>

int main (int argc, char *argv[])
{
   if(argc == 1)
   {
      return(1);
   }

   FILE *fp;
   int c;
  
   fp = fopen(argv[1],"r");

   if(fp == NULL) {
      return(-1);
   } do {
      c = fgetc(fp);
      if(feof(fp)) {
         break;
      }
      printf("%c", c);
   } while(1);

   fclose(fp);
   return(0);
}
