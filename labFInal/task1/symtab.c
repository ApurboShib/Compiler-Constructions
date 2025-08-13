// Simple symbol table implementation

// Type constants
#define INT_TYPE 1
#define REAL_TYPE 2
#define CHAR_TYPE 3

typedef struct symbol {
    char name[100];
    int type;
    struct symbol* next;
} symbol_t;

static symbol_t* symbol_table = NULL;
extern int lineno;

void insert(char* name, int type) {
    symbol_t* new_symbol = (symbol_t*)malloc(sizeof(symbol_t));
    strcpy(new_symbol->name, name);
    new_symbol->type = type;
    new_symbol->next = symbol_table;
    symbol_table = new_symbol;
    
    // Print insertion message
    printf("In line no %d, Inserting %s with type ", lineno, name);
    if (type == INT_TYPE) {
        printf("INT_TYPE in symbol table.\n");
    } else if (type == REAL_TYPE) {
        printf("REAL_TYPE in symbol table.\n");
    } else if (type == CHAR_TYPE) {
        printf("CHAR_TYPE in symbol table.\n");
    }
}

symbol_t* lookup(char* name) {
    symbol_t* current = symbol_table;
    while (current != NULL) {
        if (strcmp(current->name, name) == 0) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}

// Check if identifier exists in symbol table
int idcheck(char* name) {
    return (lookup(name) != NULL) ? 1 : 0;
}

// Get type of identifier from symbol table
int gettype(char* name) {
    symbol_t* sym = lookup(name);
    return (sym != NULL) ? sym->type : -1;
}

// Type checking function - simple compatibility check
int typecheck(int type1, int type2) {
    if (type1 == type2) {
        return type1;
    }
    // Basic type promotion rules
    if ((type1 == INT_TYPE && type2 == REAL_TYPE) || 
        (type1 == REAL_TYPE && type2 == INT_TYPE)) {
        return REAL_TYPE;
    }
    return -1; // Type error
}
