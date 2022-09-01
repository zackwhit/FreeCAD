#ifndef CLIPBOARD_GLOBAL_H 
#define CLIPBOARD_GLOBAL_H 

#include <FCGlobal.h>


// Clipboard
#ifndef ClipboardExport
#ifdef Clipboard_EXPORTS
#  define ClipboardExport   FREECAD_DECL_EXPORT
#else
#  define ClipboardExport   FREECAD_DECL_IMPORT
#endif
#endif

// ClipboardGui
#ifndef ClipboardGuiExport
#ifdef ClipboardGui_EXPORTS
#  define ClipboardGuiExport   FREECAD_DECL_EXPORT
#else
#  define ClipboardGuiExport   FREECAD_DECL_IMPORT
#endif
#endif

#endif //PARTDESIGN_GLOBAL_H
