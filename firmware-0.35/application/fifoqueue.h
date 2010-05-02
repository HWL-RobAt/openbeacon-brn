#ifndef FIFOQUEUE
#define FIFOQUEUE
#include "config.h"

typedef struct {
                unsigned char* queue_mem;
                unsigned int queue_mem_size;
                unsigned int queue_struct_len;

                unsigned int queue_in;
                unsigned int queue_out;
                unsigned int queue_count;
} FIFOQueue;

unsigned char    FIFOQueue_init(FIFOQueue* fq, unsigned char *mem, unsigned int size, unsigned int struct_len);
unsigned char FIFOQueue_push(FIFOQueue* fq, unsigned char** entry);
unsigned char   FIFOQueue_pop(FIFOQueue* fq, unsigned char** entry);
unsigned char  FIFOQueue_view(FIFOQueue* fq, unsigned char** entry);


#ifdef PROJECT_DEBUG_X86
#include <stdio.h>

void FIFOQueue_debug(FIFOQueue* fq, void (*FIFOQueue_function)(unsigned char* entry));
#endif

#endif
