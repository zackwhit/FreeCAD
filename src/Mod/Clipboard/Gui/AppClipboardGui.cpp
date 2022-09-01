// no idea what these do
//#include <FCGlobal.h> 
#include <CXX/Extensions.hxx>
#include <CXX/Objects.hxx>
#include "PreCompiled.h"

// why??
#include <Workbench.h>

#include <Base/PyObjectBase.h>

#include <Base/Console.h>
#include <Base/Exception.h>
#include <Base/FileInfo.h>
#include <Base/Interpreter.h>

// Things I understand better
#include <ClipboardBase.h>

void CreateClipboardCommands();

namespace ClipboardGui {

class Module : public Py::ExtensionModule<Module>
{
public:
    Module() : Py::ExtensionModule<Module>("ClipboardGui")
    {
        initialize("This module is the Clipboard module."); // register with Python
    }

    virtual ~Module() {}

private:
};


PyObject* initModule()
{
    return Base::Interpreter().addModule(new Module);
}

}

/* Python entry */
PyMOD_INIT_FUNC(ClipboardGui)
{
    Base::Console().Log("Loaded the base class of the Clipboard module\n");

    PyObject* mod = ClipboardGui::initModule();

    CreateClipboardCommands();

    PyMOD_Return(mod);
}