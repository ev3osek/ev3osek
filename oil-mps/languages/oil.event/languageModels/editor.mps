<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:bce7347b-af5c-4825-b8d0-e9b504ae2e79(oil.event.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="rx5q" ref="r:8e560f65-464b-43d8-97bf-faadc37f178e(oil.event.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ng" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
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
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="_SoWTEeejV">
    <ref role="1XX52x" to="rx5q:1x4fgD956iF" resolve="EventLiteral" />
    <node concept="3EZMnI" id="_SoWTEerA6" role="2wV5jI">
      <node concept="3EZMnI" id="_SoWTEerAd" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEerAf" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="_SoWTEerAu" role="3EZMnx">
          <property role="3F0ifm" value="Event" />
        </node>
        <node concept="3F0A7n" id="_SoWTEerAK" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          <ref role="1k5W1q" to="r4b4:2CEi94dhBxG" resolve="GlobalVariable" />
        </node>
        <node concept="3F0ifn" id="_SoWTEerAU" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="_SoWTEerAi" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEerBy" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEerB$" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEerBO" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE6fNH" role="3EZMnx">
          <property role="3F0ifm" value="mask" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6fNX" role="3EZMnx">
          <ref role="1NtTu8" to="rx5q:78S7ngm5xPO" />
        </node>
        <node concept="l2Vlx" id="_SoWTEerBB" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="_SoWTEerCs" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
      <node concept="2iRkQZ" id="_SoWTEerA9" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="_SoWTEes9w">
    <ref role="1XX52x" to="rx5q:1x4fgD956ve" resolve="EventRef" />
    <node concept="3EZMnI" id="_SoWTEes9y" role="2wV5jI">
      <node concept="3F0ifn" id="_SoWTEes9D" role="3EZMnx">
        <property role="3F0ifm" value="(E)" />
      </node>
      <node concept="1iCGBv" id="_SoWTEes9N" role="3EZMnx">
        <ref role="1NtTu8" to="x27k:2VsHNE72zUU" />
        <node concept="1sVBvm" id="_SoWTEes9P" role="1sWHZn">
          <node concept="3F0A7n" id="_SoWTEesa0" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="_SoWTEes9_" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="4B0n6H25IFw">
    <ref role="1XX52x" to="rx5q:4B0n6H25BL_" resolve="EventDeclaration" />
    <node concept="3F1sOY" id="4B0n6H25IFy" role="2wV5jI">
      <ref role="1NtTu8" to="x27k:2VsHNE717Q8" />
    </node>
  </node>
</model>

