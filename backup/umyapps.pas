unit UMyApps;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Buttons, ExtCtrls, UGlobales, ShellApi,
  LCLType, Graphics,FileUtil,LazFileUtils,Dialogs, Menus,
  Forms;
type
  TMyApps=class
Public
  Procedure LoadApps(event:TNotifyEvent; var Menu:TMenuItem; eventtray:TNotifyEvent; var TrayMenu:TPopupMenu;
    var BtnApp1:TBitBtn; var ImgApp1:TImage;
    var BtnApp2:TBitBtn; var ImgApp2:TImage;
    var BtnApp3:TBitBtn; var ImgApp3:TImage;
    var BtnApp4:TBitBtn; var ImgApp4:TImage;
    var BtnApp5:TBitBtn; var ImgApp5:TImage;
    var BtnApp6:TBitBtn; var ImgApp6:TImage;
    var BtnApp7:TBitBtn; var ImgApp7:TImage;
    var BtnApp8:TBitBtn; var ImgApp8:TImage;
    var BtnApp9:TBitBtn; var ImgApp9:TImage;
    var BtnApp10:TBitBtn; var ImgApp10:TImage;
    var BtnApp11:TBitBtn; var ImgApp11:TImage;
    var BtnApp12:TBitBtn; var ImgApp12:TImage;
    var BtnApp13:TBitBtn; var ImgApp13:TImage;
    var BtnApp14:TBitBtn; var ImgApp14:TImage;
    var BtnApp15:TBitBtn; var ImgApp15:TImage;
    var BtnApp16:TBitBtn; var ImgApp16:TImage;
    var BtnApp17:TBitBtn; var ImgApp17:TImage;
    var BtnApp18:TBitBtn; var ImgApp18:TImage;
    var BtnApp19:TBitBtn; var ImgApp19:TImage;
    var BtnApp20:TBitBtn; var ImgApp20:TImage);
  Procedure addApp(APP:String;var BtnEdApp:TBitBtn;var ImgApp: TImage);
  Procedure DelApp(APP:String;var BtnEdApp:TBitBtn;var ImgApp: TImage);
  Procedure DelImg(APP:String;var ImgApp: TImage);
  Procedure DelNom(APP:String;var BtnEdApp:TBitBtn);
  Function retImgApp(APP:String):TPicture;
  Constructor Create;
  Procedure OrderUsoAPP();
Private
  Function retUso(APP:String):Integer;
  Function retImgEXE(FileNameImg:String):TPicture ;
var
Private
 VarGlobales:TGlobales;
end;

implementation
Constructor TMyApps.create();
begin
   VarGlobales:=TGlobales.Create;
end;
Procedure TMyApps.OrderUsoAPP();
 var  Us1,Us2,Uso1,x,y,count:integer;
      FileName1,Imagen1,APP1,APP2,Nombre1,parm1:String;
Begin
  count:=0;
  For y:=1 to 20 do
  Begin
    count:=0;
    for x := 2 to 20 do
    Begin
      APP1:='APP'+trim((x-1).ToString());
      APP2:='APP'+trim(x.ToString());
      Us1:=retUso(APP1);
      Us2:=retUso(APP2);
      If (Us1<Us2) then
      begin
        //ShowMessage(APP1+'<'+APP2);
        count:=count+1;
        //1-->tmp
        Filename1:=VarGlobales.getApp(APP1);
        Nombre1:=VarGlobales.getAPPNombre(APP1);
        Imagen1:=VarGlobales.getImgApp(APP1);
        Uso1:= VarGlobales.getAppUso(APP1);
        parm1:=VarGlobales.getAPPPar(APP1);
        //2-->1
        VarGlobales.setApp(APP1,VarGlobales.getApp(APP2));
        Varglobales.setAPPNombre(APP1,VarGlobales.getAPPNombre(APP2));
        varglobales.setImgApp(APP1,VarGlobales.getImgApp(APP2));
        VarGlobales.setAPPuso(APP1,VarGlobales.getAppUso(APP2));
        VarGlobales.setAPPPar(APP1,VarGlobales.getAPPPar(APP2));
        //tmp-->2
        VarGlobales.setApp(APP2,FileName1);
        Varglobales.setAPPNombre(APP2,Nombre1);
        varglobales.setImgApp(APP2,Imagen1);
        VarGlobales.setAPPuso(APP2,Uso1);
        VarGlobales.setAPPPar(App2,parm1);
      end;
    end;
    If count=0 then exit;
  end;
