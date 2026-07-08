MODULE MainModule
    
    TASK PERS wobjdata wobj1:=[FALSE,TRUE,"",[[348.842,-38.9743,284.342],[0.070412,-0.0716276,-0.983192,-0.152465]],[[0,0,0],[1,0,0,0]]];
    VAR intnum IntpSignal1;
    
    PROC main()

        IDelete IntpSignal1;
        CONNECT IntpSignal1 WITH intpRun;
        ISignalGI PN_GI_0, IntpSignal0;
        ISignalGI PN_GI_1, IntpSignal1;

        WHILE TRUE DO
            WaitTime 1;
        ENDWHILE
	ENDPROC

    PROC Actions()
    ENDPROC

    PROC runAlong()
        VAR robtarget pStartPos;
        VAR robtarget pEndPos;
        pStartPos := CRobT(\Tool:=tool0 \WObj:=wobj1);
        pEndPos := Offs(pStartPos, 0, 200, 0);
        MoveL pEndPos, v300, fine, tool0\WObj:=wobj1;
        MoveL pStartPos, v300, fine, tool0\WObj:=wobj1;
    ENDPROC


    PROC runAround()
        VAR robtarget A;
        VAR robtarget B;
        VAR robtarget C;     
        VAR robtarget D;
        A := CRobT(\Tool:=tool0 \WObj:=wobj1);
        B := Offs(A, -50, 50, 0);
        C := Offs(A, -100, 0, 0);
        D := Offs(A, -50, -50, 0);
        MoveC B, C, v200, fine, tool0\WObj:=wobj1;
        MoveC D, A, v200, fine, tool0\WObj:=wobj1;
    ENDPROC

    PROC Draw_Rectangle()
        VAR robtarget pDraw_Origin;
        pDraw_Origin := CRobT(\Tool:=tool0 \WObj:=wobj1);
        MoveL Offs(pDraw_Origin, -100, 0, 0), v100, z10, tool0\WObj:=wobj1; 
        MoveL Offs(pDraw_Origin, -100, 200, 0), v100, z10, tool0\WObj:=wobj1; 
        MoveL Offs(pDraw_Origin, 0, 200, 0), v100, z10, tool0\WObj:=wobj1; 
        MoveL Offs(pDraw_Origin, 0, 0, 0), v100, fine, tool0\WObj:=wobj1; 
    ENDPROC

    PROC backReadyStuts()
    ENDPROC
    
    PROC Exc_Maduo()
        VAR robtarget A;
        VAR robtarget B;
        VAR robtarget A1;
        VAR robtarget B1;
        A := CRobT(\Tool:=tool0 \WObj:=wobj1);
        B := Offs(A, 0, 100, 0);
        A1 := Offs(A, 0, 0, 50);
        B1 := Offs(A, 0, 100, 50);
        MoveL A, v500, fine, tool0\wobj:=wobj1;
        MoveL A1, v500, fine, tool0\wobj:=wobj1;
        SetDO do0,1;!(? SetDO DO10_14,1)??????
        WaitTime 0.5;
        MoveL A, v500, fine, tool0\wobj:=wobj1;
        MoveL B, v500, fine, tool0\wobj:=wobj1; 
        MoveL B1, v500, fine, tool0\wobj:=wobj1;
        SetDO do0,0; !(? SetDO DO10_14,0)??????
        WaitTime 0.5;
        MoveL A, v500, z50, tool0\wobj:=wobj1;
    ENDPROC


    TRAP intpRun
       IF PN_DI_0 = 1 THEN backReadyStuts;
       ELSEIF PN_DI_1 = 1 THEN runAlong;
       ELSEIF PN_DI_2 = 1 THEN runAround;
       ELSEIF PN_DI_3 = 1 THEN Draw_Rectangle;
       ELSEIF PN_DI_4 = 1 THEN Exc_Maduo;
       ENDIF
    ENDTRAP


ENDMODULE