//---------------------------------------------------------------------------
#define MULTICOEF 1
#include <vcl.h>
#include <cstdlib>
#include <ctime>
#include <typeinfo>
#include <fstream>
#include <string>
#pragma hdrstop

#include "fcStarCube_ru.h"
#include "fcTableStars_ru.h"
#include <vector>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Cadencer"
#pragma link "GLS.Coordinates"
#pragma link "GLS.Objects"
#pragma link "GLS.Scene"
#pragma link "GLS.SceneViewer"
#pragma link "GLS.GeomObjects"
#pragma link "GLS.VectorFileObjects"
#pragma link "GLS.Mesh"
#pragma link "GLS.SimpleNavigation"
#pragma resource "*.dfm"
TFormStarcube* FormStarcube;

int mx, my; // vars for saving position

String datapath;

TStringList* S1 = new TStringList;
TStringList* T1 = new TStringList;

int MODE = 0;

struct STAR
{
    String type;
    DelaunayBase delaunay;
    VoronoiBase voronoi;
    float R;
    float G;
    float B;
};

std::vector<STAR> STARS(7);
String STAR_CLASS[7] = { "O", "B", "A", "F", "G", "K", "M" };
float COLORS[7][3] = { { 0, 0.8, 1 }, { 0.803, 1, 1 }, { 1, 1, 1 },
    { 0.996, 1, 0.6 }, { 1, 1, 0.003 }, { 1, 0.4, 0 }, { 0.992, 0, 0.003 } };

//---------------------------------------------------------------------------
void __fastcall TFormStarcube::FormCreate(TObject* Sender)
{
	// Указываем путь к данным
	datapath = ".\\..\\..\\DATA\\";
	// Используем десятичную точку в файлах CSV
	FormatSettings.DecimalSeparator = '.';
}

//---------------------------------------------------------------------------
// Получение данных для Тетраэдров Делоне
//---------------------------------------------------------------------------
DelaunayBase __fastcall TFormStarcube::InitDelaunay(String starClass)
{
	//======== ПОЛУЧЕНИЕ NODE.CSV
	DelaunayBase dt_struct;
	String path = "";
	unsigned char FX, FY, FZ;

	path = datapath + "/Delaunay/" + starClass + "/node.csv";
	S1->LoadFromFile(path);
	T1->CommaText = S1->Strings[0];

	for (int i = 0; i < T1->Count; i++) {
		if (T1[0][i] == "X")
			FX = i;
		else if (T1[0][i] == "Y")
			FY = i;
		else if (T1[0][i] == "Z")
			FZ = i;
	}

	dt_struct.nodeCount = S1->Count;
	dt_struct.node = new double*[dt_struct.nodeCount]; // DT_node
	for (int i = 0; i < dt_struct.nodeCount; ++i)
		dt_struct.node[i] = new double[3];

	for (int i = 1; i < dt_struct.nodeCount; i++) {
		try {
			T1->CommaText = S1->Strings[i];
			dt_struct.node[i][0] = StrToFloat(T1[0][FX]) * MULTICOEF;
			dt_struct.node[i][1] = StrToFloat(T1[0][FY]) * MULTICOEF;
			dt_struct.node[i][2] = StrToFloat(T1[0][FZ]) * MULTICOEF;

		} catch (...) {
		}
	}

	//========================= ПОЛУЧЕНИЕ EDGE.CSV
	path = datapath + "/Delaunay/" + starClass + "/edge.csv";
	S1->LoadFromFile(path);
	T1->CommaText = S1->Strings[0];
	unsigned char FNode1, FNode2;

	for (int i = 0; i < T1->Count; i++) {
		if (T1[0][i] == "Node1")
			FNode1 = i;
		else if (T1[0][i] == "Node2")
			FNode2 = i;
	}

	dt_struct.edgeCount = S1->Count;

	dt_struct.edge = new int*[dt_struct.edgeCount]; // DT_edge
	for (int i = 0; i < dt_struct.edgeCount; ++i) {
		dt_struct.edge[i] = new int[2];
	}

	for (int i = 1; i < dt_struct.edgeCount; i++) {
		try {
			T1->CommaText = S1->Strings[i];

			dt_struct.edge[i][0] = StrToFloat(T1[0][FNode1]) * MULTICOEF;
			dt_struct.edge[i][1] = StrToFloat(T1[0][FNode2]) * MULTICOEF;

		} catch (...) {
		}
	}

	return dt_struct;
}

