<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:99eb5b74-7446-4dec-a0fd-73221ee99662(oil.task.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="4if3" ref="r:14f33158-518b-490e-a475-66b7b7b8c6de(de.whz.osek.editor)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="cl6c" ref="r:890ea833-37c9-445e-a04d-3b69ce24aa30(com.mbeddr.core.modules.editor)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="tpen" ref="r:00000000-0000-4000-0000-011c895902c3(jetbrains.mps.baseLanguage.editor)" />
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="j4gk" ref="r:44b6f9b4-bfdb-4b99-b104-960ec485d777(com.mbeddr.core.statements.editor)" />
    <import index="sxb1" ref="r:e0f1041f-50c7-4cb6-be85-b08f97c50ebb(oil.task.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
        <child id="2597348684684069742" name="contextHints" index="CpUAK" />
      </concept>
      <concept id="6822301196700715228" name="jetbrains.mps.lang.editor.structure.ConceptEditorHintDeclarationReference" flags="ig" index="2aJ2om">
        <reference id="5944657839026714445" name="hint" index="2$4xQ3" />
      </concept>
      <concept id="1198489924438" name="jetbrains.mps.lang.editor.structure.CellModel_Block" flags="sg" stub="8104358048506730066" index="b$f91">
        <child id="1198489985045" name="header" index="b$u42" />
        <child id="1198489993734" name="body" index="b$wch" />
      </concept>
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <property id="1140524450557" name="separatorText" index="2czwfO" />
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
        <child id="1140524464359" name="emptyCellModel" index="2czzBI" />
      </concept>
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1106270637846" name="jetbrains.mps.lang.editor.structure.CellLayout_Flow" flags="nn" index="2iR$Sn" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1237307900041" name="jetbrains.mps.lang.editor.structure.IndentLayoutIndentStyleClassItem" flags="ln" index="lj46D" />
      <concept id="1237308012275" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineStyleClassItem" flags="ln" index="ljvvj" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1237385578942" name="jetbrains.mps.lang.editor.structure.IndentLayoutOnNewLineStyleClassItem" flags="ln" index="pVoyu" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1078938745671" name="jetbrains.mps.lang.editor.structure.EditorComponentDeclaration" flags="ig" index="PKFIW" />
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414860679" name="jetbrains.mps.lang.editor.structure.EditableStyleClassItem" flags="ln" index="VPxyj" />
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ng" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1236262245656" name="jetbrains.mps.lang.editor.structure.MatchingLabelStyleClassItem" flags="ln" index="3mYdg7">
        <property id="1238091709220" name="labelName" index="1413C4" />
      </concept>
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
        <reference id="1139959269582" name="actionMap" index="1ERwB7" />
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
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
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
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
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
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="4PUAo64h_fU">
    <ref role="1XX52x" to="sxb1:1x4fgD956cc" resolve="Task" />
    <node concept="3EZMnI" id="4PUAo64hMy5" role="2wV5jI">
      <node concept="2iRkQZ" id="4PUAo64hNc1" role="2iSdaV" />
      <node concept="3EZMnI" id="4PUAo64jhgS" role="3EZMnx">
        <node concept="VPM3Z" id="4PUAo64jhgU" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="4PUAo64jhgZ" role="3EZMnx">
          <property role="3F0ifm" value="Basic Task" />
        </node>
        <node concept="3F0A7n" id="4PUAo64jhhb" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="JBnlGGCoI_" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="3SI56rdKHb0" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGCoIX" role="3EZMnx">
        <node concept="3XFhqQ" id="JBnlGGCoJd" role="3EZMnx" />
        <node concept="l2Vlx" id="JBnlGGCoIY" role="2iSdaV" />
        <node concept="PMmxH" id="4PUAo64jhhv" role="3EZMnx">
          <ref role="PMmxG" node="4PUAo64jhdw" resolve="TaskPart" />
        </node>
      </node>
      <node concept="3F0ifn" id="3SI56rdKAdp" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
    </node>
    <node concept="3F0A7n" id="1Y5JHpRziel" role="6VMZX">
      <ref role="1NtTu8" to="mj1l:1UQ4qqfV3yK" resolve="value" />
    </node>
  </node>
  <node concept="24kQdi" id="4PUAo64jfj6">
    <ref role="1XX52x" to="sxb1:1x4fgD956tm" resolve="TaskRef" />
    <node concept="3EZMnI" id="4PUAo64jfj8" role="2wV5jI">
      <node concept="l2Vlx" id="2q8YB8RhSi9" role="2iSdaV" />
      <node concept="3EZMnI" id="1eGaHOMv6QB" role="3EZMnx">
        <node concept="3F0ifn" id="1eGaHOMv6QT" role="3EZMnx">
          <property role="3F0ifm" value="(" />
        </node>
        <node concept="VPM3Z" id="1eGaHOMv6QD" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="1eGaHOMv6QF" role="3EZMnx">
          <property role="3F0ifm" value="B" />
          <node concept="pkWqt" id="1eGaHOMv6RD" role="pqm2j">
            <node concept="3clFbS" id="1eGaHOMv6RE" role="2VODD2">
              <node concept="3cpWs8" id="1eGaHOMv9JT" role="3cqZAp">
                <node concept="3cpWsn" id="1eGaHOMv9JW" role="3cpWs9">
                  <property role="TrG5h" value="result" />
                  <node concept="10P_77" id="1eGaHOMv9JR" role="1tU5fm" />
                  <node concept="3clFbT" id="1eGaHOMv9UK" role="33vP2m" />
                </node>
              </node>
              <node concept="1_3QMa" id="1eGaHOMv6SI" role="3cqZAp">
                <node concept="2OqwBi" id="1eGaHOMv7aX" role="1_3QMn">
                  <node concept="2OqwBi" id="1eGaHOMv6VA" role="2Oq$k0">
                    <node concept="pncrf" id="1eGaHOMv6TN" role="2Oq$k0" />
                    <node concept="3TrEf2" id="1eGaHOMv72e" role="2OqNvi">
                      <ref role="3Tt5mk" to="sxb1:1x4fgD956tn" />
                    </node>
                  </node>
                  <node concept="2yIwOk" id="1eGaHOMv7A4" role="2OqNvi" />
                </node>
                <node concept="1pnPoh" id="1eGaHOMv7C6" role="1_3QMm">
                  <node concept="3gn64h" id="1eGaHOMv7Eb" role="1pnPq6">
                    <ref role="3gnhBz" to="sxb1:4F1Ib7ChyL$" resolve="ExtendedTask" />
                  </node>
                  <node concept="3clFbS" id="1eGaHOMv7C8" role="1pnPq1">
                    <node concept="3clFbF" id="1eGaHOMv9Yf" role="3cqZAp">
                      <node concept="37vLTI" id="1eGaHOMva2h" role="3clFbG">
                        <node concept="3clFbT" id="1eGaHOMvabT" role="37vLTx">
                          <property role="3clFbU" value="true" />
                        </node>
                        <node concept="37vLTw" id="1eGaHOMv9Yd" role="37vLTJ">
                          <ref role="3cqZAo" node="1eGaHOMv9JW" resolve="result" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbS" id="1eGaHOMv7Jp" role="1prKM_" />
              </node>
              <node concept="3cpWs6" id="1eGaHOMvauQ" role="3cqZAp">
                <node concept="3fqX7Q" id="1eGaHOMvay7" role="3cqZAk">
                  <node concept="37vLTw" id="1eGaHOMva$s" role="3fr31v">
                    <ref role="3cqZAo" node="1eGaHOMv9JW" resolve="result" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3F0ifn" id="1eGaHOMv6R3" role="3EZMnx">
          <property role="3F0ifm" value="E" />
          <node concept="pkWqt" id="1eGaHOMvaAJ" role="pqm2j">
            <node concept="3clFbS" id="1eGaHOMvaAK" role="2VODD2">
              <node concept="3cpWs8" id="1eGaHOMvaAL" role="3cqZAp">
                <node concept="3cpWsn" id="1eGaHOMvaAM" role="3cpWs9">
                  <property role="TrG5h" value="result" />
                  <node concept="10P_77" id="1eGaHOMvaAN" role="1tU5fm" />
                  <node concept="3clFbT" id="1eGaHOMvaAO" role="33vP2m" />
                </node>
              </node>
              <node concept="1_3QMa" id="1eGaHOMvaAP" role="3cqZAp">
                <node concept="2OqwBi" id="1eGaHOMvaAQ" role="1_3QMn">
                  <node concept="2OqwBi" id="1eGaHOMvaAR" role="2Oq$k0">
                    <node concept="pncrf" id="1eGaHOMvaAS" role="2Oq$k0" />
                    <node concept="3TrEf2" id="1eGaHOMvaAT" role="2OqNvi">
                      <ref role="3Tt5mk" to="sxb1:1x4fgD956tn" />
                    </node>
                  </node>
                  <node concept="2yIwOk" id="1eGaHOMvaAU" role="2OqNvi" />
                </node>
                <node concept="1pnPoh" id="1eGaHOMvaAV" role="1_3QMm">
                  <node concept="3gn64h" id="1eGaHOMvaAW" role="1pnPq6">
                    <ref role="3gnhBz" to="sxb1:4F1Ib7ChyL$" resolve="ExtendedTask" />
                  </node>
                  <node concept="3clFbS" id="1eGaHOMvaAX" role="1pnPq1">
                    <node concept="3clFbF" id="1eGaHOMvaAY" role="3cqZAp">
                      <node concept="37vLTI" id="1eGaHOMvaAZ" role="3clFbG">
                        <node concept="3clFbT" id="1eGaHOMvaB0" role="37vLTx">
                          <property role="3clFbU" value="true" />
                        </node>
                        <node concept="37vLTw" id="1eGaHOMvaB1" role="37vLTJ">
                          <ref role="3cqZAo" node="1eGaHOMvaAM" resolve="result" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbS" id="1eGaHOMvaB2" role="1prKM_" />
              </node>
              <node concept="3cpWs6" id="1eGaHOMvaB7" role="3cqZAp">
                <node concept="37vLTw" id="1eGaHOMvaB9" role="3cqZAk">
                  <ref role="3cqZAo" node="1eGaHOMvaAM" resolve="result" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3F0ifn" id="1eGaHOMv6Rf" role="3EZMnx">
          <property role="3F0ifm" value="T" />
        </node>
        <node concept="3F0ifn" id="1eGaHOMv6Rt" role="3EZMnx">
          <property role="3F0ifm" value=")" />
        </node>
        <node concept="2iR$Sn" id="1eGaHOMv6R_" role="2iSdaV" />
      </node>
      <node concept="1iCGBv" id="4PUAo64jfjl" role="3EZMnx">
        <ref role="1NtTu8" to="sxb1:1x4fgD956tn" />
        <node concept="1sVBvm" id="4PUAo64jfjn" role="1sWHZn">
          <node concept="3F0A7n" id="4PUAo64jfjv" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="PKFIW" id="4PUAo64jhdw">
    <property role="TrG5h" value="TaskPart" />
    <ref role="1XX52x" to="sxb1:1x4fgD956cc" resolve="Task" />
    <node concept="3EZMnI" id="4PUAo64jhdO" role="2wV5jI">
      <node concept="3EZMnI" id="4PUAo64jhdV" role="3EZMnx">
        <node concept="VPM3Z" id="4PUAo64jhdX" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="4PUAo64jhe6" role="3EZMnx">
          <property role="3F0ifm" value="with priority" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6gbI" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:78S7ngm5xPF" />
        </node>
        <node concept="l2Vlx" id="3SI56rdKEMO" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="4B0n6H27tWn" role="3EZMnx">
        <node concept="VPM3Z" id="4B0n6H27tWp" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="4B0n6H27tWr" role="3EZMnx">
          <property role="3F0ifm" value="schedules" />
        </node>
        <node concept="3F0A7n" id="4B0n6H27tX5" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:3QwuWjHllkV" resolve="schedule" />
        </node>
        <node concept="l2Vlx" id="4B0n6H27tWs" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="4PUAo64jheE" role="3EZMnx">
        <node concept="VPM3Z" id="4PUAo64jheG" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="4PUAo64jheV" role="3EZMnx">
          <property role="3F0ifm" value="allows" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6gbS" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:78S7ngm5xPJ" />
        </node>
        <node concept="3F0ifn" id="4PUAo64jhfh" role="3EZMnx">
          <property role="3F0ifm" value="activations" />
        </node>
        <node concept="l2Vlx" id="3SI56rdKEMT" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="3SI56rdJcHi" role="3EZMnx">
        <node concept="VPM3Z" id="3SI56rdJcHk" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="3SI56rdJcHm" role="3EZMnx">
          <property role="3F0ifm" value="uses Messages" />
        </node>
        <node concept="3F2HdR" id="3SI56rdJcHU" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:4F1Ib7ChyLh" />
          <node concept="3F0ifn" id="3SI56rdJcI3" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
          <node concept="l2Vlx" id="3SI56rdKEMZ" role="2czzBx" />
        </node>
        <node concept="l2Vlx" id="3SI56rdKEN0" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="62xxBiE6gcF" role="3EZMnx">
        <node concept="VPM3Z" id="62xxBiE6gcH" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="62xxBiE6gcJ" role="3EZMnx">
          <property role="3F0ifm" value="uses Resources" />
        </node>
        <node concept="3F2HdR" id="62xxBiE6gdm" role="3EZMnx">
          <property role="2czwfO" value="," />
          <ref role="1NtTu8" to="sxb1:4F1Ib7ChyLB" />
          <node concept="l2Vlx" id="62xxBiE6gdo" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE6gfY" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="62xxBiE6gcK" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="3SI56rdJcIp" role="3EZMnx">
        <node concept="VPM3Z" id="3SI56rdJcIr" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="62xxBiE6gbY" role="3EZMnx">
          <property role="3F0ifm" value="allowed in App Modes" />
        </node>
        <node concept="l2Vlx" id="3SI56rdKEN9" role="2iSdaV" />
        <node concept="3F2HdR" id="62xxBiE6gc8" role="3EZMnx">
          <property role="2czwfO" value="," />
          <ref role="1NtTu8" to="sxb1:62xxBiE6fOz" />
          <node concept="l2Vlx" id="62xxBiE6gca" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE6gce" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
      </node>
      <node concept="2iRkQZ" id="4PUAo64jhdR" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="4PUAo64jhi9">
    <ref role="1XX52x" to="sxb1:4F1Ib7ChyL$" resolve="ExtendedTask" />
    <node concept="3EZMnI" id="4PUAo64jhib" role="2wV5jI">
      <node concept="2iRkQZ" id="4PUAo64jhie" role="2iSdaV" />
      <node concept="3EZMnI" id="4PUAo64jhip" role="3EZMnx">
        <node concept="VPM3Z" id="4PUAo64jhir" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="4PUAo64jhiz" role="3EZMnx">
          <property role="3F0ifm" value="Extended Task" />
        </node>
        <node concept="3F0A7n" id="4PUAo64jhiK" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="3F0ifn" id="JBnlGGCp9M" role="3EZMnx">
          <property role="3F0ifm" value="{" />
          <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
        </node>
        <node concept="l2Vlx" id="3SI56rdKHaC" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGCp9S" role="3EZMnx">
        <node concept="3XFhqQ" id="JBnlGGCpam" role="3EZMnx" />
        <node concept="l2Vlx" id="JBnlGGCp9T" role="2iSdaV" />
        <node concept="PMmxH" id="4PUAo64jhj4" role="3EZMnx">
          <ref role="PMmxG" node="4PUAo64jhdw" resolve="TaskPart" />
        </node>
      </node>
      <node concept="3EZMnI" id="4PUAo64jhjz" role="3EZMnx">
        <node concept="VPM3Z" id="4PUAo64jhj_" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGCpax" role="3EZMnx" />
        <node concept="3F0ifn" id="4PUAo64jhjB" role="3EZMnx">
          <property role="3F0ifm" value="uses Events" />
        </node>
        <node concept="3F2HdR" id="4PUAo64jhjS" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:4F1Ib7ChyL_" />
          <node concept="3F0ifn" id="3SI56rdKCux" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
          <node concept="l2Vlx" id="3SI56rdKHaH" role="2czzBx" />
        </node>
        <node concept="l2Vlx" id="3SI56rdKHaI" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="3SI56rdKAcT" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="3tDp_yW5YMd">
    <ref role="1XX52x" to="sxb1:1x4fgD956cc" resolve="Task" />
    <node concept="PMmxH" id="3tDp_yW5YMk" role="2wV5jI">
      <ref role="PMmxG" node="23s$hiVSTNT" resolve="OilTaskEditor" />
    </node>
    <node concept="2aJ2om" id="3tDp_yW5YMh" role="CpUAK">
      <ref role="2$4xQ3" to="4if3:3MPhGBwyb2B" resolve="Oil" />
    </node>
  </node>
  <node concept="PKFIW" id="23s$hiVSTNT">
    <property role="TrG5h" value="OilTaskEditor" />
    <ref role="1XX52x" to="sxb1:1x4fgD956cc" resolve="Task" />
    <node concept="b$f91" id="23s$hiVSTOk" role="2wV5jI">
      <node concept="3EZMnI" id="23s$hiVSTPM" role="b$wch">
        <node concept="l2Vlx" id="23s$hiVSTPP" role="2iSdaV" />
        <node concept="3F0ifn" id="23s$hiVSTQ9" role="3EZMnx">
          <property role="3F0ifm" value="PRIORITY   =" />
        </node>
        <node concept="3F1sOY" id="23s$hiVSTQh" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:78S7ngm5xPF" />
        </node>
        <node concept="3F0ifn" id="23s$hiVSTR2" role="3EZMnx">
          <property role="3F0ifm" value=";" />
          <node concept="ljvvj" id="23s$hiVSTR7" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="23s$hiVSTRg" role="3EZMnx">
          <property role="3F0ifm" value="SCHEDULE   =" />
        </node>
        <node concept="3F0A7n" id="23s$hiVSTRG" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:3QwuWjHllkV" resolve="schedule" />
        </node>
        <node concept="3F0ifn" id="23s$hiVSTRW" role="3EZMnx">
          <property role="3F0ifm" value=";" />
        </node>
        <node concept="3F0ifn" id="23s$hiVSTSh" role="3EZMnx">
          <property role="3F0ifm" value="ACTIVATION =" />
          <node concept="pVoyu" id="23s$hiVSTSr" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F1sOY" id="23s$hiVSTSQ" role="3EZMnx">
          <ref role="1NtTu8" to="sxb1:78S7ngm5xPJ" />
        </node>
        <node concept="3F0ifn" id="23s$hiVSV7m" role="3EZMnx">
          <property role="3F0ifm" value=";" />
        </node>
      </node>
      <node concept="3EZMnI" id="23s$hiVSTPu" role="b$u42">
        <node concept="l2Vlx" id="23s$hiVSTPv" role="2iSdaV" />
        <node concept="3F0ifn" id="23s$hiVSTPy" role="3EZMnx">
          <property role="3F0ifm" value="TASK" />
          <ref role="1k5W1q" to="tpen:hgVS8CF" resolve="KeyWord" />
        </node>
        <node concept="3F0A7n" id="23s$hiVSTPF" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2ZNMQTB12lY">
    <ref role="1XX52x" to="sxb1:2ZNMQTB12lN" resolve="TaskMacro" />
    <node concept="3EZMnI" id="5uygRN5j_kz" role="2wV5jI">
      <node concept="l2Vlx" id="5uygRN5j_k$" role="2iSdaV" />
      <node concept="3F0ifn" id="5uygRN5jB1O" role="3EZMnx">
        <property role="3F0ifm" value="TASK" />
      </node>
      <node concept="3F0ifn" id="5uygRN5jMpm" role="3EZMnx">
        <property role="3F0ifm" value="(" />
        <ref role="1k5W1q" to="tpen:hXb$RYA" resolve="LeftBracket" />
        <node concept="3mYdg7" id="5uygRN5jSlp" role="3F10Kt">
          <property role="1413C4" value="name" />
        </node>
      </node>
      <node concept="1iCGBv" id="5g5RAGpWpxO" role="3EZMnx">
        <ref role="1NtTu8" to="sxb1:2ZNMQTB12lR" />
        <node concept="1sVBvm" id="5g5RAGpWpxQ" role="1sWHZn">
          <node concept="3F0A7n" id="5g5RAGpWpyb" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="5uygRN5jLyI" role="3EZMnx">
        <property role="3F0ifm" value=")" />
        <ref role="1k5W1q" to="tpen:hXb$V4T" resolve="RightBracket" />
        <node concept="3mYdg7" id="5uygRN5jSn7" role="3F10Kt">
          <property role="1413C4" value="name" />
        </node>
      </node>
      <node concept="3F1sOY" id="5uygRN5j_mx" role="3EZMnx">
        <ref role="1NtTu8" to="x27k:3CmSUB7Fp_k" />
        <ref role="1ERwB7" to="cl6c:3b1kLoLNYfJ" resolve="deleteFunction" />
        <node concept="ljvvj" id="5uygRN5jCyt" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="lj46D" id="5uygRN5jCyx" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
      </node>
      <node concept="3F0ifn" id="5uygRN5jISa" role="3EZMnx">
        <property role="3F0ifm" value="" />
        <node concept="ljvvj" id="5uygRN5jJ$1" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="VPxyj" id="5g5RAGpXexA" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="VPM3Z" id="5g5RAGpXezp" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
      </node>
    </node>
    <node concept="3EZMnI" id="7saPwHYH99k" role="6VMZX">
      <node concept="2iRkQZ" id="7saPwHYH99l" role="2iSdaV" />
      <node concept="3F1sOY" id="5g5RAGpW$yl" role="3EZMnx">
        <ref role="1NtTu8" to="mj1l:hEaDaGor64" />
      </node>
      <node concept="3F0ifn" id="7saPwHYH99q" role="3EZMnx">
        <node concept="ljvvj" id="7saPwHYHi_8" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="pVoyu" id="7saPwHYHi_9" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
        <node concept="VPxyj" id="7saPwHYHi_a" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="VPM3Z" id="7saPwHYHi_b" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
      </node>
      <node concept="1iCGBv" id="7saPwHYIaRT" role="3EZMnx">
        <ref role="1NtTu8" to="sxb1:2ZNMQTB12lR" />
        <node concept="1sVBvm" id="7saPwHYIaRV" role="1sWHZn">
          <node concept="PMmxH" id="7saPwHYIaS8" role="2wV5jI">
            <ref role="PMmxG" node="4PUAo64jhdw" resolve="TaskPart" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="4NwoSLUgvym">
    <ref role="1XX52x" to="sxb1:4NwoSLUgvyg" resolve="TerminateTaskStatement" />
    <node concept="3EZMnI" id="1Y5JHpRzaAM" role="2wV5jI">
      <node concept="l2Vlx" id="1Y5JHpRzaAN" role="2iSdaV" />
      <node concept="3F0ifn" id="4NwoSLUgvyo" role="3EZMnx">
        <property role="3F0ifm" value="terminate" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgHKA" resolve="KW" />
      </node>
      <node concept="3F0ifn" id="1Y5JHpRzaAV" role="3EZMnx">
        <property role="3F0ifm" value=";" />
        <ref role="1k5W1q" to="r4b4:2CEi94dhkRt" resolve="Semi" />
      </node>
    </node>
    <node concept="3EZMnI" id="7LOsK3rQkUC" role="6VMZX">
      <node concept="l2Vlx" id="7LOsK3rQkUD" role="2iSdaV" />
      <node concept="3F0ifn" id="7LOsK3rQkUE" role="3EZMnx">
        <property role="3F0ifm" value="return" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgHKA" resolve="KW" />
      </node>
      <node concept="3F1sOY" id="7LOsK3rQkUF" role="3EZMnx">
        <ref role="1NtTu8" to="x27k:7LOsK3rQkUA" />
      </node>
      <node concept="3F0ifn" id="7LOsK3rQkUN" role="3EZMnx">
        <property role="3F0ifm" value=";" />
        <ref role="1k5W1q" to="r4b4:2CEi94dhkRt" resolve="Semi" />
        <ref role="1ERwB7" to="j4gk:7apEgWbJM1a" resolve="deleteStatement" />
      </node>
    </node>
  </node>
</model>

