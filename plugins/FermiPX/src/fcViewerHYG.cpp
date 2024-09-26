//---------------------------------------------------------------------------

#include <vcl.h>
#include <cstdlib>
#include <ctime>
#include <typeinfo>
#include <fstream>
#include <string>
#pragma hdrstop

#include "fcViewerHYG.h"
#include "fcTableGrid.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "GLS.Cadencer"
#pragma link "GLS.Objects"
#pragma link "GLS.Scene"
#pragma link "GLS.SceneViewer"
#pragma link "GLS.GeomObjects"
#pragma link "GLS.VectorFileObjects"
#pragma link "GLS.Mesh"
#pragma link "GLS.BaseClasses"
#pragma link "GLS.Coordinates"
#pragma resource "*.dfm"
TFormViewerHYG *FormViewerHYG;

int mx, my; // vars for saving position
TFileName datapath = ".\\..\\..\\DATA\\";

// All Delaunay structs
DelaunayBase O_Delaunay; DelaunayBase A_Delaunay;
DelaunayBase B_Delaunay; DelaunayBase F_Delaunay;
DelaunayBase G_Delaunay; DelaunayBase K_Delaunay;
DelaunayBase M_Delaunay;

// All Voronoi structs
VoronoiBase O_Voronoi; VoronoiBase A_Voronoi;
VoronoiBase B_Voronoi; VoronoiBase F_Voronoi;
VoronoiBase G_Voronoi; VoronoiBase K_Voronoi;
VoronoiBase M_Voronoi;

