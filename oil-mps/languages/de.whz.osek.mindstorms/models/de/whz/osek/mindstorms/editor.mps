<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:1c87ad17-0db5-40a4-945d-99577a3e6003(de.whz.osek.mindstorms.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="p70l" ref="r:03a6131a-45fb-41fe-997e-86ce9462eaef(com.mbeddr.core.buildconfig.editor)" />
    <import index="f1b2" ref="r:d71c8116-04a3-4636-a4a4-ecaa1d59d2d4(de.whz.osek.mindstorms.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
      </concept>
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1237307900041" name="jetbrains.mps.lang.editor.structure.IndentLayoutIndentStyleClassItem" flags="ln" index="lj46D" />
      <concept id="1237308012275" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineStyleClassItem" flags="ln" index="ljvvj" />
      <concept id="1237385578942" name="jetbrains.mps.lang.editor.structure.IndentLayoutOnNewLineStyleClassItem" flags="ln" index="pVoyu" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ng" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1139852716018" name="noTargetText" index="1$x2rV" />
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
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="3DyPeXjWR99">
    <ref role="1XX52x" to="f1b2:46z1WQnkGHW" resolve="DeviceInitialization" />
    <node concept="3F0ifn" id="3DyPeXjWR9b" role="6VMZX" />
    <node concept="3EZMnI" id="3DyPeXjWR9o" role="2wV5jI">
      <node concept="3F0ifn" id="4NwoSLUg5rH" role="3EZMnx">
        <property role="3F0ifm" value="init" />
      </node>
      <node concept="3F1sOY" id="4NwoSLUfnM1" role="3EZMnx">
        <ref role="1NtTu8" to="x27k:3CmSUB7Fp_k" />
      </node>
      <node concept="l2Vlx" id="4NwoSLUg8ls" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="3DyPeXjX0x1">
    <ref role="1XX52x" to="f1b2:3DyPeXjX0wR" resolve="DeviceTermination" />
    <node concept="3EZMnI" id="3DyPeXjX0x3" role="2wV5jI">
      <node concept="3F0ifn" id="4NwoSLUg5rK" role="3EZMnx">
        <property role="3F0ifm" value="terminate" />
      </node>
      <node concept="l2Vlx" id="4NwoSLUg6SP" role="2iSdaV" />
      <node concept="3F1sOY" id="4NwoSLUfnBS" role="3EZMnx">
        <ref role="1NtTu8" to="x27k:3CmSUB7Fp_k" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="5mFAe9pgl_T">
    <property role="3GE5qa" value="platform" />
    <ref role="1XX52x" to="f1b2:4NwoSLUfe0h" resolve="EV3Platform" />
    <node concept="3EZMnI" id="4BxItZJ4BoY" role="2wV5jI">
      <node concept="l2Vlx" id="4BxItZJ4Bp0" role="2iSdaV" />
      <node concept="3F0ifn" id="3Ulkr59M5QI" role="3EZMnx">
        <property role="3F0ifm" value="EV3" />
      </node>
      <node concept="3F0ifn" id="7c6uq_OtvlA" role="3EZMnx">
        <property role="3F0ifm" value="paths are not checked" />
        <ref role="1k5W1q" to="r4b4:2$$_2GR98qO" resolve="readOnly" />
      </node>
      <node concept="3F0ifn" id="4BxItZJ4Bp4" role="3EZMnx">
        <property role="3F0ifm" value="make:" />
        <node concept="lj46D" id="4BxItZJ4Bp5" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="4BxItZJ4Bp6" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="4BxItZJ4Bp7" role="3EZMnx">
        <ref role="1NtTu8" to="f1b2:6uyTK8G8sWC" resolve="make" />
        <node concept="ljvvj" id="4BxItZJ4Bp8" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="3s1LyzG8Jy5" role="3EZMnx">
        <property role="3F0ifm" value="compiler" />
        <node concept="lj46D" id="3s1LyzG8Jy6" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="3s1LyzG8Jy7" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3EZMnI" id="3s1LyzGERJE" role="3EZMnx">
        <node concept="VPM3Z" id="3s1LyzGERJG" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="lj46D" id="3s1LyzGERKJ" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="3s1LyzGERKK" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3F0ifn" id="3s1LyzGERNG" role="3EZMnx">
          <property role="3F0ifm" value="path to executable:" />
          <node concept="lj46D" id="3s1LyzGERPc" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0A7n" id="3s1LyzGEROL" role="3EZMnx">
          <ref role="1NtTu8" to="f1b2:6uyTK8G8sWA" resolve="compiler" />
          <node concept="ljvvj" id="3s1LyzGERP5" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="PMmxH" id="2obGnlQTQxr" role="3EZMnx">
          <ref role="PMmxG" to="p70l:2obGnlQStXy" resolve="buildProcessors" />
          <node concept="pVoyu" id="2obGnlQTQzm" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="lj46D" id="2obGnlQTQ$Z" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="l2Vlx" id="3s1LyzGERJJ" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="75ETgceep2k" role="3EZMnx">
        <property role="3F0ifm" value="Path to ev3osek directory =" />
        <node concept="lj46D" id="75ETgceep2M" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="75ETgceep2N" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="75ETgceep3m" role="3EZMnx">
        <property role="1$x2rV" value="e.g. /home/ev3/Schreibtisch/ev3osek" />
        <ref role="1NtTu8" to="f1b2:75ETgceep0U" resolve="ev3osek_Root" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="1I2SOvka8ed">
    <property role="3GE5qa" value="platform" />
    <ref role="1XX52x" to="f1b2:1I2SOvka8e2" resolve="NxtPlatform" />
    <node concept="3EZMnI" id="1I2SOvka8ef" role="2wV5jI">
      <node concept="l2Vlx" id="1I2SOvka8eg" role="2iSdaV" />
      <node concept="3F0ifn" id="1I2SOvka8eh" role="3EZMnx">
        <property role="3F0ifm" value="NXT" />
      </node>
      <node concept="3F0ifn" id="1I2SOvka8ei" role="3EZMnx">
        <property role="3F0ifm" value="paths are not checked" />
        <ref role="1k5W1q" to="r4b4:2$$_2GR98qO" resolve="readOnly" />
      </node>
      <node concept="3F0ifn" id="1I2SOvka8ej" role="3EZMnx">
        <property role="3F0ifm" value="make:" />
        <node concept="lj46D" id="1I2SOvka8ek" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="1I2SOvka8el" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="1I2SOvka8em" role="3EZMnx">
        <ref role="1NtTu8" to="f1b2:1I2SOvka8e5" resolve="make" />
        <node concept="ljvvj" id="1I2SOvka8en" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0ifn" id="1I2SOvka8eo" role="3EZMnx">
        <property role="3F0ifm" value="compiler" />
        <node concept="lj46D" id="1I2SOvka8ep" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="1I2SOvka8eq" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3EZMnI" id="1I2SOvka8er" role="3EZMnx">
        <node concept="VPM3Z" id="1I2SOvka8es" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="lj46D" id="1I2SOvka8et" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="1I2SOvka8eu" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="3F0ifn" id="1I2SOvka8ev" role="3EZMnx">
          <property role="3F0ifm" value="path to executable:" />
          <node concept="lj46D" id="1I2SOvka8ew" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0A7n" id="1I2SOvka8ex" role="3EZMnx">
          <ref role="1NtTu8" to="f1b2:1I2SOvka8e3" resolve="compiler" />
          <node concept="ljvvj" id="1I2SOvka8ey" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="PMmxH" id="1I2SOvka8ez" role="3EZMnx">
          <ref role="PMmxG" to="p70l:2obGnlQStXy" resolve="buildProcessors" />
          <node concept="pVoyu" id="1I2SOvka8e$" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
          <node concept="lj46D" id="1I2SOvka8e_" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="l2Vlx" id="1I2SOvka8eA" role="2iSdaV" />
      </node>
    </node>
  </node>
</model>

