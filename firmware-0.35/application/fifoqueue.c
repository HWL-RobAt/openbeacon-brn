#include <string.h>
#include "fifoqueue.h"

unsigned char    FIFOQueue_init(FIFOQueue* fq, unsigned char *mem, unsigned int size, unsigned int struct_len) {
        if(fq!=NULL) {
                fq->queue_mem		= mem;
                fq->queue_mem_size	= size;
                fq->queue_struct_len	= struct_len;
                fq->queue_in			= 0;
                fq->queue_count		= fq->queue_mem_size/fq->queue_struct_len;
                fq->queue_out			= (fq->queue_count-1)%fq->queue_count;
                return 1;
        }
        return 0;
}

unsigned char FIFOQueue_push(FIFOQueue* fq, unsigned char** entry) {
        if( (fq->queue_in+1)%fq->queue_count!=fq->queue_out ) {
                if(*entry!=NULL) memcpy( fq->queue_mem+(fq->queue_in*fq->queue_struct_len),  *entry, fq->queue_struct_len);
                else *entry = fq->queue_mem+(fq->queue_in*fq->queue_struct_len);
                fq->queue_in = (fq->queue_in+1)%fq->queue_count;
                return 1;
        }
        return 0;
}

unsigned char   FIFOQueue_pop(FIFOQueue* fq, unsigned char** entry) {
        if( (fq->queue_out+1)%fq->queue_count!=fq->queue_in ) {
                fq->queue_out = (fq->queue_out+1)%fq->queue_count;
                if(*entry!=NULL) memcpy(*entry, fq->queue_mem+( fq->queue_out*fq->queue_struct_len), fq->queue_struct_len);
                else *entry = fq->queue_mem+( fq->queue_out*fq->queue_struct_len);
                return 1;
        }
        return 0;
}
unsigned char   FIFOQueue_view(FIFOQueue* fq, unsigned char** entry) {
        if( (fq->queue_out+1)%fq->queue_count!=fq->queue_in ) {
                if(*entry!=NULL) memcpy(*entry, fq->queue_mem+(((fq->queue_out+1)%fq->queue_count)*fq->queue_struct_len), fq->queue_struct_len);
                else *entry = fq->queue_mem+(((fq->queue_out+1)%fq->queue_count)*fq->queue_struct_len);

                return 1;
        }
        return 0;
}
unsigned int FIFOQueue_elements(FIFOQueue* fq) {
        if(fq->queue_out>fq->queue_in) {
                return fq->queue_count-(fq->queue_out-fq->queue_in+1);
        }
        return fq->queue_in-fq->queue_out-1;
}
unsigned int FIFOQueue_count(FIFOQueue* fq) {
	return fq->queue_count-2;
}

#ifdef PROJECT_DEBUG_X86
void FIFOQueue_debug(FIFOQueue* fq, void (*FIFOQueue_function)(unsigned char* entry)) {
        unsigned int i;

        printf("FIFOQueue::debug():\n");
        printf("\tIN(%d), OUT(%d), COUNT(%d)\n", fq->queue_in, fq->queue_out, fq->queue_count);
        printf("\tBuffer: ");

        for(i=fq->queue_out; (i+1)%fq->queue_count!=fq->queue_in; i++ ) {
                FIFOQueue_function( fq->queue_mem+(i+1)%fq->queue_count*fq->queue_struct_len );
        }
        printf("\n");
}
#endif





