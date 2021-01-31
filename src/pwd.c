#include <unistd.h>
#include <stdio.h>

int
main(int argc, char *argv[])
{
   char * wd;
   getwd(wd);
   puts(wd);
}
