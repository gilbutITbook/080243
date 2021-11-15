// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼

/* In the first part of this, this implements a common data structure
   that is called C◼tmpl◼list at the outside and tlist at the
   inside. In the second part it then provides template data structure
   with a snippet. */
#pragma CMOD module tlist		=	C◼tmpl◼list

/* We need the offsetof macro */
#pragma CMOD import 				C◼def
/* This imports an identifier C◼tmpl◼list◼INITIALIZER */
#pragma CMOD import 				C◼snippet◼INITIALIZER
/* This imports an identifier C◼tmpl◼list◼alloc */
#pragma CMOD import 				C◼snippet◼alloc
/* This imports an identifier C◼tmpl◼list◼init. */
#pragma CMOD import 				C◼snippet◼init
#pragma CMOD import 	is		=	C◼is

#pragma CMOD import	interface	=	C◼interface◼init


/* We also need some basic integer stuff. */
#pragma CMOD import integer		=	C◼integer
#pragma CMOD import str			=	C◼str
#pragma CMOD import uintptr		=	C◼uintpr

/* First there is the declaration and implementation of the "shared"
   part between different instantiations of this template. */

#pragma CMOD declaration

struct tlist {
  tlist* car;
  void* cdr;
};

inline
void* top(tlist* l) {
  return l ? l->cdr : 0;
}

inline
tlist* push(tlist* l, void* data) {
  tlist* n = alloc(1, 0);
  if (n) {
    *n = (tlist){ .car=l, .cdr=data, };
  }
  return n;
}

inline
tlist* drop(tlist* l) {
  tlist* ret = 0;
  if (l) {
    ret = l->car;
    alloc(0, l);
  }
  return ret;
}

inline
tlist* next(tlist* l) {
  return l ? l->car : 0;
}

/**************************************************/
/* Now comes the part that is inserted into the importers. There is no
   restriction about the importers themselves but they have to fill
   two slots, T identifier of a base type and instance an identifier
   for the newly created list type. */

#pragma CMOD snippet none
/* T is the base type for the list. */
#pragma CMOD slot T		=	complete
/* This will translate the identifier C◼tmpl◼list◼instance to whatever
   the importer wants to call it. */
#pragma CMOD slot instance	=	complete

#pragma CMOD declaration

typedef tlist instance;

inline
T top(instance* l) {
  _Static_assert(sizeof(T) <= sizeof(void*),
                 "tmpl#list only can handle types that fit into void*");
  if (is◼POINTER(T)) {
    return (T)tlist◼top(l);
  } else if (is◼SIGNED(T)) {
    C◼intptr ret = (C◼intptr)tlist◼top(l);
    return (T)ret;
  } else {
    C◼uintptr ret = (C◼uintptr)tlist◼top(l);
    return (T)ret;
  }
}

inline
instance* push(instance* l, T data) {
  if (is◼POINTER(T)) {
    return tlist◼push(l, (void*)data);
  } else if (is◼SIGNED(T)) {
    return tlist◼push(l, (void*)(C◼intptr)data);
  } else {
    return tlist◼push(l, (void*)(C◼uintptr)data);
  }
}

inline
instance* drop(instance* l) {
  return tlist◼drop(l);
}

inline
instance* next(instance* l) {
  return tlist◼next(l);
}
