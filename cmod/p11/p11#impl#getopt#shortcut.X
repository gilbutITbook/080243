// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module T = p11◼impl◼getopt◼shortcut
#pragma CMOD import io= C◼io

#pragma CMOD declaration

typedef char* T;

#pragma CMOD definition

int snprintf(char*buf, C◼size size, void* obj) {
    char* Obj = obj;
    return io◼snprintf(buf, size, "%s", Obj);
}