// Colors for each star class
float lightblue[3] = {0, 0.8, 1};       // O class
float skyblue[3] = {0.803, 1, 1};       // B class
float white[3] = {1, 1, 1};             // A class
float lightyellow[3] = {0.996, 1, 0.6}; // F class
float yellow[3] = {1, 1, 0.003};        // G class
float orange[3] = {1, 0.4, 0};          // K class
float red[3] = {0.992, 0, 0.003};       // M class
//---------------------------------------------------------------------------
// Init Delaunay struct
DelaunayBase __fastcall TFormViewerHYG::InitDelaunay(String filename, float color[])
{
	// Connect to specified DB
	FDConnection1->Connected = false;
	FDConnection1->DriverName = "SQLite";
	FDConnection1->LoginPrompt = false;
	FDConnection1->Params->DriverID = "SQLite";
	FDConnection1->Params->Database = datapath + filename;
	FDConnection1->Connected = true;

	// Init struct for DT
	DelaunayBase dt_struct;

	// Getting all vertices for current class of stars
	FDQuery1->Close();
	FDQuery1->Connection = FDConnection1;
	FDQuery1->SQL->Clear();
	FDQuery1->SQL->Text = "SELECT x,y,z FROM dt_node";
	FDQuery1->Open();

	// Go to last record, count all vertices and go to first record
	FDQuery1->Last();
	dt_struct.nodeCount = FDQuery1->RecordCount; // DT_node count
	FDQuery1->First();

	dt_struct.node = new double*[dt_struct.nodeCount]; // DT_node
	for (int i = 0; i < dt_struct.nodeCount; ++i)
		dt_struct.node[i] = new double[3];

	// Init nodes with saved coordinates
	FDQuery1->First();
	for (int i = 0; i < dt_struct.nodeCount; i++) {
		dt_struct.node[i][0] = FDQuery1->FieldByName("x")->AsFloat;
		dt_struct.node[i][1] = FDQuery1->FieldByName("y")->AsFloat;
		dt_struct.node[i][2] = FDQuery1->FieldByName("z")->AsFloat;
		FDQuery1->Next();
	}
	//-------------------------------------------------------------------------
	// Getting all edges for current class of stars
	FDQuery1->Close();
	FDQuery1->SQL->Clear();
	FDQuery1->SQL->Text = "SELECT Node1, Node2 FROM dt_edge";
	FDQuery1->Open();

	// Go to last record, count all edges and go to first record
	FDQuery1->Last();
	dt_struct.edgeCount = FDQuery1->RecordCount; // DT_edge count
	FDQuery1->First();

	dt_struct.edge = new int*[dt_struct.edgeCount]; // DT_edge
	for (int i = 0; i < dt_struct.edgeCount; ++i) {
		dt_struct.edge[i] = new int[2];
	}

	// Init edges
	FDQuery1->First();
	for (int i = 0; i < dt_struct.edgeCount; i++) {
		dt_struct.edge[i][0] = FDQuery1->FieldByName("Node1")->AsInteger;
		dt_struct.edge[i][1] = FDQuery1->FieldByName("Node2")->AsInteger;
		FDQuery1->Next();
	}
	//---------------------------------------------------------------------------
	// Getting all faces for current class of stars
	/*
	FDQuery1->Close();
	FDQuery1->SQL->Clear();
	FDQuery1->SQL->Text = "SELECT Node1, Node2, Node3 FROM dt_face";
	FDQuery1->Open();

	// Go to last record, count all faces and go to first record
	FDQuery1->Last();
	dt_struct.faceCount = FDQuery1->RecordCount; // DT_face count
	FDQuery1->First();

	dt_struct.face = new int*[dt_struct.faceCount]; // DT_face
	for (int i = 0; i < dt_struct.faceCount; ++i) {
		dt_struct.face[i] = new int[3];
	}

	// Init faces
	FDQuery1->First();
	for (int i = 0; i < dt_struct.edgeCount; i++) {
		dt_struct.face[i][0] = FDQuery1->FieldByName("Node1")->AsFloat;
		dt_struct.face[i][1] = FDQuery1->FieldByName("Node2")->AsFloat;
		dt_struct.face[i][2] = FDQuery1->FieldByName("Node3")->AsFloat;
		FDQuery1->Next();
	}
	*/
    //---------------------------------------------------------------------------
	/*
	// Getting all tetrahedrons for current class of stars
	FDQuery1->Close();
	FDQuery1->SQL->Clear();
	FDQuery1->SQL->Text = "SELECT Node1, Node2, Node3, Node4 FROM dt_ele";
	FDQuery1->Open();

	// Go to last record, count all tetrahedrons and go to first record
	FDQuery1->Last();
	dt_struct.tetraCount = FDQuery1->RecordCount; // DT_ele count
	FDQuery1->First();

	dt_struct.tetra = new int*[dt_struct.tetraCount]; // DT_ele
	for (int i = 0; i < dt_struct.tetraCount; ++i) {
		dt_struct.tetra[i] = new int[4];
	}

	// Init tetrahedrons
	FDQuery1->First();
	for (int i = 0; i < dt_struct.tetraCount; i++) {
		dt_struct.tetra[i][0] = FDQuery1->FieldByName("Node1")->AsFloat;
		dt_struct.tetra[i][1] = FDQuery1->FieldByName("Node2")->AsFloat;
		dt_struct.tetra[i][2] = FDQuery1->FieldByName("Node3")->AsFloat;
		dt_struct.tetra[i][3] = FDQuery1->FieldByName("Node4")->AsFloat;
		FDQuery1->Next();
	}
	*/

	// Init class color
	dt_struct.color = color;

	return dt_struct;
}
//---------------------------------------------------------------------------
// Init Voronoi struct
VoronoiBase __fastcall TFormViewerHYG::InitVoronoi(String filename, float color[])
{
	// Connect to specified DB
	FDConnection1->Connected = False;
	FDConnection1->DriverName = "SQLite";
	FDConnection1->LoginPrompt = False;
	FDConnection1->Params->DriverID = "SQLite";
	FDConnection1->Params->Database = datapath + filename;
	FDConnection1->Connected = True;

	// Init struct for VD
	VoronoiBase vd_struct;

	// Getting all vertices for current class of stars
	FDQuery1->Close();
	FDQuery1->Connection = FDConnection1;
	FDQuery1->SQL->Clear();
	FDQuery1->SQL->Text = "SELECT x,y,z FROM vd_node";
	FDQuery1->Open();

	// Go to last record, count all vertices and go to first record
	FDQuery1->Last();
	vd_struct.nodeCount = FDQuery1->RecordCount; // VD_node count
	FDQuery1->First();

	vd_struct.node = new double*[vd_struct.nodeCount]; // VD_node
	for (int i = 0; i < vd_struct.nodeCount; ++i)
		vd_struct.node[i] = new double[3];

	// Init nodes with saved coordinates
	FDQuery1->First();
	for (int i = 0; i < vd_struct.nodeCount; i++) {
		vd_struct.node[i][0] = FDQuery1->FieldByName("x")->AsFloat;
		vd_struct.node[i][1] = FDQuery1->FieldByName("y")->AsFloat;
		vd_struct.node[i][2] = FDQuery1->FieldByName("z")->AsFloat;
		FDQuery1->Next();
	}
	//-------------------------------------------------------------------------
	// Getting all edges for current class of stars
	FDQuery1->Close();
	FDQuery1->SQL->Clear();
	FDQuery1->SQL->Text = "SELECT Node1, Node2, x, y, z FROM vd_edge";
	FDQuery1->Open();

	// Go to last record, count all edges and go to first record
	FDQuery1->Last();
	vd_struct.edgeCount = FDQuery1->RecordCount; // VD_edge count
	FDQuery1->First();

	vd_struct.edge = new double*[vd_struct.edgeCount]; // VD_edge
	for (int i = 0; i < vd_struct.edgeCount; ++i) {
		vd_struct.edge[i] = new double[5];
	}

	// Init edges
	FDQuery1->First();
	for (int i = 0; i < vd_struct.edgeCount; i++) {
		vd_struct.edge[i][0] = FDQuery1->FieldByName("Node1")->AsFloat;
		vd_struct.edge[i][1] = FDQuery1->FieldByName("Node2")->AsFloat;

		// Prevent null value instead of float
		if (FDQuery1->FieldByName("x") && \
			FDQuery1->FieldByName("y") &&
			FDQuery1->FieldByName("z"))
		{
			vd_struct.edge[i][2] = 0;
			vd_struct.edge[i][3] = 0;
			vd_struct.edge[i][4] = 0;
		}
		else
		{
			vd_struct.edge[i][2] = FDQuery1->FieldByName("x")->AsFloat;
			vd_struct.edge[i][3] = FDQuery1->FieldByName("y")->AsFloat;
			vd_struct.edge[i][4] = FDQuery1->FieldByName("z")->AsFloat;
		}
		FDQuery1->Next();
	}
	vd_struct.color = color;
	return vd_struct;
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::DrawPoints()
{
	// Delete all points from the scene
	pointStars->Free();
 	pointStars = (TGLPoints *)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));

	// Delete all lines from the scene
	GLLines1->Free();
	GLLines1 = (TGLLines *)(GLDummyCube1->AddNewChild(__classid(TGLLines)));

	// Temp vars for coordinates and colors values
	for(int i = 0; i < CheckListBox1->Items->Count; i++)
	{
		if(CheckListBox1->Checked[i])
		{
			switch (i)
			{
				case 0:
					for (int i = 0; i < A_Delaunay.nodeCount; i++) {

						x = A_Delaunay.node[i][0]*0.05;
						y = A_Delaunay.node[i][1]*0.05;
						z = A_Delaunay.node[i][2]*0.05;

						r = A_Delaunay.color[0];
						g = A_Delaunay.color[1];
						b = A_Delaunay.color[2];

						pointStars->Size = 2;
						pointStars->Positions->Add(x, y, z);
						pointStars->Colors->AddPoint(r, g, b);
					}
					break;
				case 1:
					for (int i = 0; i < B_Delaunay.nodeCount; i++) {

						x = B_Delaunay.node[i][0]*0.05;
						y = B_Delaunay.node[i][1]*0.05;
						z = B_Delaunay.node[i][2]*0.05;

						r = B_Delaunay.color[0];
						g = B_Delaunay.color[1];
						b = B_Delaunay.color[2];

						pointStars->Size = 2;
						pointStars->Positions->Add(x, y, z);
						pointStars->Colors->AddPoint(r, g, b);
					}
					break;
				case 2:
					for (int i = 0; i < F_Delaunay.nodeCount; i++) {

						x = F_Delaunay.node[i][0]*0.05;
						y = F_Delaunay.node[i][1]*0.05;
						z = F_Delaunay.node[i][2]*0.05;

						r = F_Delaunay.color[0];
						g = F_Delaunay.color[1];
						b = F_Delaunay.color[2];

						pointStars->Size = 2;
						pointStars->Positions->Add(x, y, z);
						pointStars->Colors->AddPoint(r, g, b);
					}
					break;
				case 3:
					for (int i = 0; i < G_Delaunay.nodeCount; i++) {

						x = G_Delaunay.node[i][0]*0.05;
						y = G_Delaunay.node[i][1]*0.05;
						z = G_Delaunay.node[i][2]*0.05;

						r = G_Delaunay.color[0];
						g = G_Delaunay.color[1];
						b = G_Delaunay.color[2];

						pointStars->Size = 2;
						pointStars->Positions->Add(x, y, z);
						pointStars->Colors->AddPoint(r, g, b);
					}
					break;
				case 4:
					for (int i = 0; i < K_Delaunay.nodeCount; i++) {

						x = K_Delaunay.node[i][0]*0.05;
						y = K_Delaunay.node[i][1]*0.05;
						z = K_Delaunay.node[i][2]*0.05;

						r = K_Delaunay.color[0];
						g = K_Delaunay.color[1];
						b = K_Delaunay.color[2];

						pointStars->Size = 2;
						pointStars->Positions->Add(x, y, z);
						pointStars->Colors->AddPoint(r, g, b);
					}
					break;
				case 5:
					for (int i = 0; i < M_Delaunay.nodeCount; i++) {

						x = M_Delaunay.node[i][0]*0.05;
						y = M_Delaunay.node[i][1]*0.05;
						z = M_Delaunay.node[i][2]*0.05;

						r = M_Delaunay.color[0];
						g = M_Delaunay.color[1];
						b = M_Delaunay.color[2];

						pointStars->Size = 2;
						pointStars->Positions->Add(x, y, z);
						pointStars->Colors->AddPoint(r, g, b);
					}
					break;
				case 6:
					for (int i = 0; i < O_Delaunay.nodeCount; i++) {

						x = O_Delaunay.node[i][0]*0.05;
						y = O_Delaunay.node[i][1]*0.05;
						z = O_Delaunay.node[i][2]*0.05;

						r = O_Delaunay.color[0];
						g = O_Delaunay.color[1];
						b = O_Delaunay.color[2];

						pointStars->Size = 2;
						pointStars->Positions->Add(x, y, z);
						pointStars->Colors->AddPoint(r, g, b);
					}
					break;
			}
		}
	}
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::DrawDelaunay()
{
	// Delete all points from the scene
	pointStars->Free();
	pointStars = (TGLPoints *)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));

	// Delete all lines from the scene
	GLLines1->Free();
	GLLines1 = (TGLLines *)(GLDummyCube1->AddNewChild(__classid(TGLLines)));

	// Delete all faces from the scene
	//GLPolygon1->Free();
	//GLPolygon1 = (TGLPolygon *)(GLDummyCube1->AddNewChild(__classid(TGLPolygon)));

	float X1, Y1, Z1, X2, Y2, Z2, r, g, b;
	int NodeIndex1, NodeIndex2, NodeIndex3;

	for(int i = 0; i < CheckListBox1->Items->Count; i++)
	{
		if(CheckListBox1->Checked[i])
		{
			switch (i)
			{
				case 0:
					r = A_Delaunay.color[0];
					g = A_Delaunay.color[1];
					b = A_Delaunay.color[2];

					for (int i = 0; i < A_Delaunay.edgeCount; i++) {
						NodeIndex1 = A_Delaunay.edge[i][0];
						NodeIndex2 = A_Delaunay.edge[i][1];

						X1 = A_Delaunay.node[NodeIndex1][0]*0.05;
						Y1 = A_Delaunay.node[NodeIndex1][1]*0.05;
						Z1 = A_Delaunay.node[NodeIndex1][2]*0.05;

						X2 = A_Delaunay.node[NodeIndex2][0]*0.05;
						Y2 = A_Delaunay.node[NodeIndex2][1]*0.05;
						Z2 = A_Delaunay.node[NodeIndex2][2]*0.05;

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 1:
					r = B_Delaunay.color[0];
					g = B_Delaunay.color[1];
					b = B_Delaunay.color[2];

					for (int i = 0; i < B_Delaunay.edgeCount; i++) {
						NodeIndex1 = B_Delaunay.edge[i][0];
						NodeIndex2 = B_Delaunay.edge[i][1];

						X1 = B_Delaunay.node[NodeIndex1][0]*0.05;
						Y1 = B_Delaunay.node[NodeIndex1][1]*0.05;
						Z1 = B_Delaunay.node[NodeIndex1][2]*0.05;

						X2 = B_Delaunay.node[NodeIndex2][0]*0.05;
						Y2 = B_Delaunay.node[NodeIndex2][1]*0.05;
						Z2 = B_Delaunay.node[NodeIndex2][2]*0.05;

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 2:
					r = F_Delaunay.color[0];
					g = F_Delaunay.color[1];
					b = F_Delaunay.color[2];

					for (int i = 0; i < F_Delaunay.edgeCount; i++) {
						NodeIndex1 = F_Delaunay.edge[i][0];
						NodeIndex2 = F_Delaunay.edge[i][1];

						X1 = F_Delaunay.node[NodeIndex1][0]*0.05;
						Y1 = F_Delaunay.node[NodeIndex1][1]*0.05;
						Z1 = F_Delaunay.node[NodeIndex1][2]*0.05;

						X2 = F_Delaunay.node[NodeIndex2][0]*0.05;
						Y2 = F_Delaunay.node[NodeIndex2][1]*0.05;
						Z2 = F_Delaunay.node[NodeIndex2][2]*0.05;

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 3:
                    r = G_Delaunay.color[0];
					g = G_Delaunay.color[1];
					b = G_Delaunay.color[2];

					for (int i = 0; i < G_Delaunay.edgeCount; i++) {
						NodeIndex1 = G_Delaunay.edge[i][0];
						NodeIndex2 = G_Delaunay.edge[i][1];

						X1 = G_Delaunay.node[NodeIndex1][0]*0.05;
						Y1 = G_Delaunay.node[NodeIndex1][1]*0.05;
						Z1 = G_Delaunay.node[NodeIndex1][2]*0.05;

						X2 = G_Delaunay.node[NodeIndex2][0]*0.05;
						Y2 = G_Delaunay.node[NodeIndex2][1]*0.05;
						Z2 = G_Delaunay.node[NodeIndex2][2]*0.05;

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 4:
                    r = K_Delaunay.color[0];
					g = K_Delaunay.color[1];
					b = K_Delaunay.color[2];

					for (int i = 0; i < K_Delaunay.edgeCount; i++) {
						NodeIndex1 = K_Delaunay.edge[i][0];
						NodeIndex2 = K_Delaunay.edge[i][1];

						X1 = K_Delaunay.node[NodeIndex1][0]*0.05;
						Y1 = K_Delaunay.node[NodeIndex1][1]*0.05;
						Z1 = K_Delaunay.node[NodeIndex1][2]*0.05;

						X2 = K_Delaunay.node[NodeIndex2][0]*0.05;
						Y2 = K_Delaunay.node[NodeIndex2][1]*0.05;
						Z2 = K_Delaunay.node[NodeIndex2][2]*0.05;

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 5:
                    r = M_Delaunay.color[0];
					g = M_Delaunay.color[1];
					b = M_Delaunay.color[2];

					for (int i = 0; i < M_Delaunay.edgeCount; i++) {
						NodeIndex1 = M_Delaunay.edge[i][0];
						NodeIndex2 = M_Delaunay.edge[i][1];

						X1 = M_Delaunay.node[NodeIndex1][0]*0.05;
						Y1 = M_Delaunay.node[NodeIndex1][1]*0.05;
						Z1 = M_Delaunay.node[NodeIndex1][2]*0.05;

						X2 = M_Delaunay.node[NodeIndex2][0]*0.05;
						Y2 = M_Delaunay.node[NodeIndex2][1]*0.05;
						Z2 = M_Delaunay.node[NodeIndex2][2]*0.05;

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 6:
					r = O_Delaunay.color[0];
					g = O_Delaunay.color[1];
					b = O_Delaunay.color[2];

					for (int i = 0; i < O_Delaunay.edgeCount; i++) {
						NodeIndex1 = O_Delaunay.edge[i][0];
						NodeIndex2 = O_Delaunay.edge[i][1];

						X1 = O_Delaunay.node[NodeIndex1][0]*0.05;
						Y1 = O_Delaunay.node[NodeIndex1][1]*0.05;
						Z1 = O_Delaunay.node[NodeIndex1][2]*0.05;

						X2 = O_Delaunay.node[NodeIndex2][0]*0.05;
						Y2 = O_Delaunay.node[NodeIndex2][1]*0.05;
						Z2 = O_Delaunay.node[NodeIndex2][2]*0.05;

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;

					/*
					for (int i = 0; i < O_Delaunay.faceCount-1; i++) {
						GLPolygon1 = (TGLPolygon *)(GLDummyCube1->AddNewChild(__classid(TGLPolygon)));

						NodeIndex1 = O_Delaunay.face[i][0];
						NodeIndex2 = O_Delaunay.face[i][1];
						NodeIndex3 = O_Delaunay.face[i][2];

						GLPolygon1->AddNode(O_Delaunay.node[NodeIndex1][0]*0.05,
										O_Delaunay.node[NodeIndex1][1]*0.05,
										O_Delaunay.node[NodeIndex1][2]*0.05);

						GLPolygon1->AddNode(O_Delaunay.node[NodeIndex2][0]*0.05,
										O_Delaunay.node[NodeIndex2][1]*0.05,
										O_Delaunay.node[NodeIndex2][2]*0.05);

						GLPolygon1->AddNode(O_Delaunay.node[NodeIndex3][0]*0.05,
										O_Delaunay.node[NodeIndex3][1]*0.05,
										O_Delaunay.node[NodeIndex3][2]*0.05);

						GLPolygon1->Material->PolygonMode = pmFill;
						GLPolygon1->Material->FrontProperties->Diffuse->SetColor(r, g, b, 1);
					} */
					break;
			}
		}
	}
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::DrawVoronoi()
{
	// Delete all points from the scene
	pointStars->Free();
	pointStars = (TGLPoints *)(GLDummyCube1->AddNewChild(__classid(TGLPoints)));

	// Delete all lines from the scene
	GLLines1->Free();
	GLLines1 = (TGLLines *)(GLDummyCube1->AddNewChild(__classid(TGLLines)));

	// Temp vars for coordinates and colors values
	float x, y, z, r, g, b;
	float X1, Y1, Z1, X2, Y2, Z2;
	int NodeIndex1, NodeIndex2;

	for(int i = 0; i < CheckListBox1->Items->Count; i++)
	{
		if(CheckListBox1->Checked[i])
		{
			switch (i)
			{
				case 0:
					r = A_Voronoi.color[0];
					g = A_Voronoi.color[1];
					b = A_Voronoi.color[2];

					for (int i = 0; i < A_Voronoi.edgeCount; i++) {
						NodeIndex1 = A_Voronoi.edge[i][0];
						NodeIndex2 = A_Voronoi.edge[i][1];

						X1 = A_Voronoi.node[NodeIndex1][0]*0.05;
						Y1 = A_Voronoi.node[NodeIndex1][1]*0.05;
						Z1 = A_Voronoi.node[NodeIndex1][2]*0.05;

						if (NodeIndex2 == -1) {
							X2 = A_Voronoi.edge[i][2];
							Y2 = A_Voronoi.edge[i][3];
							Z2 = A_Voronoi.edge[i][4];
						}
						else
						{
							X2 = A_Voronoi.node[NodeIndex2][0]*0.05;
							Y2 = A_Voronoi.node[NodeIndex2][1]*0.05;
							Z2 = A_Voronoi.node[NodeIndex2][2]*0.05;
						}

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 1:
					r = B_Voronoi.color[0];
					g = B_Voronoi.color[1];
					b = B_Voronoi.color[2];

					for (int i = 0; i < B_Voronoi.edgeCount; i++) {
						NodeIndex1 = B_Voronoi.edge[i][0];
						NodeIndex2 = B_Voronoi.edge[i][1];

						X1 = B_Voronoi.node[NodeIndex1][0]*0.05;
						Y1 = B_Voronoi.node[NodeIndex1][1]*0.05;
						Z1 = B_Voronoi.node[NodeIndex1][2]*0.05;

						if (NodeIndex2 == -1) {
							X2 = B_Voronoi.edge[i][2];
							Y2 = B_Voronoi.edge[i][3];
							Z2 = B_Voronoi.edge[i][4];
						}
						else
						{
							X2 = B_Voronoi.node[NodeIndex2][0]*0.05;
							Y2 = B_Voronoi.node[NodeIndex2][1]*0.05;
							Z2 = B_Voronoi.node[NodeIndex2][2]*0.05;
						}

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 2:
					r = F_Voronoi.color[0];
					g = F_Voronoi.color[1];
					b = F_Voronoi.color[2];

					for (int i = 0; i < F_Voronoi.edgeCount; i++) {
						NodeIndex1 = F_Voronoi.edge[i][0];
						NodeIndex2 = F_Voronoi.edge[i][1];

						X1 = F_Voronoi.node[NodeIndex1][0]*0.05;
						Y1 = F_Voronoi.node[NodeIndex1][1]*0.05;
						Z1 = F_Voronoi.node[NodeIndex1][2]*0.05;

						if (NodeIndex2 == -1) {
							X2 = F_Voronoi.edge[i][2];
							Y2 = F_Voronoi.edge[i][3];
							Z2 = F_Voronoi.edge[i][4];
						}
						else
						{
							X2 = F_Voronoi.node[NodeIndex2][0]*0.05;
							Y2 = F_Voronoi.node[NodeIndex2][1]*0.05;
							Z2 = F_Voronoi.node[NodeIndex2][2]*0.05;
						}

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 3:
					r = G_Voronoi.color[0];
					g = G_Voronoi.color[1];
					b = G_Voronoi.color[2];

					for (int i = 0; i < G_Voronoi.edgeCount; i++) {
						NodeIndex1 = G_Voronoi.edge[i][0];
						NodeIndex2 = G_Voronoi.edge[i][1];

						X1 = G_Voronoi.node[NodeIndex1][0]*0.05;
						Y1 = G_Voronoi.node[NodeIndex1][1]*0.05;
						Z1 = G_Voronoi.node[NodeIndex1][2]*0.05;

						if (NodeIndex2 == -1) {
							X2 = G_Voronoi.edge[i][2];
							Y2 = G_Voronoi.edge[i][3];
							Z2 = G_Voronoi.edge[i][4];
						}
						else
						{
							X2 = G_Voronoi.node[NodeIndex2][0]*0.05;
							Y2 = G_Voronoi.node[NodeIndex2][1]*0.05;
							Z2 = G_Voronoi.node[NodeIndex2][2]*0.05;
						}

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 4:
					r = K_Voronoi.color[0];
					g = K_Voronoi.color[1];
					b = K_Voronoi.color[2];

					for (int i = 0; i < K_Voronoi.edgeCount; i++) {
						NodeIndex1 = K_Voronoi.edge[i][0];
						NodeIndex2 = K_Voronoi.edge[i][1];

						X1 = K_Voronoi.node[NodeIndex1][0]*0.05;
						Y1 = K_Voronoi.node[NodeIndex1][1]*0.05;
						Z1 = K_Voronoi.node[NodeIndex1][2]*0.05;

						if (NodeIndex2 == -1) {
							X2 = K_Voronoi.edge[i][2];
							Y2 = K_Voronoi.edge[i][3];
							Z2 = K_Voronoi.edge[i][4];
						}
						else
						{
							X2 = K_Voronoi.node[NodeIndex2][0]*0.05;
							Y2 = K_Voronoi.node[NodeIndex2][1]*0.05;
							Z2 = K_Voronoi.node[NodeIndex2][2]*0.05;
						}

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 5:
					r = M_Voronoi.color[0];
					g = M_Voronoi.color[1];
					b = M_Voronoi.color[2];

					for (int i = 0; i < M_Voronoi.edgeCount; i++) {
						NodeIndex1 = M_Voronoi.edge[i][0];
						NodeIndex2 = M_Voronoi.edge[i][1];

						X1 = M_Voronoi.node[NodeIndex1][0]*0.05;
						Y1 = M_Voronoi.node[NodeIndex1][1]*0.05;
						Z1 = M_Voronoi.node[NodeIndex1][2]*0.05;

						if (NodeIndex2 == -1) {
							X2 = M_Voronoi.edge[i][2];
							Y2 = M_Voronoi.edge[i][3];
							Z2 = M_Voronoi.edge[i][4];
						}
						else
						{
							X2 = M_Voronoi.node[NodeIndex2][0]*0.05;
							Y2 = M_Voronoi.node[NodeIndex2][1]*0.05;
							Z2 = M_Voronoi.node[NodeIndex2][2]*0.05;
						}

						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
				case 6:
					r = O_Voronoi.color[0];
					g = O_Voronoi.color[1];
					b = O_Voronoi.color[2];

					for (int i = 0; i < O_Voronoi.edgeCount; i++) {
						NodeIndex1 = O_Voronoi.edge[i][0];
						NodeIndex2 = O_Voronoi.edge[i][1];

						X1 = O_Voronoi.node[NodeIndex1][0]*0.05;
						Y1 = O_Voronoi.node[NodeIndex1][1]*0.05;
						Z1 = O_Voronoi.node[NodeIndex1][2]*0.05;

						if (NodeIndex2 == -1) {
							X2 = O_Voronoi.edge[i][2];
							Y2 = O_Voronoi.edge[i][3];
							Z2 = O_Voronoi.edge[i][4];
						}
						else
						{
							X2 = O_Voronoi.node[NodeIndex2][0]*0.05;
							Y2 = O_Voronoi.node[NodeIndex2][1]*0.05;
							Z2 = O_Voronoi.node[NodeIndex2][2]*0.05;
						}
						GLLines1->Nodes->AddNode(X1, Y1, Z1);
						GLLines1->Nodes->AddNode(X2, Y2, Z2);
					}
					// Set edges color
					GLLines1->LineColor->SetColor(r, g, b, 1);
					// Delete axes of points
					GLLines1->NodesAspect = lnaInvisible;
					break;
			}
		}
	}
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::InitDraw()
{
	// Draw 3D model based on selected mode
	if (Points1->Checked == true) {
		DrawPoints();
	}
	else if (Delaunay1->Checked == true) {
		DrawDelaunay();
	}
	else if (Voronoi1->Checked == true) {
		DrawVoronoi();
	}
}
//---------------------------------------------------------------------------
__fastcall TFormViewerHYG::TFormViewerHYG(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::GLSceneViewer1MouseDown(TObject *Sender, TMouseButton Button,
		  TShiftState Shift, int x, int y)
{
	mx = x; my = y;
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::GLSceneViewer1MouseMove(TObject *Sender, TShiftState Shift,
		  int x, int y)
{
	if (Shift.Contains(ssLeft))
	{
		GLCamera1->MoveAroundTarget(my-y, mx-x);
		mx = x; my = y;
	}
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
		  TPoint &MousePos, bool &Handled)
{
	if(GLSceneViewer1->MouseInControl==true)
	{
		GLCamera1->AdjustDistanceToTarget(Power(1.1,-WheelDelta/120));
	}
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::Timer1Timer(TObject *Sender)
{
	FormViewerHYG->StatusBar1->Panels->Items[0]->Text = \
	Format("Total stars: %d", ARRAYOFCONST((pointStars->Positions->Count)));
	FormViewerHYG->StatusBar1->Panels->Items[1]->Text = \
	Format("FPS: %.2f", ARRAYOFCONST((GLSceneViewer1->FramesPerSecond())));
	GLSceneViewer1->ResetPerformanceMonitor();
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::GLCadencer1Progress(TObject *Sender, const double deltaTime,
		  const double newTime)
{
	GLSceneViewer1->Invalidate();
}

//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::Points1Click(TObject *Sender)
{
	if (Points1->Checked == false) Points1->Checked = true;
	FormViewerHYG->Caption = "Viewer HYG | Stars";
	InitDraw();
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::Delaunay1Click(TObject *Sender)
{
	if (Delaunay1->Checked == false) Delaunay1->Checked = true;
	FormViewerHYG->Caption = "Viewer HYG | Delaunay tetranet";
	InitDraw();
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::Voronoi1Click(TObject *Sender)
{
	if (Voronoi1->Checked == false) Voronoi1->Checked = true;
	FormViewerHYG->Caption = "Viewer HYG | Voronoi polynet";
	InitDraw();
}
//---------------------------------------------------------------------------

void __fastcall TFormViewerHYG::FormCreate(TObject *Sender)
{
	Points1->Checked = true;
	FormViewerHYG->Caption = "Viewer HYG | Stars mode";

	Mode1->Enabled = false;
	Data1->Enabled = false;

	CheckListBox1->Checked[0] = true;
}

//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::CheckListBox1ClickCheck(TObject *Sender)
{
	// Init draw method on each checkbox selecting
	InitDraw();
}
//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::Data1Click(TObject *Sender)
{
	Form2->Show();
}
//---------------------------------------------------------------------------
/*
int NodeIndex1, NodeIndex2, NodeIndex3, NodeIndex4;
	float r, g, b;
	float x, y, z, X1, X2, X3, X4, Y1, Y2, Y3, Y4, Z1, Z2, Z3, Z4;

	r = O_Delaunay.color[0];
	g = O_Delaunay.color[1];
	b = O_Delaunay.color[2];

	GLTetrahedron1->Free();
	GLTetrahedron1 = (TGLTetrahedron *)(GLDummyCube1->AddNewChild(__classid(TGLTetrahedron)));
	GLTetrahedron1->Visible = False;

	ShowMessage(O_Delaunay.tetraCount);

	for (int i = 0; i < O_Delaunay.tetraCount; i++) {

		GLTetrahedron1 = (TGLTetrahedron *)(GLDummyCube1->AddNewChild(__classid(TGLTetrahedron)));

		NodeIndex1 = O_Delaunay.tetra[i][0];
		NodeIndex2 = O_Delaunay.tetra[i][1];
		NodeIndex3 = O_Delaunay.tetra[i][2];
		NodeIndex4 = O_Delaunay.tetra[i][3];

		X1 = O_Delaunay.node[NodeIndex1][0]*0.05;
		Y1 = O_Delaunay.node[NodeIndex1][1]*0.05;
		Z1 = O_Delaunay.node[NodeIndex1][2]*0.05;

		X2 = O_Delaunay.node[NodeIndex2][0]*0.05;
		Y2 = O_Delaunay.node[NodeIndex2][1]*0.05;
		Z2 = O_Delaunay.node[NodeIndex2][2]*0.05;

		X3 = O_Delaunay.node[NodeIndex3][0]*0.05;
		Y3 = O_Delaunay.node[NodeIndex3][1]*0.05;
		Z3 = O_Delaunay.node[NodeIndex3][2]*0.05;

		X4 = O_Delaunay.node[NodeIndex4][0]*0.05;
		Y4 = O_Delaunay.node[NodeIndex4][1]*0.05;
		Z4 = O_Delaunay.node[NodeIndex4][2]*0.05;

		x = (X1 + X2 + X3 + X4) / 4;
		y = (Y1 + Y2 + Y3 + Y4) / 4;
		z = (Z1 + Z2 + Z3 + Z4) / 4;

		GLTetrahedron1->Position->SetPoint(x, y, z);

		//GLTetrahedron1->Material->PolygonMode = pmLines;
		GLTetrahedron1->Material->FrontProperties->Diffuse->SetColor(r, g, b, 1);
}

// Delete all faces from the scene
GLPolygon1->Free();
GLPolygon1 = (TGLPolygon *)(GLDummyCube1->AddNewChild(__classid(TGLPolygon)));

int NodeIndex1, NodeIndex2, NodeIndex3;
float r, g, b;

r = O_Delaunay.color[0];
g = O_Delaunay.color[1];
b = O_Delaunay.color[2];

for (int i = 0; i < O_Delaunay.faceCount; i++) {

	GLPolygon1 = (TGLPolygon *)(GLDummyCube1->AddNewChild(__classid(TGLPolygon)));

	NodeIndex1 = O_Delaunay.face[i][0];
	NodeIndex2 = O_Delaunay.face[i][1];
	NodeIndex3 = O_Delaunay.face[i][2];

	GLPolygon1->AddNode(O_Delaunay.node[NodeIndex1][0]*0.05,
					O_Delaunay.node[NodeIndex1][1]*0.05,
					O_Delaunay.node[NodeIndex1][2]*0.05);

	GLPolygon1->AddNode(O_Delaunay.node[NodeIndex2][0]*0.05,
					O_Delaunay.node[NodeIndex2][1]*0.05,
					O_Delaunay.node[NodeIndex2][2]*0.05);

	GLPolygon1->AddNode(O_Delaunay.node[NodeIndex3][0]*0.05,
					O_Delaunay.node[NodeIndex3][1]*0.05,
					O_Delaunay.node[NodeIndex3][2]*0.05);

	GLPolygon1->Material->PolygonMode = pmLines;
	GLPolygon1->Material->FrontProperties->Diffuse->SetColor(r, g, b, 1);
}

*/
void __fastcall TFormViewerHYG::New1Click(TObject *Sender)
{
	// Auxiliary array with files' names
	String filenames[14];
	filenames[0] = "O_Delaunay.sqlite"; filenames[1] = "O_Voronoi.sqlite";
	filenames[2] = "A_Delaunay.sqlite"; filenames[3] = "A_Voronoi.sqlite";
	filenames[4] = "B_Delaunay.sqlite"; filenames[5] = "B_Voronoi.sqlite";
	filenames[6] = "F_Delaunay.sqlite"; filenames[7] = "F_Voronoi.sqlite";
	filenames[8] = "G_Delaunay.sqlite"; filenames[9] = "G_Voronoi.sqlite";
	filenames[10] = "K_Delaunay.sqlite"; filenames[11] = "K_Voronoi.sqlite";
	filenames[12] = "M_Delaunay.sqlite"; filenames[13] = "M_Voronoi.sqlite";

	// Checking if all files exist
	ifstream ifile;
	for (int i = 0; i < 14; i++) {
		ifile.open((datapath + filenames[i]).c_str());
		if(!ifile) {
			ShowMessage(AnsiString("File \'") + filenames[i].c_str() \
			+ AnsiString("\' not found!"));
		}
		ifile.close();
	}

	// Init all Delaunay data
	A_Delaunay = InitDelaunay("A_Delaunay.sqlite", white);
	B_Delaunay = InitDelaunay("B_Delaunay.sqlite", skyblue);
	F_Delaunay = InitDelaunay("F_Delaunay.sqlite", lightyellow);
	G_Delaunay = InitDelaunay("G_Delaunay.sqlite", yellow);
	K_Delaunay = InitDelaunay("K_Delaunay.sqlite", orange);
	M_Delaunay = InitDelaunay("M_Delaunay.sqlite", red);
	O_Delaunay = InitDelaunay("O_Delaunay.sqlite", lightblue);

	// Init all Voronoi data
	A_Voronoi = InitVoronoi("A_Voronoi.sqlite", white);
	B_Voronoi = InitVoronoi("B_Voronoi.sqlite", skyblue);
	F_Voronoi = InitVoronoi("F_Voronoi.sqlite", lightyellow);
	G_Voronoi = InitVoronoi("G_Voronoi.sqlite", yellow);
	K_Voronoi = InitVoronoi("K_Voronoi.sqlite", orange);
	M_Voronoi = InitVoronoi("M_Voronoi.sqlite", red);
	O_Voronoi = InitVoronoi("O_Voronoi.sqlite", lightblue);

	New1->Enabled = False;
	Mode1->Enabled = True;
	Data1->Enabled = True;

	// Visualization
	InitDraw();
}

//---------------------------------------------------------------------------
void __fastcall TFormViewerHYG::Exit1Click(TObject *Sender)
{
	FormViewerHYG->Close();
}

//---------------------------------------------------------------------------

void __fastcall TFormViewerHYG::Open1Click(TObject *Sender)
{

  pointStars->Free();
  pointStars = (TGLPoints *)(GLDummyCube1-> AddNewChild(__classid(TGLPoints)));

  sl = new TStringList(this);
  tl = new TStringList(this);
  OpenTextFileDialog->InitialDir = ExtractFilePath(Application->ExeName);
  OpenTextFileDialog->InitialDir = datapath; // ".\\..\\..\\DATA\\";
  OpenTextFileDialog->FilterIndex = 0;
  if (OpenTextFileDialog->Execute()) {
	  try {
		  sl->LoadFromFile(OpenTextFileDialog->FileName);
		  //... Reading data from hyg.csv catalog
		  tl->CommaText = sl->IndexOf(0);
		  for (int i = 1; i <= sl->Count; i++) {

			  tl->CommaText = sl->IndexOf(i);

			 // spect = tl->IndexOf(15);
			  x = StrToFloat(tl->IndexOf(17)); // not read element of array!!!
			  y = StrToFloat(tl->IndexOf(18));
			  z = StrToFloat(tl->IndexOf(19));
			  g = StrToFloat(tl->IndexOf(22)); // ? Read spectral class color

			  pointStars->Position->X = x;
			  pointStars->Position->Y = y;
			  pointStars->Position->Z = z;
		  }
	  } catch (...) {
		  sl->Free();
		  tl->Free();
		  //...
	  }
  } else
	  exit;
}
//---------------------------------------------------------------------------