end;

Function TMyApps.retUso(APP:String):integer;
Begin
  Result:=-1;
  If FileExists(VarGlobales.getApp(APP)) Then
   Result:=VarGlobales.getAppUso(APP);
end;

Procedure TMyApps.LoadApps(event:TNotifyEvent; var Menu:TMenuItem; eventtray:TNotifyEvent; var TrayMenu:TPopupMenu;
    var BtnApp1:TBitBtn; var ImgApp1:TImage;
    var BtnApp2:TBitBtn; var ImgApp2:TImage;
    var BtnApp3:TBitBtn; var ImgApp3:TImage;
    var BtnApp4:TBitBtn; var ImgApp4:TImage;
    var BtnApp5:TBitBtn; var ImgApp5:TImage;
    var BtnApp6:TBitBtn; var ImgApp6:TImage;
    var BtnApp7:TBitBtn; var ImgApp7:TImage;
    var BtnApp8:TBitBtn; var ImgApp8:TImage;
    var BtnApp9:TBitBtn; var ImgApp9:TImage;
    var BtnApp10:TBitBtn; var ImgApp10:TImage;
    var BtnApp11:TBitBtn; var ImgApp11:TImage;
    var BtnApp12:TBitBtn; var ImgApp12:TImage;
    var BtnApp13:TBitBtn; var ImgApp13:TImage;
    var BtnApp14:TBitBtn; var ImgApp14:TImage;
    var BtnApp15:TBitBtn; var ImgApp15:TImage;
    var BtnApp16:TBitBtn; var ImgApp16:TImage;
    var BtnApp17:TBitBtn; var ImgApp17:TImage;
    var BtnApp18:TBitBtn; var ImgApp18:TImage;
    var BtnApp19:TBitBtn; var ImgApp19:TImage;
    var BtnApp20:TBitBtn; var ImgApp20:TImage);
var APP,FileName,TxtName:String;
     img:TPicture;
     item1 ,item2 ,item3 ,item4 ,item5 ,item6 ,item7 ,item8 ,item9 ,item10,
     item11 ,item12 ,item13 ,item14 ,item15 ,item16 ,item17 ,item18 ,item19 ,item20,
     item1t ,item2t ,item3t ,item4t ,item5t ,item6t ,item7t ,item8t ,item9t ,item10t,
     item11t ,item12t ,item13t ,item14t ,item15t ,item16t ,item17t ,item18t ,item19t ,item20t,
     itemx1,itemx2:TMenuItem;
