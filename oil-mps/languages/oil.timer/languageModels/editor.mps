<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:316d9ad7-c205-4723-8e65-0167df8bc017(oil.timer.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
  </languages>
  <imports>
    <import index="oo9t" ref="r:418b8b47-9721-4050-9bc9-93530e3b68a5(oil.timer.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" implicit="true" />
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
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="JBnlGGBxA1">
    <ref role="1XX52x" to="oo9t:5KtH1a6jX_3" resolve="Counter" />
    <node concept="3EZMnI" id="JBnlGGBxAK" role="2wV5jI">
      <node concept="2iRkQZ" id="JBnlGGBxAL" role="2iSdaV" />
      <node concept="3EZMnI" id="JBnlGGBxAf" role="3EZMnx">
        <node concept="3F0ifn" id="JBnlGGBxAh" role="3EZMnx">
          <property role="3F0ifm" value="Counter" />
        </node>
        <node concept="3F0A7n" id="JBnlGGBxAt" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="JBnlGGBxAF" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="JBnlGGBxAi" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGBxBj" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGBxBl" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGBxD5" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGBxBK" role="3EZMnx">
          <property role="3F0ifm" value="minimum cycle" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6gl7" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:78S7ngm5xPy" />
        </node>
        <node concept="l2Vlx" id="JBnlGGBxBo" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGBxCt" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGBxCv" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGBxD0" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE6glg" role="3EZMnx">
          <property role="3F0ifm" value="increments by" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6glq" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:78S7ngm5xPv" />
        </node>
        <node concept="l2Vlx" id="JBnlGGBxCy" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGBxEu" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGBxEw" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGBxEV" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGBxF3" role="3EZMnx">
          <property role="3F0ifm" value="maximum value" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6glC" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:78S7ngm5xPc" />
        </node>
        <node concept="l2Vlx" id="JBnlGGBxEz" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="JBnlGGBxFt" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGCADY">
    <ref role="1XX52x" to="oo9t:7FCpXS_WSTn" resolve="AlarmAutostart" />
    <node concept="3EZMnI" id="JBnlGGCAE0" role="2wV5jI">
      <node concept="3F0ifn" id="JBnlGGD4GF" role="3EZMnx">
        <property role="3F0ifm" value="use Autostart" />
      </node>
      <node concept="2iRkQZ" id="JBnlGGCAE3" role="2iSdaV" />
      <node concept="3EZMnI" id="JBnlGGCAED" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCAEF" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGD4Hr" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGCAF8" role="3EZMnx">
          <property role="3F0ifm" value="first alarm after" />
        </node>
        <node concept="l2Vlx" id="JBnlGGCAEI" role="2iSdaV" />
        <node concept="3F1sOY" id="62xxBiE6gko" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:78S7ngm5xPA" />
        </node>
        <node concept="3F0ifn" id="JBnlGGCAH_" role="3EZMnx">
          <property role="3F0ifm" value="ticks" />
        </node>
      </node>
      <node concept="3EZMnI" id="JBnlGGCAFn" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCAFp" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGD4HC" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGCAGB" role="3EZMnx">
          <property role="3F0ifm" value="alarm every" />
        </node>
        <node concept="l2Vlx" id="JBnlGGCAFs" role="2iSdaV" />
        <node concept="3F1sOY" id="62xxBiE6gkC" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:78S7ngm5xPC" />
        </node>
        <node concept="3F0ifn" id="JBnlGGCAHM" role="3EZMnx">
          <property role="3F0ifm" value="ticks" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGCGZX">
    <ref role="1XX52x" to="oo9t:7FCpXS_WYAv" resolve="AlarmActionCallback" />
    <node concept="3EZMnI" id="JBnlGGCGZZ" role="2wV5jI">
      <node concept="3F0ifn" id="JBnlGGCH06" role="3EZMnx">
        <property role="3F0ifm" value="use Callback" />
      </node>
      <node concept="3F0A7n" id="JBnlGGCH0c" role="3EZMnx">
        <ref role="1NtTu8" to="oo9t:7FCpXS_WYAw" resolve="callbackName" />
      </node>
      <node concept="l2Vlx" id="JBnlGGCH02" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGCIHq">
    <ref role="1XX52x" to="oo9t:7FCpXS_WYDG" resolve="AlarmActionActivateTask" />
    <node concept="3EZMnI" id="JBnlGGCIHs" role="2wV5jI">
      <node concept="3F0ifn" id="JBnlGGCIHz" role="3EZMnx">
        <property role="3F0ifm" value="activate Task" />
      </node>
      <node concept="1iCGBv" id="JBnlGGCII5" role="3EZMnx">
        <ref role="1NtTu8" to="oo9t:7FCpXS_WYGX" />
        <node concept="1sVBvm" id="JBnlGGCII7" role="1sWHZn">
          <node concept="3F0A7n" id="JBnlGGCIIp" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="JBnlGGCIHv" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGCKFj">
    <ref role="1XX52x" to="oo9t:7FCpXS_WYIB" resolve="AlarmActionSetEvent" />
    <node concept="3EZMnI" id="JBnlGGCKFo" role="2wV5jI">
      <node concept="3F0ifn" id="JBnlGGCKFq" role="3EZMnx">
        <property role="3F0ifm" value="activate Event" />
      </node>
      <node concept="1iCGBv" id="JBnlGGCKFA" role="3EZMnx">
        <ref role="1NtTu8" to="oo9t:7FCpXS_WYKh" />
        <node concept="1sVBvm" id="JBnlGGCKFC" role="1sWHZn">
          <node concept="3F0A7n" id="JBnlGGCKGz" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="JBnlGGCKFT" role="3EZMnx">
        <property role="3F0ifm" value="and Task" />
      </node>
      <node concept="1iCGBv" id="JBnlGGCKGf" role="3EZMnx">
        <ref role="1NtTu8" to="oo9t:7FCpXS_WYGX" />
        <node concept="1sVBvm" id="JBnlGGCKGh" role="1sWHZn">
          <node concept="3F0A7n" id="JBnlGGCKGw" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="JBnlGGCKFr" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGCVg3">
    <ref role="1XX52x" to="oo9t:1x4fgD956fc" resolve="Alarm" />
    <node concept="3EZMnI" id="JBnlGGCVg5" role="2wV5jI">
      <node concept="3EZMnI" id="JBnlGGCVgc" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCVge" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="JBnlGGCVgo" role="3EZMnx">
          <property role="3F0ifm" value="Alarm" />
        </node>
        <node concept="3F0A7n" id="JBnlGGCVg_" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="JBnlGGCVgJ" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="JBnlGGCVgh" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGCVh7" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCVh9" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGCViJ" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGCViP" role="3EZMnx">
          <property role="3F0ifm" value="use Counter" />
        </node>
        <node concept="1iCGBv" id="JBnlGGCVj2" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:7FCpXS_WYu$" />
          <node concept="1sVBvm" id="JBnlGGCVj4" role="1sWHZn">
            <node concept="3F0A7n" id="JBnlGGCVjg" role="2wV5jI">
              <property role="1Intyy" value="true" />
              <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
        <node concept="l2Vlx" id="JBnlGGCVhc" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGCVlk" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCVlm" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGCVlM" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGCVlU" role="3EZMnx">
          <property role="3F0ifm" value="action:" />
        </node>
        <node concept="3F1sOY" id="JBnlGGCVm4" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:7FCpXS_WYQV" />
        </node>
        <node concept="l2Vlx" id="JBnlGGCVlp" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGCVmE" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCVmG" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGCVne" role="3EZMnx" />
        <node concept="3F1sOY" id="JBnlGGCVno" role="3EZMnx">
          <ref role="1NtTu8" to="oo9t:7FCpXS_WYwf" />
        </node>
        <node concept="l2Vlx" id="JBnlGGCVmJ" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGCVpt" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCVpv" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGCVq2" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGCVq9" role="3EZMnx">
          <property role="3F0ifm" value="allowed in App Modes" />
        </node>
        <node concept="3F2HdR" id="JBnlGGCVqp" role="3EZMnx">
          <property role="2czwfO" value="," />
          <ref role="1NtTu8" to="oo9t:62xxBiE6gkR" />
          <node concept="l2Vlx" id="JBnlGGCVqr" role="2czzBx" />
          <node concept="3F0ifn" id="JBnlGGCVqx" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="JBnlGGCVpy" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="JBnlGGCVsg" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
      <node concept="2iRkQZ" id="JBnlGGCVg8" role="2iSdaV" />
    </node>
  </node>
</model>

