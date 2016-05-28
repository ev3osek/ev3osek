<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:d6cda076-ab08-47b4-b05d-15193d07f6b6(oil.com.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="lx67" ref="r:7462cdd3-8504-48e1-9b09-3f342b4ddf29(oil.com.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
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
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ng" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1139852716018" name="noTargetText" index="1$x2rV" />
        <property id="1140114345053" name="allowEmptyText" index="1O74Pk" />
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
  <node concept="24kQdi" id="zf_u2EOSyg">
    <ref role="1XX52x" to="lx67:1x4fgD956o9" resolve="COM" />
    <node concept="3EZMnI" id="zf_u2EOSyi" role="2wV5jI">
      <node concept="3F0ifn" id="zf_u2EOSyp" role="3EZMnx">
        <property role="3F0ifm" value="COM module {" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOSyv" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOSyx" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOSyG" role="3EZMnx" />
        <node concept="3F0ifn" id="zf_u2EOSyO" role="3EZMnx">
          <property role="3F0ifm" value="status" />
        </node>
        <node concept="3F0A7n" id="zf_u2EOSz4" role="3EZMnx">
          <ref role="1NtTu8" to="lx67:6pX2__D8l7l" resolve="status" />
        </node>
        <node concept="l2Vlx" id="zf_u2EOSy$" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOSEh" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOSEj" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOSF2" role="3EZMnx" />
        <node concept="3F0ifn" id="7ZTJPb1S1Os" role="3EZMnx">
          <property role="3F0ifm" value="timebase in seconds" />
        </node>
        <node concept="3F1sOY" id="7ZTJPb1SqFW" role="3EZMnx">
          <ref role="1NtTu8" to="lx67:7ZTJPb1S2Cz" />
        </node>
        <node concept="l2Vlx" id="zf_u2EOSEm" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOSzj" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOSzl" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOSzA" role="3EZMnx" />
        <node concept="3F0ifn" id="zf_u2EOSzI" role="3EZMnx">
          <property role="3F0ifm" value="start COM while start up" />
        </node>
        <node concept="3F0A7n" id="zf_u2EOSzY" role="3EZMnx">
          <ref role="1NtTu8" to="lx67:6pX2__D8l7f" resolve="startCOMExtension" />
        </node>
        <node concept="l2Vlx" id="zf_u2EOSzo" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOS$j" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOS$l" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOS$G" role="3EZMnx" />
        <node concept="3F0ifn" id="zf_u2EOS$O" role="3EZMnx">
          <property role="3F0ifm" value="use other oil files:" />
        </node>
        <node concept="3F0A7n" id="zf_u2EOS_4" role="3EZMnx">
          <property role="1O74Pk" value="true" />
          <property role="1$x2rV" value="&lt;Path to other OIL Files&gt;" />
          <ref role="1NtTu8" to="lx67:6pX2__D8qNa" resolve="use" />
        </node>
        <node concept="l2Vlx" id="zf_u2EOS$o" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOS_D" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOS_F" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOSCx" role="3EZMnx" />
        <node concept="3F0ifn" id="zf_u2EOSAc" role="3EZMnx">
          <property role="3F0ifm" value="use service ID" />
        </node>
        <node concept="3F0A7n" id="zf_u2EOSAs" role="3EZMnx">
          <ref role="1NtTu8" to="lx67:6pX2__D8l6T" resolve="useServiceID" />
        </node>
        <node concept="l2Vlx" id="zf_u2EOS_I" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOSAX" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOSAZ" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOSBy" role="3EZMnx" />
        <node concept="3F0ifn" id="zf_u2EOSBE" role="3EZMnx">
          <property role="3F0ifm" value="use parameter access" />
        </node>
        <node concept="3F0A7n" id="zf_u2EOSBU" role="3EZMnx">
          <ref role="1NtTu8" to="lx67:6pX2__D8l7a" resolve="useParameterAccess" />
        </node>
        <node concept="l2Vlx" id="zf_u2EOSB2" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOSCB" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOSCD" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOSDi" role="3EZMnx" />
        <node concept="3F0ifn" id="zf_u2EOSD$" role="3EZMnx">
          <property role="3F0ifm" value="use error hook" />
        </node>
        <node concept="3F0A7n" id="zf_u2EOSDq" role="3EZMnx">
          <ref role="1NtTu8" to="lx67:6pX2__D8l6Q" resolve="errorHook" />
        </node>
        <node concept="l2Vlx" id="zf_u2EOSCG" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="zf_u2EOSIS" role="3EZMnx">
        <node concept="VPM3Z" id="zf_u2EOSIU" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="zf_u2EOSJI" role="3EZMnx" />
        <node concept="3F0ifn" id="zf_u2EOSK3" role="3EZMnx">
          <property role="3F0ifm" value="allowed in app modes" />
        </node>
        <node concept="3F2HdR" id="zf_u2EOSJQ" role="3EZMnx">
          <property role="2czwfO" value="," />
          <ref role="1NtTu8" to="lx67:6pX2__D8qMC" />
          <node concept="l2Vlx" id="zf_u2EOSJS" role="2czzBx" />
          <node concept="3F0ifn" id="zf_u2EOSKa" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="zf_u2EOSIX" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="zf_u2EOTzh" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
      <node concept="2iRkQZ" id="zf_u2EOSyl" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="1eGaHOMvqOI">
    <ref role="1XX52x" to="lx67:1x4fgD956pO" resolve="IPDU" />
    <node concept="3EZMnI" id="1eGaHOMvqOK" role="2wV5jI">
      <node concept="3F0ifn" id="1eGaHOMvqOR" role="3EZMnx">
        <property role="3F0ifm" value="IPDU" />
      </node>
      <node concept="3F0A7n" id="1eGaHOMvqP1" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      </node>
      <node concept="l2Vlx" id="1eGaHOMvqON" role="2iSdaV" />
    </node>
  </node>
</model>

