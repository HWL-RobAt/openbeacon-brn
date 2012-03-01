/*
 *  Bearbeitet eine Liste von Parameter, um das Programm an seine Bedürfnisse anzupassen.
 *
 *
 */
#ifndef COMMANDLINE_h
#define COMMANDLINE_h

#define FALSE 0
#define TRUE 1

// Zuordnung vom Parameternamen zu einer Funktion, die das Programm so konfiguriert wie es laufen soll
struct param2func {
	char* param;
	int (*func)( int argc, char** argv, void* data );
	char* help;
};

// Liste für beliebige Datenstrukturen als ersatz für Template( list )
struct hListe {
	int size;
	struct param2func *func_list; 
};

int processParameter(int argc, char** argv, struct hListe funcs, void* data );

#endif