//-----------------------------------------------------------------------
// Получение данных для полиэдров Вороного
//-----------------------------------------------------------------------
VoronoiBase __fastcall TFormStarcube::InitVoronoi(String starClass)
{
	VoronoiBase vd_struct;
	String path = "";

	//================= ПОЛУЧЕНИЕ NODE.CSV
	unsigned char FX, FY, FZ;

	path = datapath + "/Voronoi/" + starClass + "/node.csv";
	S1->LoadFromFile(path);
	T1->CommaText = S1->Strings[0];

    for (int i = 0; i < T1->Count; i++) {
        if (T1[0][i] == "X")
            FX = i;
        else if (T1[0][i] == "Y")
            FY = i;
        else if (T1[0][i] == "Z")
            FZ = i;
    }

    vd_struct.nodeCount = S1->Count;

    vd_struct.node = new double*[vd_struct.nodeCount];
    for (int i = 0; i < vd_struct.nodeCount; ++i)
        vd_struct.node[i] = new double[3];

    for (int i = 1; i < vd_struct.nodeCount; i++) {
        try {
            T1->CommaText = S1->Strings[i];
            vd_struct.node[i][0] = StrToFloat(T1[0][FX]) * MULTICOEF;
            vd_struct.node[i][1] = StrToFloat(T1[0][FY]) * MULTICOEF;
            vd_struct.node[i][2] = StrToFloat(T1[0][FZ]) * MULTICOEF;

        } catch (...) {
        }
    }

    //========================= ПОЛУЧЕНИЕ EDGE.CSV
    path = datapath + "/Voronoi/" + starClass + "/edge.csv";
    S1->LoadFromFile(path);
    T1->CommaText = S1->Strings[0];
    unsigned char FNode1, FNode2;

    for (int i = 0; i < T1->Count; i++) {
        if (T1[0][i] == "X")
            FX = i;
        else if (T1[0][i] == "Y")
            FY = i;
        else if (T1[0][i] == "Z")
            FZ = i;
        else if (T1[0][i] == "Node1")
            FNode1 = i;
        else if (T1[0][i] == "Node2")
            FNode2 = i;
    }

    vd_struct.edgeCount = S1->Count;

    vd_struct.edge = new double*[vd_struct.edgeCount]; // VD_edge
    for (int i = 0; i < vd_struct.edgeCount; ++i) {
		vd_struct.edge[i] = new double[5];
    }

    for (int i = 1; i < vd_struct.edgeCount; i++) {
        try {
            T1->CommaText = S1->Strings[i];

            vd_struct.edge[i][0] = StrToFloat(T1[0][FNode1]) * MULTICOEF;
            vd_struct.edge[i][1] = StrToFloat(T1[0][FNode2]) * MULTICOEF;

            try {
                vd_struct.edge[i][2] = StrToFloat(T1[0][FX]) * MULTICOEF;
                vd_struct.edge[i][3] = StrToFloat(T1[0][FY]) * MULTICOEF;
                vd_struct.edge[i][4] = StrToFloat(T1[0][FZ]) * MULTICOEF;
            } catch (...) {
                vd_struct.edge[i][2] = 0;
                vd_struct.edge[i][3] = 0;
                vd_struct.edge[i][4] = 0;
            }
        } catch (...) {
        }
    }
	return vd_struct;
}

