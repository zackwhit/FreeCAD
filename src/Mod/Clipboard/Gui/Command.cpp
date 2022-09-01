#include "PreCompiled.h"
#ifndef _PreComp_
# include <QFileDialog>
# include <QImage>
# include <QImageReader>
# include <QMessageBox>
# include <QTextStream>
#endif

#include <Gui/Command.h>
#include <Base/Console.h>
#include <ClipboardBase.h>

#include <App/GeoFeature.h>

#include <QApplication>
#include <QClipboard>
#include <QTextStream>
#include <Gui/WaitCursor.h>
#include <Gui/MainWindow.h>
#include "Gui/Selection.h"

using namespace Gui;

// Is using multiple namespaces allowed?? Never done that before
using namespace ClipboardGui;

DEF_STD_CMD(CmdClipboardTest)

CmdClipboardTest::CmdClipboardTest()
  : Command("Clipboard_Test")
{
  sAppModule      = "Clipboard";
  //sGroup          = QT_TR_NOOP("Image");
  //sMenuText       = QT_TR_NOOP("Open...");
  //sToolTipText    = QT_TR_NOOP("Open image view");
  sWhatsThis      = "Clipboard_Test";
  //sStatusTip      = sToolTipText;
  //sPixmap         = "Image_Open";
}


void CmdClipboardTest::activated(int iMsg)
{
    Q_UNUSED(iMsg);
    Base::Console().Log("Got clipboard test command! \n");
}

//===========================================================================
// Paste
//===========================================================================
DEF_STD_CMD_A(CmdClipboardPaste)

CmdClipboardPaste::CmdClipboardPaste()
    : Command("Clipboard_Paste")
{
    sAppModule = "Clipboard";
    sGroup = "Edit";
    //sMenuText     = QT_TR_NOOP("&Paste");
    //sToolTipText  = QT_TR_NOOP("Paste operation");
    //sWhatsThis    = "Std_Paste";
    //sStatusTip    = QT_TR_NOOP("Paste operation");
    //sPixmap       = "edit-paste";
    //sAccel        = keySequenceToAccel(QKeySequence::Paste);
}

void CmdClipboardPaste::activated(int iMsg)
{
    Q_UNUSED(iMsg);
    bool done = getGuiApplication()->sendMsgToFocusView("Paste");
    if (!done) {
        QClipboard *cb = QApplication::clipboard();
        const QMimeData *mimeData = cb->mimeData();
        if (mimeData) {
            WaitCursor wc;
            getMainWindow()->insertFromMimeData(mimeData);
        }
    }
}

bool CmdClipboardPaste::isActive(void)
{
    if (getGuiApplication()->sendHasMsgToFocusView("Paste"))
        return true;
    QClipboard *cb = QApplication::clipboard();
    const QMimeData *mime = cb->mimeData();
    if (!mime)
        return false;
    return getMainWindow()->canInsertFromMimeData(mime);
}

//===========================================================================
// PasteInto
//===========================================================================
DEF_STD_CMD_A(CmdClipboardPasteInto)

CmdClipboardPasteInto::CmdClipboardPasteInto()
  : Command("Clipboard_PasteInto")
{
    sAppModule = "Clipboard";
    sGroup = "Edit";
    //sMenuText     = QT_TR_NOOP("&PasteInto");
    //sToolTipText  = QT_TR_NOOP("Paste into operation");
    sWhatsThis    = "Clipboard_PasteInto";
    //sStatusTip    = QT_TR_NOOP("Paste into operation");
    //sPixmap       = "edit-paste";
    //sAccel        = keySequenceToAccel(QKeySequence::PasteInto);
}

void CmdClipboardPasteInto::activated(int iMsg)
{
    Q_UNUSED(iMsg);
    bool done = getGuiApplication()->sendMsgToFocusView("Paste");
    if (!done) {
        QClipboard* cb = QApplication::clipboard();
        const QMimeData* mimeData = cb->mimeData();
        if (mimeData) {
            WaitCursor wc;
            getMainWindow()->insertFromMimeData(mimeData);
        }
    }
    
    //SelectionSingleton &mySelection = Selection();

    //std::vector<App::DocumentObject*> sel = Gui::Selection().getObjectsOfType(App::GeoFeature::getClassTypeId());
    //App::DocumentObject *firstObj = sel.front();

    //if (sel.size() == 1) {
    //    //Gui::ViewProvider* vp = Application::Instance->getViewProvider(sel.front());
    //    //vp->addObject();
    //    //firstObj->addObject();
    //    //vp->dropObject();
    //} else {
    //    QMessageBox::critical(Gui::getMainWindow(),
    //        QString::fromUtf8(QT_TR_NOOP("PasteInto")),
    //        QString::fromUtf8(QT_TR_NOOP("Cannot paste into with more than 1 object selected.")));
    //}

    // DocumentObjects do not own an addObject() method. So, we have to turn the DocumentObject
    // into something that does... Probably with some kind of get-by-name-or-id. 

    //mySelection.getObjectsOfType();

    // Recieve request to paste object
    // Check for current selection
    // If we currently have a body selected
    // Save that body
    // Paste object into document as per normal
    // Move the object under the body
        // removeObject
        // adjustRelativeLinks
        // dropObject/addObject
    // Hm.
}

bool CmdClipboardPasteInto::isActive(void)
{
    if (getGuiApplication()->sendHasMsgToFocusView("Paste"))
        return true;
    QClipboard* cb = QApplication::clipboard();
    const QMimeData* mime = cb->mimeData();
    if (!mime)
        return false;
    return getMainWindow()->canInsertFromMimeData(mime);
}


// Register command(s)
void CreateClipboardCommands()
{
    Gui::CommandManager& rcCmdMgr = Gui::Application::Instance->commandManager();

    rcCmdMgr.addCommand(new CmdClipboardTest());
    rcCmdMgr.addCommand(new CmdClipboardPasteInto());

    Base::Console().Log("Registered Clipboard Commands \n");
}




/*  Paste ?  */ 
/*-----------------
Do we need a Paste command, and a PasteInto command?


## Non-Paste-Into ##
    Copy a face
- Check if we have a face in the clipboard
- Create a new (draft?) face
- Follow paste-into rules

## 
    

*/ 

/*  Paste Into ? */ 
/*-----------------
- Check QT clipboard contents?
- Check what workbench we are in ?
- Check what we have selected
    - Part
    - Body
    - Group
- Depending on what we have selected
- Create new object from clipboard data
- Move new object under selected object, if possible
- 


## Other # Multiple selection
- Check for more than just one selected part
- Prompt?
- Try and paste-into all objects we have selected


*/ 


/* Copy ? */
/*-----------------
At least at first, we just need to replicate the same stuff in core.


Can we have the option of copying just a face off of a body? 
*/ 
