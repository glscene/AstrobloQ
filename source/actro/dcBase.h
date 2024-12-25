//---------------------------------------------------------------------------

#ifndef dcBaseH
#define dcBaseH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.BatchMove.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Phys.SQLite.hpp>
#include <FireDAC.Phys.SQLiteDef.hpp>
#include <FireDAC.Phys.SQLiteWrapper.Stat.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.ExprFuncs.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
//---------------------------------------------------------------------------
class TdmBase : public TDataModule
{
__published:	// IDE-managed Components
	TFDBatchMove *FDBatchMove;
	TFDPhysSQLiteDriverLink *FDPhysSQLiteDriverLink;
	TFDConnection *FDConnection;
	TFDQuery *FDQuery;
private:	// User declarations
public:		// User declarations
	__fastcall TdmBase(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TdmBase *dmBase;
//---------------------------------------------------------------------------
#endif