Begin
  Menu.Clear;
  TrayMenu.Items.Clear;

  itemx1:=TMenuItem.Create(nil);
  itemx1.Caption:='Administrar...';
  itemx1.OnClick:=event;
  Menu.Add(Itemx1);

  If VarGlobales.getOrderByUso() Then OrderUsoAPP();
  APP:='APP1';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item1:=TMenuItem.Create(nil);
    Item1.Caption:=TxtName;
    Item1.Bitmap:=img.Bitmap;
    Item1.OnClick:=BtnApp1.OnClick;
    Menu.Add(Item1);
    //traypop
    item1t:=TMenuItem.Create(nil);
    Item1t.Caption:=TxtName;
    Item1t.Bitmap:=img.Bitmap;
    Item1t.OnClick:=BtnApp1.OnClick;
    TrayMenu.Items.Add(Item1t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp1.Caption:=TxtName;
  ImgApp1.Picture:=img;
  img.Free;

  APP:='APP2';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item2:=TMenuItem.Create(nil);
    Item2.Caption:=TxtName;
    Item2.Bitmap:=img.Bitmap;
    Item2.OnClick:=BtnApp2.OnClick;
    Menu.Add(Item2);
    //traypop
    item2t:=TMenuItem.Create(nil);
    Item2t.Caption:=TxtName;
    Item2t.Bitmap:=img.Bitmap;
    Item2t.OnClick:=BtnApp2.OnClick;
    TrayMenu.Items.Add(Item2t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp2.Caption:=TxtName;
  ImgApp2.Picture:=img;
  img.Free;

  APP:='APP3';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item3:=TMenuItem.Create(nil);
    Item3.Caption:=TxtName;
    Item3.Bitmap:=img.Bitmap;
    Item3.OnClick:=BtnApp3.OnClick;
    Menu.Add(Item3);
    //traypop
    item3t:=TMenuItem.Create(nil);
    Item3t.Caption:=TxtName;
    Item3t.Bitmap:=img.Bitmap;
    Item3t.OnClick:=BtnApp3.OnClick;
    TrayMenu.Items.Add(Item3t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp3.Caption:=TxtName;
  ImgApp3.Picture:=img;
  img.Free;

  APP:='APP4';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item4:=TMenuItem.Create(nil);
    Item4.Caption:=TxtName;
    Item4.Bitmap:=img.Bitmap;
    Item4.OnClick:=BtnApp4.OnClick;
    Menu.Add(Item4);
    //traypop
    item4t:=TMenuItem.Create(nil);
    Item4t.Caption:=TxtName;
    Item4t.Bitmap:=img.Bitmap;
    Item4t.OnClick:=BtnApp4.OnClick;
    TrayMenu.Items.Add(Item4t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp4.Caption:=TxtName;
  ImgApp4.Picture:=img;
  img.Free;

  APP:='APP5';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //item 5:
    item5:=TMenuItem.Create(nil);
    Item5.Caption:=TxtName;
    Item5.Bitmap:=img.Bitmap;
    Item5.OnClick:=BtnApp5.OnClick;
    Menu.Add(Item5);
    //traypop
    item5t:=TMenuItem.Create(nil);
    Item5t.Caption:=TxtName;
    Item5t.Bitmap:=img.Bitmap;
    Item5t.OnClick:=BtnApp5.OnClick;
    TrayMenu.Items.Add(Item5t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp5.Caption:=TxtName;
  ImgApp5.Picture:=img;
  img.Free;

  APP:='APP6';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //item 6:
    item6:=TMenuItem.Create(nil);
    Item6.Caption:=TxtName;
    Item6.Bitmap:=img.Bitmap;
    Item6.OnClick:=BtnApp6.OnClick;
    Menu.Add(Item6);
    //traypop
    item6t:=TMenuItem.Create(nil);
    Item6t.Caption:=TxtName;
    Item6t.Bitmap:=img.Bitmap;
    Item6t.OnClick:=BtnApp6.OnClick;
    TrayMenu.Items.Add(Item6t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp6.Caption:=TxtName;
  ImgApp6.Picture:=img;
  img.Free;

  APP:='APP7';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //item 7:
    item7:=TMenuItem.Create(nil);
    Item7.Caption:=TxtName;
    Item7.Bitmap:=img.Bitmap;
    Item7.OnClick:=BtnApp7.OnClick;
    Menu.Add(Item7);
     //traypop
    item7t:=TMenuItem.Create(nil);
    Item7t.Caption:=TxtName;
    Item7t.Bitmap:=img.Bitmap;
    Item7t.OnClick:=BtnApp7.OnClick;
    TrayMenu.Items.Add(Item7t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp7.Caption:=TxtName;
  ImgApp7.Picture:=img;
  img.Free;

  APP:='APP8';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //item 8:
    item8:=TMenuItem.Create(nil);
    Item8.Caption:=TxtName;
    Item8.Bitmap:=img.Bitmap;
    Item8.OnClick:=BtnApp8.OnClick;
    Menu.Add(Item8);
    //traypop
    item8t:=TMenuItem.Create(nil);
    Item8t.Caption:=TxtName;
    Item8t.Bitmap:=img.Bitmap;
    Item8t.OnClick:=BtnApp8.OnClick;
    TrayMenu.Items.Add(Item8t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp8.Caption:=TxtName;
  ImgApp8.Picture:=img;
  img.Free;

  APP:='APP9';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //item 9:
    item9:=TMenuItem.Create(nil);
    Item9.Caption:=TxtName;
    Item9.Bitmap:=img.Bitmap;
    Item9.OnClick:=BtnApp9.OnClick;
    Menu.Add(Item9);
    //traypop
    item9t:=TMenuItem.Create(nil);
    Item9t.Caption:=TxtName;
    Item9t.Bitmap:=img.Bitmap;
    Item9t.OnClick:=BtnApp9.OnClick;
    TrayMenu.Items.Add(Item9t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp9.Caption:=TxtName;
  ImgApp9.Picture:=img;
  img.Free;

  APP:='APP10';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //item 10:
    item10:=TMenuItem.Create(nil);
    Item10.Caption:=TxtName;
    Item10.Bitmap:=img.Bitmap;
    Item10.OnClick:=BtnApp10.OnClick;
    Menu.Add(Item10);
    //traypop
    item10t:=TMenuItem.Create(nil);
    Item10t.Caption:=TxtName;
    Item10t.Bitmap:=img.Bitmap;
    Item10t.OnClick:=BtnApp10.OnClick;
    TrayMenu.Items.Add(Item10t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp10.Caption:=TxtName;
  ImgApp10.Picture:=img;
  img.Free;

  APP:='APP11';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);
    //itemmenu:
    item11:=TMenuItem.Create(nil);
    Item11.Caption:=TxtName;
    Item11.Bitmap:=img.Bitmap;
    Item11.OnClick:=BtnApp11.OnClick;
    Menu.Add(Item11);
    //traypop
    item11t:=TMenuItem.Create(nil);
    Item11t.Caption:=TxtName;
    Item11t.Bitmap:=img.Bitmap;
    Item11t.OnClick:=BtnApp11.OnClick;
    TrayMenu.Items.Add(Item11t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp11.Caption:=TxtName;
  ImgApp11.Picture:=img;
  img.Free;

  APP:='APP12';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item12:=TMenuItem.Create(nil);
    Item12.Caption:=TxtName;
    Item12.Bitmap:=img.Bitmap;
    Item12.OnClick:=BtnApp12.OnClick;
    Menu.Add(Item12);
    //traypop
    item12t:=TMenuItem.Create(nil);
    Item12t.Caption:=TxtName;
    Item12t.Bitmap:=img.Bitmap;
    Item12t.OnClick:=BtnApp12.OnClick;
    TrayMenu.Items.Add(Item12t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp12.Caption:=TxtName;
  ImgApp12.Picture:=img;
  img.Free;

  APP:='APP13';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item13:=TMenuItem.Create(nil);
    Item13.Caption:=TxtName;
    Item13.Bitmap:=img.Bitmap;
    Item13.OnClick:=BtnApp13.OnClick;
    Menu.Add(Item13);
    //traypop
    item13t:=TMenuItem.Create(nil);
    Item13t.Caption:=TxtName;
    Item13t.Bitmap:=img.Bitmap;
    Item13t.OnClick:=BtnApp13.OnClick;
    TrayMenu.Items.Add(Item13t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp13.Caption:=TxtName;
  ImgApp13.Picture:=img;
  img.Free;

  APP:='APP14';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item14:=TMenuItem.Create(nil);
    Item14.Caption:=TxtName;
    Item14.Bitmap:=img.Bitmap;
    Item14.OnClick:=BtnApp14.OnClick;
    Menu.Add(Item14);
    //traypop
    item14t:=TMenuItem.Create(nil);
    Item14t.Caption:=TxtName;
    Item14t.Bitmap:=img.Bitmap;
    Item14t.OnClick:=BtnApp14.OnClick;
    TrayMenu.Items.Add(Item14t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp14.Caption:=TxtName;
  ImgApp14.Picture:=img;
  img.Free;

  APP:='APP15';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item15:=TMenuItem.Create(nil);
    Item15.Caption:=TxtName;
    Item15.Bitmap:=img.Bitmap;
    Item15.OnClick:=BtnApp15.OnClick;
    Menu.Add(Item15);
    //traypop
    item15t:=TMenuItem.Create(nil);
    Item15t.Caption:=TxtName;
    Item15t.Bitmap:=img.Bitmap;
    Item15t.OnClick:=BtnApp15.OnClick;
    TrayMenu.Items.Add(Item15t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp15.Caption:=TxtName;
  ImgApp15.Picture:=img;
  img.Free;

  APP:='APP16';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item16:=TMenuItem.Create(nil);
    Item16.Caption:=TxtName;
    Item16.Bitmap:=img.Bitmap;
    Item16.OnClick:=BtnApp16.OnClick;
    Menu.Add(Item16);
    //traypop
    item16t:=TMenuItem.Create(nil);
    Item16t.Caption:=TxtName;
    Item16t.Bitmap:=img.Bitmap;
    Item16t.OnClick:=BtnApp16.OnClick;
    TrayMenu.Items.Add(Item16t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp16.Caption:=TxtName;
  ImgApp16.Picture:=img;
  img.Free;

  APP:='APP17';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item17:=TMenuItem.Create(nil);
    Item17.Caption:=TxtName;
    Item17.Bitmap:=img.Bitmap;
    Item17.OnClick:=BtnApp17.OnClick;
    Menu.Add(Item17);
    //traypop
    item17t:=TMenuItem.Create(nil);
    Item17t.Caption:=TxtName;
    Item17t.Bitmap:=img.Bitmap;
    Item17t.OnClick:=BtnApp17.OnClick;
    TrayMenu.Items.Add(Item17t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp17.Caption:=TxtName;
  ImgApp17.Picture:=img;
  img.Free;

  APP:='APP18';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item18:=TMenuItem.Create(nil);
    Item18.Caption:=TxtName;
    Item18.Bitmap:=img.Bitmap;
    Item18.OnClick:=BtnApp18.OnClick;
    Menu.Add(Item18);
    //traypop
    item18t:=TMenuItem.Create(nil);
    Item18t.Caption:=TxtName;
    Item18t.Bitmap:=img.Bitmap;
    Item18t.OnClick:=BtnApp18.OnClick;
    TrayMenu.Items.Add(Item18t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp18.Caption:=TxtName;
  ImgApp18.Picture:=img;
  img.Free;

  APP:='APP19';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item19:=TMenuItem.Create(nil);
    Item19.Caption:=TxtName;
    Item19.Bitmap:=img.Bitmap;
    Item19.OnClick:=BtnApp19.OnClick;
    Menu.Add(Item19);
    //traypop
    item19t:=TMenuItem.Create(nil);
    Item19t.Caption:=TxtName;
    Item19t.Bitmap:=img.Bitmap;
    Item19t.OnClick:=BtnApp19.OnClick;
    TrayMenu.Items.Add(Item19t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp19.Caption:=TxtName;
  ImgApp19.Picture:=img;
  img.Free;

  APP:='APP20';
  Filename:= VarGlobales.getApp(APP);
  TxtName:='[...]';
  img:=TPicture.Create;
  If FileExists(FileName) Then
  Begin
    TxtName:=VarGlobales.getAPPNombre(APP);
    If Trim(TxtName).IsEmpty Then TxtName:=ExtractFileNameOnly(FileName);
    Img:= retImgApp(APP);

    //itemmenu:
    item20:=TMenuItem.Create(nil);
    Item20.Caption:=TxtName;
    Item20.Bitmap:=img.Bitmap;
    Item20.OnClick:=BtnApp20.OnClick;
    Menu.Add(Item20);
    //traypop
    item20t:=TMenuItem.Create(nil);
    Item20t.Caption:=TxtName;
    Item20t.Bitmap:=img.Bitmap;
    Item20t.OnClick:=BtnApp20.OnClick;
    TrayMenu.Items.Add(Item20t);
  end;
  If Not FileExists(FileName) Then
  Begin
    VarGlobales.delAPP(APP);
    VarGlobales.delAPP(APP+'NOM');
    VarGlobales.delAPP(APP+'IMG');
    VarGlobales.delAPP(APP+'USO');
    VarGlobales.delAPP(APP+'PAR');
  end;
  BtnApp20.Caption:=TxtName;
  ImgApp20.Picture:=img;
  img.Free;

  itemx2:=TMenuItem.Create(Nil);
  itemx2.Caption:='Cerrar Aplicacion';
  itemx2.OnClick:=eventtray;
  TrayMenu.Items.Add(itemx2);

end;

Procedure TMyApps.addApp(APP:String;var BtnEdApp:TBitBtn;var ImgApp: TImage);
 var
   Nombre,Filename:String;
 begin
   FileName:=varGlobales.getApp(APP);
   Nombre:=VarGlobales.getAPPNombre(APP);
   If Trim(Nombre).IsEmpty then Nombre:=ExtractFileNameOnly(Filename);
   BtnEdApp.Caption:=Nombre;
   ImgApp.Picture:=retImgApp(APP);
 end;
Procedure TMyApps.DelApp(APP:String;var BtnEdApp:TBitBtn;var ImgApp: TImage);
Begin
  VarGlobales.delAPP(APP);
  VarGlobales.delAPP(APP+'USO');
  VarGlobales.delAPP(APP+'PAR');
  DelImg(App,ImgApp);
  DelNom(APP,BtnEdApp);
end;

Procedure TMyApps.DelImg(APP:String;var ImgApp: TImage);
Begin
  VarGlobales.delAPP(APP+'IMG');
  ImgApp.Picture:=nil;
end;

Procedure TMyApps.DelNom(APP:String;var BtnEdApp:TBitBtn);
Begin
  VarGlobales.delAPP(APP+'NOM');
  BtnEdApp.Caption:='[...]';
end;

Function TMyApps.retImgApp(APP:String):TPicture;
var ext,FilenameImg:String;
Begin
    Result:=TPicture.Create;
    FilenameImg:=VarGlobales.getImgApp(APP);
    If Not FileExists(FilenameImg) Then FilenameImg:=VarGlobales.getApp(APP);
    If Not FileExists(FilenameImg) Then Exit(Result);
    ext:=UpperCase(FilenameImg.Substring((FilenameImg.Length-4)));
    If (ext<>'.PNG') and
       (ext<>'.JPG') and
       (ext<>'.ICO') and
       (ext<>'.BMP') then
        Result:=retImgEXE(FilenameImg) else Result.LoadFromFile(FileNameImg);
end;

Function TMyApps.retImgEXE(FileNameImg:String):TPicture;
var LargeIco, SmallIco : hIcon;
    myIcon : TIcon;
Begin
 Result:=TPicture.Create;
 if ExtractIconEx(PChar(FilenameImg), 0, LargeIco, SmallIco, 1) > null then
 begin
   myIcon := TIcon.Create;
   try
     myIcon.Transparent := True;
     myIcon.Masked := True;
     If LargeIco.Size>0 then myIcon.Handle := LargeIco else myIcon.Handle := SmallIco;
     Result.Icon.Assign(myIcon);
   finally
     myIcon.Free;
   end;
 end;
end;

end.