//---------------------------------------------------------------------------
// Отрисовка звёзд
//---------------------------------------------------------------------------
void __fastcall TFormStarcube::DrawPoints()
{
    bool fileLoaded = LoadFiles->Enabled;
    if (fileLoaded)
        return;

    GLPoints1->Free();
    GLPoints1 = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));

    GLPoints1->Size = 2;
    GLPoints1->Positions->Clear();
    float X, Y, Z, R, G, B;

    if (ClassGroup->ItemIndex == 0) {
        for (int i = 0; i < STARS.size(); i++) {
            for (int j = 0; j < STARS[i].delaunay.nodeCount; j++) {
                try {
                    X = STARS[i].delaunay.node[j][0] * MULTICOEF;
                    Y = STARS[i].delaunay.node[j][1] * MULTICOEF;
                    Z = STARS[i].delaunay.node[j][2] * MULTICOEF;

                    GLPoints1->Positions->Add(X, Y, Z);
                    GLPoints1->Colors->AddPoint(
                        STARS[i].R, STARS[i].G, STARS[i].B);
                } catch (...) {
                }
            }
        }
	} else {
        int selectedStarClass = ClassGroup->ItemIndex - 1;
        for (int j = 0; j < STARS[selectedStarClass].delaunay.nodeCount; j++) {
            try {
                X = STARS[selectedStarClass].delaunay.node[j][0] * MULTICOEF;
                Y = STARS[selectedStarClass].delaunay.node[j][1] * MULTICOEF;
                Z = STARS[selectedStarClass].delaunay.node[j][2] * MULTICOEF;

                GLPoints1->Positions->Add(X, Y, Z);
                GLPoints1->Colors->AddPoint(STARS[selectedStarClass].R,
                    STARS[selectedStarClass].G, STARS[selectedStarClass].B);
            } catch (...) {
            }
        }
    }
}

