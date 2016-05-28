<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:e7b5092e-a2bb-40bd-b5a6-18a9c4482677(oil.core.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="u1z9" ref="r:bd641933-ad1e-436e-ae92-247a9a3b4aa2(oil.core.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
        <child id="1140524464359" name="emptyCellModel" index="2czzBI" />
        <child id="1233141163694" name="separatorStyle" index="sWeuL" />
      </concept>
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1233148810477" name="jetbrains.mps.lang.editor.structure.InlineStyleDeclaration" flags="ng" index="tppnM" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1186414976055" name="jetbrains.mps.lang.editor.structure.DrawBorderStyleClassItem" flags="ln" index="VPXOz" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ng" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1139852716018" name="noTargetText" index="1$x2rV" />
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
        <property id="1130859485024" name="attractsFocus" index="1cu_pB" />
        <child id="1142887637401" name="renderingCondition" index="pqm2j" />
      </concept>
      <concept id="1073389446423" name="jetbrains.mps.lang.editor.structure.CellModel_Collection" flags="sn" stub="3013115976261988961" index="3EZMnI">
        <child id="1106270802874" name="cellLayout" index="2iSdaV" />
        <child id="1073389446424" name="childCellModel" index="3EZMnx" />
      </concept>
      <concept id="1073389577006" name="jetbrains.mps.lang.editor.structure.CellModel_Constant" flags="sn" stub="3610246225209162225" index="3F0ifn">
        <property id="1073389577007" name="text" index="3F0ifm" />
      </concept>
      <concept id="1073389658414" name="jetbrains.mps.lang.editor.structure.CellModel_Property" flags="sg" stub="730538219796134133" index="3F0A7n" />
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ng" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="_SoWTEesaz">
    <ref role="1XX52x" to="u1z9:1x4fgD956_n" resolve="AppModeType" />
    <node concept="3EZMnI" id="_SoWTEesa_" role="2wV5jI">
      <node concept="3F0ifn" id="_SoWTEesaG" role="3EZMnx">
        <property role="3F0ifm" value="(A)" />
      </node>
      <node concept="1iCGBv" id="_SoWTEesaQ" role="3EZMnx">
        <ref role="1NtTu8" to="u1z9:1x4fgD956_o" />
        <node concept="1sVBvm" id="_SoWTEesaS" role="1sWHZn">
          <node concept="3F0A7n" id="1eGaHOMxWgl" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="_SoWTEesaC" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="_SoWTEesbi">
    <ref role="1XX52x" to="u1z9:1x4fgD94T$g" resolve="OS" />
    <node concept="3EZMnI" id="_SoWTEesbk" role="2wV5jI">
      <node concept="3EZMnI" id="_SoWTEesbr" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEesbt" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="_SoWTEesbH" role="3EZMnx">
          <property role="3F0ifm" value="OS" />
        </node>
        <node concept="3F0A7n" id="_SoWTEesbU" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="_SoWTEesc4" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="_SoWTEesbw" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEescG" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEescI" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEescY" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesdJ" role="3EZMnx">
          <property role="3F0ifm" value="status" />
        </node>
        <node concept="3F0A7n" id="_SoWTEesdZ" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T$u" resolve="status" />
        </node>
        <node concept="l2Vlx" id="_SoWTEescL" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEese5" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEese6" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEese7" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesfQ" role="3EZMnx">
          <property role="3F0ifm" value="use hooks:" />
        </node>
        <node concept="l2Vlx" id="_SoWTEesea" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEeseT" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEeseU" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEeseV" role="3EZMnx" />
        <node concept="3XFhqQ" id="_SoWTEesfV" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesgS" role="3EZMnx">
          <property role="3F0ifm" value="pre task" />
        </node>
        <node concept="3F0A7n" id="_SoWTEeshb" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T$T" resolve="preTaskHook" />
        </node>
        <node concept="l2Vlx" id="_SoWTEeseX" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEesgf" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEesgg" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEesgh" role="3EZMnx" />
        <node concept="3XFhqQ" id="_SoWTEesgi" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesnc" role="3EZMnx">
          <property role="3F0ifm" value="post task" />
        </node>
        <node concept="3F0A7n" id="_SoWTEesnv" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T$Z" resolve="postTaskHook" />
        </node>
        <node concept="l2Vlx" id="_SoWTEesgk" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEeshi" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEeshj" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEeshk" role="3EZMnx" />
        <node concept="3XFhqQ" id="_SoWTEeshl" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesnA" role="3EZMnx">
          <property role="3F0ifm" value="error" />
        </node>
        <node concept="3F0A7n" id="_SoWTEesnM" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T$K" resolve="errorHook" />
        </node>
        <node concept="l2Vlx" id="_SoWTEeshn" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEesi2" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEesi3" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEesi4" role="3EZMnx" />
        <node concept="3XFhqQ" id="_SoWTEesi5" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesnT" role="3EZMnx">
          <property role="3F0ifm" value="startup" />
        </node>
        <node concept="3F0A7n" id="_SoWTEesoc" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T$w" resolve="startupHook" />
        </node>
        <node concept="l2Vlx" id="_SoWTEesi7" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEesiR" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEesiS" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEesiT" role="3EZMnx" />
        <node concept="3XFhqQ" id="_SoWTEesiU" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesoj" role="3EZMnx">
          <property role="3F0ifm" value="shutdown" />
        </node>
        <node concept="3F0A7n" id="_SoWTEesoA" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T$O" resolve="shutdownHook" />
        </node>
        <node concept="l2Vlx" id="_SoWTEesiW" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEesjM" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEesjN" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEesjO" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEesoY" role="3EZMnx">
          <property role="3F0ifm" value="use parameter access" />
        </node>
        <node concept="3F0A7n" id="_SoWTEespe" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T_v" resolve="useParamterAccess" />
        </node>
        <node concept="l2Vlx" id="_SoWTEesjR" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEeskN" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEeskO" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEeskP" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEespn" role="3EZMnx">
          <property role="3F0ifm" value="use scheduler as resource" />
        </node>
        <node concept="3F0A7n" id="_SoWTEespx" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T_C" resolve="useResScheduler" />
        </node>
        <node concept="l2Vlx" id="_SoWTEeskS" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEeslU" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEeslV" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEeslW" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEespP" role="3EZMnx">
          <property role="3F0ifm" value="use service ID" />
        </node>
        <node concept="3F0A7n" id="_SoWTEespB" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD94T_n" resolve="useServiceID" />
        </node>
        <node concept="l2Vlx" id="_SoWTEeslZ" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOHWS" role="3EZMnx">
        <node concept="l2Vlx" id="zf_u2EOHWT" role="2iSdaV" />
        <node concept="3F0ifn" id="62xxBiE6Cl2" role="3EZMnx">
          <property role="3F0ifm" value="}" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
      </node>
      <node concept="2iRkQZ" id="_SoWTEesbn" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="62xxBiE6swj">
    <ref role="1XX52x" to="u1z9:1x4fgD94T$4" resolve="CPU" />
    <node concept="3EZMnI" id="62xxBiE6swl" role="2wV5jI">
      <node concept="3EZMnI" id="62xxBiE6swz" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6sw_" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="62xxBiE6swB" role="3EZMnx">
          <property role="3F0ifm" value="CPU" />
        </node>
        <node concept="3F0A7n" id="62xxBiE6swS" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="62xxBiE6sx2" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="62xxBiE6swC" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6tUQ" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6tUS" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6tVB" role="3EZMnx" />
        <node concept="3F1sOY" id="62xxBiE6tVJ" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD956aq" />
        </node>
        <node concept="l2Vlx" id="62xxBiE6tUV" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7z6b" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7z6d" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7z8p" role="3EZMnx" />
        <node concept="3F0ifn" id="1eGaHOMwNLa" role="3EZMnx">
          <property role="3F0ifm" value="no com defined" />
          <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          <node concept="pkWqt" id="1eGaHOMwNLg" role="pqm2j">
            <node concept="3clFbS" id="1eGaHOMwNLh" role="2VODD2">
              <node concept="3clFbF" id="1eGaHOMwNMm" role="3cqZAp">
                <node concept="3clFbC" id="1eGaHOMwRaS" role="3clFbG">
                  <node concept="2OqwBi" id="1eGaHOMwQWU" role="3uHU7B">
                    <node concept="pncrf" id="1eGaHOMwNMl" role="2Oq$k0" />
                    <node concept="3TrEf2" id="1eGaHOMwR3V" role="2OqNvi">
                      <ref role="3Tt5mk" to="u1z9:62xxBiE6szm" />
                    </node>
                  </node>
                  <node concept="10Nm6u" id="1eGaHOMwNWh" role="3uHU7w" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3F1sOY" id="62xxBiE7z8x" role="3EZMnx">
          <property role="1$x2rV" value=" " />
          <ref role="1NtTu8" to="u1z9:62xxBiE6szm" />
        </node>
        <node concept="l2Vlx" id="62xxBiE7z6g" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6LAr" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6LAt" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6LBp" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE6LBx" role="3EZMnx">
          <property role="3F0ifm" value="defined counters" />
        </node>
        <node concept="l2Vlx" id="62xxBiE6LAw" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6LCv" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6LCx" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6LDy" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE6LDJ" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE6LDZ" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:5KtH1a6kkoW" />
          <node concept="2iRkQZ" id="62xxBiE7tV2" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE6LE7" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE6LC$" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6sDk" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6sDm" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6sDS" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE6sF9" role="3EZMnx">
          <property role="3F0ifm" value="defined alarms" />
          <property role="1cu_pB" value="0" />
        </node>
        <node concept="l2Vlx" id="62xxBiE6sDp" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6sFE" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6sFG" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6sGg" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE6sGu" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE6sGF" role="3EZMnx">
          <property role="1cu_pB" value="0" />
          <ref role="1NtTu8" to="u1z9:7FCpXS_WSLS" />
          <node concept="2iRkQZ" id="62xxBiE7tUZ" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE6sGT" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE6sFJ" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6sx$" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6sxA" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6sy2" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE6sy7" role="3EZMnx">
          <property role="3F0ifm" value="defined events" />
        </node>
        <node concept="l2Vlx" id="62xxBiE6sxD" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6syx" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6syz" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6syS" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE6s$3" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE6sGM" role="3EZMnx">
          <property role="1cu_pB" value="0" />
          <ref role="1NtTu8" to="u1z9:62xxBiE6sz5" />
          <node concept="2iRkQZ" id="62xxBiE7tV5" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE6sGV" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <property role="1cu_pB" value="0" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE6syA" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6tWC" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6tWE" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6tXv" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE6tXB" role="3EZMnx">
          <property role="3F0ifm" value="defined app modes" />
        </node>
        <node concept="l2Vlx" id="62xxBiE6tWH" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6s$r" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6s$t" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE6s$R" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE6Cms" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE6tVO" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:1x4fgD956bG" />
          <node concept="2iRkQZ" id="7ZTJPb1TqoC" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE6tXG" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE6s$w" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE74_h" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE74_j" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE74A$" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE74AG" role="3EZMnx">
          <property role="3F0ifm" value="defined resources" />
        </node>
        <node concept="l2Vlx" id="62xxBiE74_m" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE74BR" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE74BT" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE74D7" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE74Df" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE74Dv" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:7FCpXS_W1Ko" />
          <node concept="2iRkQZ" id="62xxBiE7tVb" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE74Ev" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
          <node concept="tppnM" id="62xxBiE7vx6" role="sWeuL">
            <node concept="VPXOz" id="62xxBiE7vx8" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE74BW" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7yA7" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7yA9" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7yBx" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE7yBD" role="3EZMnx">
          <property role="3F0ifm" value="defined tasks" />
        </node>
        <node concept="l2Vlx" id="62xxBiE7yAc" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7yD3" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7yD5" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7yEy" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE7yEE" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE7yEU" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:7FCpXS_W1Kk" />
          <node concept="2iRkQZ" id="62xxBiE7yF2" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE7yF5" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE7yD8" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7yG$" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7yGA" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7yIj" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE7yIr" role="3EZMnx">
          <property role="3F0ifm" value="defined ISRs" />
        </node>
        <node concept="l2Vlx" id="62xxBiE7yGD" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7yKa" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7yKc" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7yLQ" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE7yMs" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE7yMA" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:62xxBiE6szd" />
          <node concept="2iRkQZ" id="62xxBiE7yMI" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE7yML" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE7yKf" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7yOt" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7yOv" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7yQn" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE7yQv" role="3EZMnx">
          <property role="3F0ifm" value="defined IPDUs" />
        </node>
        <node concept="l2Vlx" id="62xxBiE7yOy" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7ySv" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7ySx" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7yUo" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE7yUv" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE7yUJ" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:62xxBiE6szO" />
          <node concept="2iRkQZ" id="62xxBiE7yUR" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE7yUU" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE7yS$" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7yWN" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7yWP" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7yYO" role="3EZMnx" />
        <node concept="l2Vlx" id="62xxBiE7yWS" role="2iSdaV" />
        <node concept="3F0ifn" id="62xxBiE7yYW" role="3EZMnx">
          <property role="3F0ifm" value="defined messages" />
        </node>
      </node>
      <node concept="3EZMnI" id="62xxBiE7z15" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7z17" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7z3b" role="3EZMnx" />
        <node concept="3XFhqQ" id="62xxBiE7z3y" role="3EZMnx" />
        <node concept="3F2HdR" id="62xxBiE7z3M" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:62xxBiE7yQ$" />
          <node concept="2iRkQZ" id="62xxBiE7z3U" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE7z3X" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE7z1a" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="6g77ZYUpdnb" role="3EZMnx">
        <node concept="VPM3Z" id="6g77ZYUpdnc" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="6g77ZYUpdnd" role="3EZMnx" />
        <node concept="l2Vlx" id="6g77ZYUpdne" role="2iSdaV" />
        <node concept="3F0ifn" id="6g77ZYUpdnf" role="3EZMnx">
          <property role="3F0ifm" value="defined sandboxes" />
        </node>
      </node>
      <node concept="3EZMnI" id="6g77ZYUpdng" role="3EZMnx">
        <node concept="VPM3Z" id="6g77ZYUpdnh" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="6g77ZYUpdni" role="3EZMnx" />
        <node concept="3XFhqQ" id="6g77ZYUpdnj" role="3EZMnx" />
        <node concept="3F2HdR" id="6g77ZYUpdnk" role="3EZMnx">
          <ref role="1NtTu8" to="u1z9:6g77ZYUpcAO" />
          <node concept="2iRkQZ" id="6g77ZYUpdnl" role="2czzBx" />
          <node concept="3F0ifn" id="6g77ZYUpdnm" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="6g77ZYUpdnn" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="zf_u2EOzmN" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
      <node concept="2iRkQZ" id="62xxBiE6swo" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="62xxBiE6Cn3">
    <ref role="1XX52x" to="u1z9:1x4fgD956aP" resolve="AppMode" />
    <node concept="3EZMnI" id="7ZTJPb1Tnuz" role="2wV5jI">
      <node concept="3F0ifn" id="7ZTJPb1TnuG" role="3EZMnx">
        <property role="3F0ifm" value="AppMode" />
      </node>
      <node concept="l2Vlx" id="7ZTJPb1Tnu$" role="2iSdaV" />
      <node concept="3F0A7n" id="62xxBiE6Cn5" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      </node>
    </node>
  </node>
</model>

