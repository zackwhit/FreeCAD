

#ifndef CLIPBOARD_WORKBENCH_H
#define CLIPBOARD_WORKBENCH_H

#include <Gui/Workbench.h>
#include <Mod/Clipboard/ClipboardGlobal.h>

namespace ClipboardGui {

class ClipboardGuiExport Workbench : public Gui::StdWorkbench
{
    TYPESYSTEM_HEADER();

public:
  Workbench();
  virtual ~Workbench();
  void activated();

private:
};

} 


#endif 