//---------------------------------------------------------------------------
// Отрисовка тетраэдров Делоне
//---------------------------------------------------------------------------
void __fastcall TFormStarcube::DrawDelaunay()
{
	bool fileLoaded = LoadFiles->Enabled;
	if (fileLoaded)
		return;

	GLLines1->Free();
	GLLines1 = (TGLLines*)(GLDummyCube1->AddNewChild(__classid(TGLLines)));
	GLLines1->NodesAspect = lnaInvisible;

	float X1, Y1, Z1, X2, Y2, Z2, R, G, B;
    int NodeIndex1, NodeIndex2, NodeIndex3;
    GLLines1->LineColor->SetColor(255, 255, 255, 0.4);

    if (ClassGroup->ItemIndex == 0) {
        for (int i = 0; i < STARS.size(); i++) {
            for (int j = 0; j < STARS[i].delaunay.edgeCount; j++) {
                try {
                    NodeIndex1 = STARS[i].delaunay.edge[j][0];
                    NodeIndex2 = STARS[i].delaunay.edge[j][1];

                    X1 = STARS[i].delaunay.node[NodeIndex1][0] * MULTICOEF;
                    Y1 = STARS[i].delaunay.node[NodeIndex1][1] * MULTICOEF;
                    Z1 = STARS[i].delaunay.node[NodeIndex1][2] * MULTICOEF;

                    X2 = STARS[i].delaunay.node[NodeIndex2][0] * MULTICOEF;
                    Y2 = STARS[i].delaunay.node[NodeIndex2][1] * MULTICOEF;
                    Z2 = STARS[i].delaunay.node[NodeIndex2][2] * MULTICOEF;

                    GLLines1->Nodes->AddNode(X1, Y1, Z1);
                    GLLines1->Nodes->AddNode(X2, Y2, Z2);
                } catch (...) {
                }
            }
        }
    } else {
        int selectedStarClass = ClassGroup->ItemIndex - 1;
        for (int j = 0; j < STARS[selectedStarClass].delaunay.edgeCount; j++) {
			try {
                NodeIndex1 = STARS[selectedStarClass].delaunay.edge[j][0];
                NodeIndex2 = STARS[selectedStarClass].delaunay.edge[j][1];

                X1 = STARS[selectedStarClass].delaunay.node[NodeIndex1][0] *
                     MULTICOEF;
                Y1 = STARS[selectedStarClass].delaunay.node[NodeIndex1][1] *
                     MULTICOEF;
                Z1 = STARS[selectedStarClass].delaunay.node[NodeIndex1][2] *
                     MULTICOEF;

                X2 = STARS[selectedStarClass].delaunay.node[NodeIndex2][0] *
                     MULTICOEF;
                Y2 = STARS[selectedStarClass].delaunay.node[NodeIndex2][1] *
                     MULTICOEF;
                Z2 = STARS[selectedStarClass].delaunay.node[NodeIndex2][2] *
                     MULTICOEF;

                GLLines1->Nodes->AddNode(X1, Y1, Z1);
                GLLines1->Nodes->AddNode(X2, Y2, Z2);
                GLLines1->LineColor->SetColor(STARS[selectedStarClass].R,
                    STARS[selectedStarClass].G, STARS[selectedStarClass].B,
                    0.3);
            } catch (...) {
            }
        }
    }
}
//---------------------------------------------------------------------------
// Отрисовка полиэдров Вороного
void __fastcall TFormStarcube::DrawVoronoi()
{
    bool fileLoaded = LoadFiles->Enabled;
    if (fileLoaded)
        return;

    GLLines2->Free();
    GLLines2 = (TGLLines*)(GLDummyCube1->AddNewChild(__classid(TGLLines)));
    GLLines2->NodesAspect = lnaInvisible;
    float X, Y, Z, R, G, B;
    float X1, Y1, Z1, X2, Y2, Z2;
    int NodeIndex1, NodeIndex2;

    GLLines2->LineColor->SetColor(255, 255, 255, 0.3);

    if (ClassGroup->ItemIndex == 0) {
        for (int i = 0; i < STARS.size(); i++) {
            for (int j = 0; j < STARS[i].voronoi.edgeCount; j++) {
                try {
                    NodeIndex1 = STARS[i].voronoi.edge[j][0];
                    NodeIndex2 = STARS[i].voronoi.edge[j][1];

                    X1 = STARS[i].voronoi.node[NodeIndex1][0] * MULTICOEF;
                    Y1 = STARS[i].voronoi.node[NodeIndex1][1] * MULTICOEF;
                    Z1 = STARS[i].voronoi.node[NodeIndex1][2] * MULTICOEF;

					if (NodeIndex2 == -1) {
                        X2 = STARS[i].voronoi.edge[j][2];
                        Y2 = STARS[i].voronoi.edge[j][3];
                        Z2 = STARS[i].voronoi.edge[j][4];
                    } else {
                        X2 = STARS[i].voronoi.node[NodeIndex2][0] * MULTICOEF;
                        Y2 = STARS[i].voronoi.node[NodeIndex2][1] * MULTICOEF;
                        Z2 = STARS[i].voronoi.node[NodeIndex2][2] * MULTICOEF;
                    }

                    GLLines2->Nodes->AddNode(X1, Y1, Z1);
                    GLLines2->Nodes->AddNode(X2, Y2, Z2);
                } catch (...) {
                }
            }
        }
    } else {
        int selectedStarClass = ClassGroup->ItemIndex - 1;
        for (int j = 0; j < STARS[selectedStarClass].voronoi.edgeCount; j++) {
            try {
                NodeIndex1 = STARS[selectedStarClass].voronoi.edge[j][0];
                NodeIndex2 = STARS[selectedStarClass].voronoi.edge[j][1];

                X1 = STARS[selectedStarClass].voronoi.node[NodeIndex1][0] *
                     MULTICOEF;
                Y1 = STARS[selectedStarClass].voronoi.node[NodeIndex1][1] *
                     MULTICOEF;
                Z1 = STARS[selectedStarClass].voronoi.node[NodeIndex1][2] *
					 MULTICOEF;

                if (NodeIndex2 == -1) {
                    X2 = STARS[selectedStarClass].voronoi.edge[j][2];
                    Y2 = STARS[selectedStarClass].voronoi.edge[j][3];
                    Z2 = STARS[selectedStarClass].voronoi.edge[j][4];
                } else {
                    X2 = STARS[selectedStarClass].voronoi.node[NodeIndex2][0] *
                         MULTICOEF;
                    Y2 = STARS[selectedStarClass].voronoi.node[NodeIndex2][1] *
                         MULTICOEF;
                    Z2 = STARS[selectedStarClass].voronoi.node[NodeIndex2][2] *
                         MULTICOEF;
                }

                GLLines2->Nodes->AddNode(X1, Y1, Z1);
                GLLines2->Nodes->AddNode(X2, Y2, Z2);
                GLLines2->LineColor->SetColor(STARS[selectedStarClass].R,
                    STARS[selectedStarClass].G, STARS[selectedStarClass].B,
                    0.3);
            } catch (...) {
            }
        }
    }
}

