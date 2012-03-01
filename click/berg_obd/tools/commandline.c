#include "commandline.h"

int processParameter(int argc, char** argv, struct hListe funcs, void* data ) {
	int i=0, j=0;
	int found;

	// set default value

	for(i=0; i<argc; i++) {
		found=0;
		for(j=0; j<funcs.size; j++) {
			if( strcmp(argv[i], funcs.func_list[j].param )==0 ) {
				int end, pcount=0;
				for(end=i+1; end<argc && argv[end][0]!='-'; end++) pcount++;
                                if( funcs.func_list[j].func( pcount, (char**)(argv+i+1), data)!=0 ) return -i-10;
				found=1;
				i += pcount;
				break;
			}
		}
		if(found==0) return -1;
	}
	return 0;
}

