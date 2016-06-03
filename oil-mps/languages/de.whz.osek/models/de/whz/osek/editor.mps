<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:14f33158-518b-490e-a475-66b7b7b8c6de(de.whz.osek.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="oo9t" ref="r:418b8b47-9721-4050-9bc9-93530e3b68a5(oil.timer.structure)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
    <import index="qdv7" ref="r:1ff3d952-eae5-4d94-b89e-ea3060b11545(com.mbeddr.cc.var.annotations.structure)" />
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
      </concept>
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
        <child id="1140524464359" name="emptyCellModel" index="2czzBI" />
      </concept>
      <concept id="1078308402140" name="jetbrains.mps.lang.editor.structure.CellModel_Custom" flags="sg" stub="8104358048506730068" index="gc7cB">
        <child id="1176795024817" name="cellProvider" index="3YsKMw" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1106270637846" name="jetbrains.mps.lang.editor.structure.CellLayout_Flow" flags="nn" index="2iR$Sn" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1237307900041" name="jetbrains.mps.lang.editor.structure.IndentLayoutIndentStyleClassItem" flags="ln" index="lj46D" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="5944657839000868711" name="jetbrains.mps.lang.editor.structure.ConceptEditorContextHints" flags="ig" index="2ABfQD">
        <child id="5944657839000877563" name="hints" index="2ABdcP" />
      </concept>
      <concept id="5944657839003601246" name="jetbrains.mps.lang.editor.structure.ConceptEditorHintDeclaration" flags="ig" index="2BsEeg">
        <property id="168363875802087287" name="showInUI" index="2gpH_U" />
        <property id="5944657839012629576" name="presentation" index="2BUmq6" />
      </concept>
      <concept id="1078938745671" name="jetbrains.mps.lang.editor.structure.EditorComponentDeclaration" flags="ig" index="PKFIW" />
      <concept id="1186403751766" name="jetbrains.mps.lang.editor.structure.FontStyleStyleClassItem" flags="ln" index="Vb9p2" />
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414860679" name="jetbrains.mps.lang.editor.structure.EditableStyleClassItem" flags="ln" index="VPxyj" />
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1233758997495" name="jetbrains.mps.lang.editor.structure.PunctuationLeftStyleClassItem" flags="ln" index="11L4FC" />
      <concept id="1233759184865" name="jetbrains.mps.lang.editor.structure.PunctuationRightStyleClassItem" flags="ln" index="11LMrY" />
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
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
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
      <concept id="1176749715029" name="jetbrains.mps.lang.editor.structure.QueryFunction_CellProvider" flags="in" index="3VJUX4" />
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="7453996997717780434" name="jetbrains.mps.lang.smodel.structure.Node_GetSConceptOperation" flags="nn" index="2yIwOk" />
      <concept id="1154546950173" name="jetbrains.mps.lang.smodel.structure.ConceptReference" flags="ng" index="3gn64h">
        <reference id="1154546997487" name="concept" index="3gnhBz" />
      </concept>
      <concept id="6039268229364358244" name="jetbrains.mps.lang.smodel.structure.ExactConceptCase" flags="ng" index="1pnPoh">
        <child id="6039268229364358388" name="body" index="1pnPq1" />
        <child id="6039268229364358387" name="concept" index="1pnPq6" />
      </concept>
      <concept id="5944356402132808749" name="jetbrains.mps.lang.smodel.structure.ConceptSwitchStatement" flags="nn" index="1_3QMa">
        <child id="6039268229365417680" name="defaultBlock" index="1prKM_" />
        <child id="5944356402132808753" name="case" index="1_3QMm" />
        <child id="5944356402132808752" name="expression" index="1_3QMn" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="2ABfQD" id="3MPhGBwyb2A">
    <property role="TrG5h" value="ImplementationEditors" />
    <node concept="2BsEeg" id="3MPhGBwylQJ" role="2ABdcP">
      <property role="2gpH_U" value="true" />
      <property role="TrG5h" value="Implementation" />
      <property role="2BUmq6" value="Write the C-Code" />
    </node>
    <node concept="2BsEeg" id="3MPhGBwyb2B" role="2ABdcP">
      <property role="2gpH_U" value="true" />
      <property role="TrG5h" value="Oil" />
      <property role="2BUmq6" value="Specifiy the OIL-File" />
    </node>
  </node>
  <node concept="24kQdi" id="2UjW4IkGBZT">
    <ref role="1XX52x" to="bwbq:2UjW4IkGBZG" resolve="User1msIsrType2" />
    <node concept="3EZMnI" id="2UjW4IkGC0N" role="2wV5jI">
      <node concept="l2Vlx" id="2UjW4IkGC0O" role="2iSdaV" />
      <node concept="3F2HdR" id="2UjW4IkGC0T" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:2UjW4IkGBZM" />
        <node concept="l2Vlx" id="2UjW4IkGC0V" role="2czzBx" />
      </node>
    </node>
    <node concept="3F0ifn" id="7saPwHYI40A" role="6VMZX" />
  </node>
  <node concept="PKFIW" id="2UjW4IkGC0o">
    <property role="TrG5h" value="User1msIsrType2SignalCounter" />
    <ref role="1XX52x" to="oo9t:3nHUyvAzu98" resolve="CounterType" />
    <node concept="3EZMnI" id="2UjW4IkGC0q" role="2wV5jI">
      <node concept="1iCGBv" id="2UjW4IkGC0$" role="3EZMnx">
        <ref role="1NtTu8" to="oo9t:3nHUyvAzu9b" />
        <node concept="1sVBvm" id="2UjW4IkGC0A" role="1sWHZn">
          <node concept="3EZMnI" id="2UjW4IkGC1b" role="2wV5jI">
            <node concept="3F0ifn" id="2UjW4IkGC1l" role="3EZMnx">
              <property role="3F0ifm" value="SignalCounter(" />
              <node concept="11LMrY" id="2UjW4IkGC3v" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
            <node concept="3F0A7n" id="2UjW4IkGC1t" role="3EZMnx">
              <property role="1Intyy" value="true" />
              <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
            </node>
            <node concept="3F0ifn" id="2UjW4IkGC1B" role="3EZMnx">
              <property role="3F0ifm" value=");" />
              <node concept="11L4FC" id="2UjW4IkGC6P" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
            <node concept="l2Vlx" id="2UjW4IkGC1e" role="2iSdaV" />
            <node concept="VPM3Z" id="2UjW4IkGC1f" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="2UjW4IkGC0t" role="2iSdaV" />
    </node>
  </node>
  <node concept="PKFIW" id="2UjW4IkGDEY">
    <property role="TrG5h" value="User1msIsrType2DeclareCounter" />
    <ref role="1XX52x" to="oo9t:3nHUyvAzu98" resolve="CounterType" />
    <node concept="3EZMnI" id="2UjW4IkGDEZ" role="2wV5jI">
      <node concept="1iCGBv" id="2UjW4IkGDF0" role="3EZMnx">
        <ref role="1NtTu8" to="oo9t:3nHUyvAzu9b" />
        <node concept="1sVBvm" id="2UjW4IkGDF1" role="1sWHZn">
          <node concept="3EZMnI" id="2UjW4IkGDF2" role="2wV5jI">
            <node concept="3F0ifn" id="2UjW4IkGDF3" role="3EZMnx">
              <property role="3F0ifm" value="DeclareCounter(" />
              <node concept="11LMrY" id="2UjW4IkGDF4" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
            <node concept="3F0A7n" id="2UjW4IkGDF5" role="3EZMnx">
              <property role="1Intyy" value="true" />
              <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
            </node>
            <node concept="3F0ifn" id="2UjW4IkGDF6" role="3EZMnx">
              <property role="3F0ifm" value=");" />
              <node concept="11L4FC" id="2UjW4IkGDF7" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
            <node concept="l2Vlx" id="2UjW4IkGDF8" role="2iSdaV" />
            <node concept="VPM3Z" id="2UjW4IkGDF9" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="2UjW4IkGDFa" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="2UjW4IkI07o">
    <ref role="1XX52x" to="bwbq:2UjW4IkI07e" resolve="DeclareCounterMacro" />
    <node concept="3EZMnI" id="2UjW4IkI07q" role="2wV5jI">
      <node concept="3F0ifn" id="2UjW4IkI07x" role="3EZMnx">
        <property role="3F0ifm" value="DeclareCounter(" />
        <node concept="11LMrY" id="2UjW4IkI0bu" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="3F0A7n" id="2UjW4IkI_p_" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      </node>
      <node concept="3F0ifn" id="2UjW4IkI084" role="3EZMnx">
        <property role="3F0ifm" value=");" />
        <node concept="11L4FC" id="2UjW4IkI09N" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="l2Vlx" id="2UjW4IkI07t" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="6Jey9O34z$h">
    <ref role="1XX52x" to="bwbq:6Jey9O34sBE" resolve="OilFileRef" />
    <node concept="3EZMnI" id="6Jey9O34z$j" role="2wV5jI">
      <node concept="3F0ifn" id="6Jey9O34z$q" role="3EZMnx">
        <property role="3F0ifm" value="OilFile:" />
      </node>
      <node concept="1iCGBv" id="6Jey9O34z$w" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:6Jey9O34sBH" />
        <node concept="1sVBvm" id="6Jey9O34z$y" role="1sWHZn">
          <node concept="3F0A7n" id="6Jey9O34z$H" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="6Jey9O34z$m" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="4B0n6H25cOo">
    <ref role="1XX52x" to="bwbq:4B0n6H25803" resolve="OilObjectRef" />
    <node concept="1iCGBv" id="4B0n6H25cOq" role="2wV5jI">
      <ref role="1NtTu8" to="bwbq:4B0n6H258gR" />
      <node concept="1sVBvm" id="4B0n6H25cOs" role="1sWHZn">
        <node concept="3F0A7n" id="4B0n6H25cOz" role="2wV5jI">
          <property role="1Intyy" value="true" />
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="78Vwcm5y3Yy">
    <ref role="1XX52x" to="bwbq:5YkaFUJYIz$" resolve="OilFilesConfigItem" />
    <node concept="3EZMnI" id="4ha9sSdKUWv" role="2wV5jI">
      <node concept="2iRfu4" id="4ha9sSdKUWw" role="2iSdaV" />
      <node concept="3F0ifn" id="4ha9sSdKUWx" role="3EZMnx">
        <property role="3F0ifm" value="Oil-Files:" />
      </node>
      <node concept="gc7cB" id="4ha9sSdKUWy" role="3EZMnx">
        <node concept="3VJUX4" id="4ha9sSdKUWz" role="3YsKMw">
          <node concept="3clFbS" id="4ha9sSdKUW$" role="2VODD2">
            <node concept="3clFbF" id="4ha9sSdKUW_" role="3cqZAp">
              <node concept="2ShNRf" id="4ha9sSdKUWA" role="3clFbG">
                <node concept="1pGfFk" id="4ha9sSdKUWB" role="2ShVmc">
                  <ref role="37wK5l" to="r4b4:6Ce4x7KQbw2" resolve="ColoredVerticalBarCell" />
                  <node concept="pncrf" id="4ha9sSdKUWC" role="37wK5m" />
                  <node concept="10M0yZ" id="4ha9sSdKUWD" role="37wK5m">
                    <ref role="3cqZAo" to="z60i:~Color.gray" resolve="gray" />
                    <ref role="1PxDUh" to="z60i:~Color" resolve="Color" />
                  </node>
                  <node concept="3cmrfG" id="4ha9sSdKUWE" role="37wK5m">
                    <property role="3cmrfH" value="0" />
                  </node>
                  <node concept="3cmrfG" id="4ha9sSdKUWF" role="37wK5m">
                    <property role="3cmrfH" value="2" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3F2HdR" id="4ha9sSdKUWI" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:5YkaFUJYIzB" />
        <node concept="2iRkQZ" id="78Vwcm5yGmu" role="2czzBx" />
        <node concept="3F0ifn" id="4ha9sSdKUWM" role="2czzBI">
          <property role="3F0ifm" value="" />
          <node concept="VPxyj" id="4ha9sSdKUWN" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="6g77ZYUpzC$">
    <property role="3GE5qa" value="Resource" />
    <ref role="1XX52x" to="bwbq:6g77ZYUpzaO" resolve="ResourceLiteral" />
    <node concept="3EZMnI" id="6g77ZYUpBQ2" role="2wV5jI">
      <node concept="3EZMnI" id="JBnlGGDfcd" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDfcf" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="JBnlGGDfcv" role="3EZMnx">
          <property role="3F0ifm" value="Resource" />
        </node>
        <node concept="3F0A7n" id="JBnlGGDfcG" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="JBnlGGDfcQ" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="JBnlGGDfci" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGDfd4" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDfd6" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGDfdm" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGDfdC" role="3EZMnx">
          <property role="3F0ifm" value="type" />
        </node>
        <node concept="3F0A7n" id="JBnlGGDfdu" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:6g77ZYUpzCl" resolve="property" />
        </node>
        <node concept="l2Vlx" id="JBnlGGDfd9" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="JBnlGGDfdI" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
      <node concept="2iRkQZ" id="6g77ZYUpBQ5" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="6g77ZYUpC96">
    <property role="3GE5qa" value="Resource" />
    <ref role="1XX52x" to="bwbq:6g77ZYUpC8T" resolve="ResourceDeclaration" />
    <node concept="3F1sOY" id="6g77ZYUpC9f" role="2wV5jI">
      <ref role="1NtTu8" to="x27k:2VsHNE717Q8" />
    </node>
    <node concept="3F0A7n" id="6g77ZYUpRFA" role="6VMZX">
      <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGDf8u">
    <property role="3GE5qa" value="Resource" />
    <ref role="1XX52x" to="bwbq:7FCpXS_UQRX" resolve="LinkedResource" />
    <node concept="3EZMnI" id="JBnlGGDf8w" role="2wV5jI">
      <node concept="3EZMnI" id="JBnlGGDf8B" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDf8D" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="JBnlGGDf8N" role="3EZMnx">
          <property role="3F0ifm" value="Resource" />
        </node>
        <node concept="3F0A7n" id="JBnlGGDf90" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="JBnlGGDf9a" role="3EZMnx">
          <property role="3F0ifm" value="{" />
        </node>
        <node concept="l2Vlx" id="JBnlGGDf8G" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE7x5S" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE7x5U" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="62xxBiE7xPQ" role="3EZMnx" />
        <node concept="3F0ifn" id="62xxBiE7x5W" role="3EZMnx">
          <property role="3F0ifm" value="type" />
        </node>
        <node concept="3F0ifn" id="62xxBiE7x6l" role="3EZMnx">
          <property role="3F0ifm" value="linked" />
          <node concept="Vb9p2" id="62xxBiE7x7d" role="3F10Kt" />
        </node>
        <node concept="l2Vlx" id="62xxBiE7x5X" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGDfau" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGDfaw" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="JBnlGGDfaR" role="3EZMnx">
          <property role="3F0ifm" value="links to" />
          <node concept="lj46D" id="JBnlGGDxrN" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="1iCGBv" id="JBnlGGDfb7" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:7FCpXS_UQS7" />
          <node concept="1sVBvm" id="JBnlGGDfb9" role="1sWHZn">
            <node concept="3F0A7n" id="JBnlGGDfbm" role="2wV5jI">
              <property role="1Intyy" value="true" />
              <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
        <node concept="l2Vlx" id="JBnlGGDxrO" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="JBnlGGDfeO" role="3EZMnx">
        <property role="3F0ifm" value="}" />
      </node>
      <node concept="2iRkQZ" id="JBnlGGDf8z" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="3SI56rdKtaB">
    <property role="3GE5qa" value="Resource" />
    <ref role="1XX52x" to="bwbq:1x4fgD956dR" resolve="ResourceRef" />
    <node concept="3EZMnI" id="3SI56rdKHbk" role="2wV5jI">
      <node concept="l2Vlx" id="3SI56rdKHbl" role="2iSdaV" />
      <node concept="3EZMnI" id="1eGaHOMv3Zq" role="3EZMnx">
        <node concept="VPM3Z" id="1eGaHOMv3Zs" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="1eGaHOMv3ZC" role="3EZMnx">
          <property role="3F0ifm" value="(" />
        </node>
        <node concept="3F0ifn" id="1eGaHOMv3ZK" role="3EZMnx">
          <property role="3F0ifm" value="L" />
          <node concept="pkWqt" id="1eGaHOMv40h" role="pqm2j">
            <node concept="3clFbS" id="1eGaHOMv40i" role="2VODD2">
              <node concept="3cpWs8" id="1eGaHOMv4uw" role="3cqZAp">
                <node concept="3cpWsn" id="1eGaHOMv4uz" role="3cpWs9">
                  <property role="TrG5h" value="result" />
                  <node concept="10P_77" id="1eGaHOMv4uu" role="1tU5fm" />
                  <node concept="3clFbT" id="1eGaHOMv5iA" role="33vP2m">
                    <property role="3clFbU" value="false" />
                  </node>
                </node>
              </node>
              <node concept="1_3QMa" id="1eGaHOMv41m" role="3cqZAp">
                <node concept="1pnPoh" id="1eGaHOMv4cX" role="1_3QMm">
                  <node concept="3gn64h" id="6g77ZYUpKqn" role="1pnPq6">
                    <ref role="3gnhBz" to="bwbq:7FCpXS_UQRX" resolve="LinkedResource" />
                  </node>
                  <node concept="3clFbS" id="1eGaHOMv4cZ" role="1pnPq1">
                    <node concept="3clFbF" id="1eGaHOMv4Mi" role="3cqZAp">
                      <node concept="37vLTI" id="1eGaHOMv4Qd" role="3clFbG">
                        <node concept="3clFbT" id="1eGaHOMv4V6" role="37vLTx">
                          <property role="3clFbU" value="true" />
                        </node>
                        <node concept="37vLTw" id="1eGaHOMv4Mh" role="37vLTJ">
                          <ref role="3cqZAo" node="1eGaHOMv4uz" resolve="result" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbS" id="1eGaHOMv4Xq" role="1prKM_" />
                <node concept="2OqwBi" id="1eGaHOMv5Tj" role="1_3QMn">
                  <node concept="2OqwBi" id="1eGaHOMv5Hw" role="2Oq$k0">
                    <node concept="pncrf" id="1eGaHOMv5Fy" role="2Oq$k0" />
                    <node concept="3TrEf2" id="5JhwNflDBGq" role="2OqNvi">
                      <ref role="3Tt5mk" to="x27k:2VsHNE72zUU" />
                    </node>
                  </node>
                  <node concept="2yIwOk" id="1eGaHOMv5YZ" role="2OqNvi" />
                </node>
              </node>
              <node concept="3cpWs6" id="1eGaHOMv59U" role="3cqZAp">
                <node concept="37vLTw" id="1eGaHOMv5ey" role="3cqZAk">
                  <ref role="3cqZAo" node="1eGaHOMv4uz" resolve="result" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3F0ifn" id="1eGaHOMv3ZU" role="3EZMnx">
          <property role="3F0ifm" value="R" />
        </node>
        <node concept="3F0ifn" id="1eGaHOMv406" role="3EZMnx">
          <property role="3F0ifm" value=")" />
        </node>
        <node concept="2iR$Sn" id="1eGaHOMv40d" role="2iSdaV" />
      </node>
      <node concept="1iCGBv" id="6g77ZYUpUQQ" role="3EZMnx">
        <ref role="1NtTu8" to="x27k:2VsHNE72zUU" />
        <node concept="1sVBvm" id="6g77ZYUpUQS" role="1sWHZn">
          <node concept="3F0A7n" id="6g77ZYUpUU1" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