// Общая функция выбора отрисовки
void __fastcall TFormStarcube::InitDraw()
{

    switch (MODE) {
        case 0:
            DrawPoints();
            break;
        case 1:
            DrawDelaunay();
            break;
        default:
            DrawVoronoi();
    }
}
//---------------------------------------------------------------------------
__fastcall TFormStarcube::TFormStarcube(TComponent* Owner) : TForm(Owner) {}
//---------------------------------------------------------------------------
void __fastcall TFormStarcube::GLCadencer1Progress(
    TObject* Sender, const double deltaTime, const double newTime)
{
    GLSceneViewer1->Invalidate();
}
//---------------------------------------------------------------------------
// Старт загрузки файлов
void __fastcall TFormStarcube::clbSpectrasClickCheck(TObject* Sender)
{
    // Init draw method on each checkbox selecting
    InitDraw();
}
//---------------------------------------------------------------------------
void __fastcall TFormStarcube::Data1Click(TObject* Sender)
{
    FormTableStars->Show();
}
//---------------------------------------------------------------------------

void __fastcall TFormStarcube::ClassGroupClick(TObject* Sender)
{
    InitDraw();
}
//---------------------------------------------------------------------------

void __fastcall TFormStarcube::Panel2Click(TObject* Sender)
{
    ClassGroup->ItemIndex = ((TPanel*)(Sender))->Tag;
}
//---------------------------------------------------------------------------

void __fastcall TFormStarcube::clbMethodsClickCheck(TObject* Sender)
{
    GLPoints1->Free();
    GLPoints1 = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
    GLLines1->Free();
    GLLines1 = (TGLLines*)(GLDummyCube1->AddNewChild(__classid(TGLLines)));
    GLLines2->Free();
    GLLines2 = (TGLLines*)(GLDummyCube1->AddNewChild(__classid(TGLLines)));
    VoxelDummy->Free();
	VoxelDummy =
        (TGLDummyCube*)(GLDummyCube1->AddNewChild(__classid(TGLDummyCube)));
    InitDraw();
}

//---------------------------------------------------------------------------
void __fastcall TFormStarcube::LoadFilesClick(TObject* Sender)
{
	LoadFiles->Caption = "Загрузка...";

	for (int i = 0; i < STARS.size(); i++) {
		String type = STAR_CLASS[i];
		STARS[i].type = type;
		STARS[i].delaunay = InitDelaunay(type);
		STARS[i].voronoi = InitVoronoi(type);
		STARS[i].R = COLORS[i][0];
		STARS[i].G = COLORS[i][1];
		STARS[i].B = COLORS[i][2];
	}

	LoadFiles->Caption = "Файлы загружены";
	LoadFiles->Enabled = False;

	// Визуализация
	InitDraw();
}
//---------------------------------------------------------------------------

void __fastcall TFormStarcube::allClear()
{
    StarItem->Checked = false;
    StarItem->Default = false;
    DelaunayItem->Checked = false;
    DelaunayItem->Default = false;
    VoronoiItem->Checked = false;
    VoronoiItem->Default = false;

    GLPoints1->Free();
    GLPoints1 = (TGLPoints*)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));
    GLLines1->Free();
    GLLines1 = (TGLLines*)(GLDummyCube1->AddNewChild(__classid(TGLLines)));
    GLLines2->Free();
    GLLines2 = (TGLLines*)(GLDummyCube1->AddNewChild(__classid(TGLLines)));
    VoxelDummy->Free();
    VoxelDummy =
        (TGLDummyCube*)(GLDummyCube1->AddNewChild(__classid(TGLDummyCube)));
}

void __fastcall TFormStarcube::StarItemClick(TObject* Sender)
{
    allClear();
    MODE = 0;
    StarItem->Checked = true;
    StarItem->Default = true;
    InitDraw();
}
//---------------------------------------------------------------------------

void __fastcall TFormStarcube::DelaunayItemClick(TObject* Sender)
{
    allClear();
    MODE = 1;
    DelaunayItem->Checked = true;
    DelaunayItem->Default = true;
    InitDraw();
}
//---------------------------------------------------------------------------

void __fastcall TFormStarcube::VoronoiItemClick(TObject* Sender)
{
    allClear();
    MODE = 2;
    VoronoiItem->Checked = true;
    VoronoiItem->Default = true;
    InitDraw();
}
//---------------------------------------------------------------------------


void __fastcall TFormStarcube::N8Click(TObject *Sender)
{
	FormStarcube->Close();
}
//---------------------------------------------------------------------------

