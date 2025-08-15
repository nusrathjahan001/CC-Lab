#ifndef SYMTAB_H
#define SYMTAB_H

#define UNDEF_TYPE 0
#define INT_TYPE 1
#define REAL_TYPE 2
#define CHAR_TYPE 3

static const char *typename[] = {"UNDEF_TYPE", "INT_TYPE", "REAL_TYPE", "CHAR_TYPE"};

typedef struct list_t
{
    char st_name[64];
    int st_type;
    struct list_t *next;
} list_t;

void insert(char *name, int type);
list_t *search(char *name);
int idcheck(char *name);
int gettype(char *name);
int typecheck(int type1, int type2);

#endif
