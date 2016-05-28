<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:8403e997-bd9b-4615-953b-ac6f5b6c9aae(oil.isr.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="pm0g" ref="r:a120e144-5a26-480a-a1f6-9c08266ca2f6(oil.isr.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <property id="1140524450557" name="separatorText" index="2czwfO" />
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
        <child id="1140524464359" name="emptyCellModel" index="2czzBI" />
      </concept>
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
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="JBnlGGDxpe">
    <ref role="1XX52x" to="pm0g:62xxBiE6fO3" resolve="ISRType" />
    <node concept="3EZMnI" id="JBnlGGDxpm" role="2wV5jI">
      <node concept="3F0ifn" id="62xxBiE6fO7" role="3EZMnx">
        <property role="3F0ifm" value="(I)" />
      </node>
      <node concept="1iCGBv" id="62xxBiE6fOd" role="3EZMnx">
        <ref role="1NtTu8" to="pm0g:62xxBiE6fO4" />
        <node concept="1sVBvm" id="62xxBiE6fOf" role="1sWHZn">
          <node concept="3F0A7n" id="62xxBiE6fOn" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="2q8YB8RhSic" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGDxpW">
    <ref role="1XX52x" to="pm0g:1x4fgD956dS" resolve="ISR" />
    <node concept="3EZMnI" id="JBnlGGDxpY" role="2wV5jI">
      <node concept="3EZMnI" id="JBnlGGDxqo" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDxqq" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="JBnlGGDxqB" role="3EZMnx">
          <property role="3F0ifm" value="ISR" />
        </node>
        <node concept="3F0A7n" id="JBnlGGDxqR" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="JBnlGGDxr1" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
        <node concept="l2Vlx" id="JBnlGGDxrx" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGDxrf" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDxrh" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGDxs5" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGDxsd" role="3EZMnx">
          <property role="3F0ifm" value="ISR category" />
        </node>
        <node concept="l2Vlx" id="JBnlGGDxrk" role="2iSdaV" />
        <node concept="3F0A7n" id="JBnlGGDxsn" role="3EZMnx">
          <ref role="1NtTu8" to="pm0g:2WOANQOwsfT" resolve="category" />
        </node>
      </node>
      <node concept="3EZMnI" id="JBnlGGDxsF" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDxsH" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGDxt7" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGDxtc" role="3EZMnx">
          <property role="3F0ifm" value="uses Resources" />
        </node>
        <node concept="3F2HdR" id="JBnlGGDxtm" role="3EZMnx">
          <property role="2czwfO" value="," />
          <ref role="1NtTu8" to="pm0g:2WOANQOwsi8" />
          <node concept="l2Vlx" id="JBnlGGDxto" role="2czzBx" />
          <node concept="3F0ifn" id="JBnlGGDxtu" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="JBnlGGDxsK" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGDxtQ" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDxtS" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGDxum" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGDxuu" role="3EZMnx">
          <property role="3F0ifm" value="uses Messages" />
        </node>
        <node concept="3F2HdR" id="JBnlGGDxuI" role="3EZMnx">
          <property role="2czwfO" value="," />
          <ref role="1NtTu8" to="pm0g:2WOANQOwsia" />
          <node concept="l2Vlx" id="JBnlGGDxuK" role="2czzBx" />
          <node concept="3F0ifn" id="JBnlGGDxuQ" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="JBnlGGDxtV" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="JBnlGGDxuS" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
      <node concept="2iRkQZ" id="JBnlGGDxq1" role="2iSdaV" />
    </node>
  </node>
</model>

