<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:fe24d18e-d545-498a-9de8-13963a39c3de(oil.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="53a2e8ff-4795-41ec-949d-d5c6bc4895de" name="com.mbeddr.mpsutil.breadcrumb.editor" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <use id="d4280a54-f6df-4383-aa41-d1b2bffa7eb1" name="com.mbeddr.core.base" version="3" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="tpcu" ref="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" />
    <import index="unno" ref="r:61e3d524-8c49-4491-b5e3-f6d6e9364527(jetbrains.mps.util)" />
    <import index="scpz" ref="r:dcec6791-9de2-4c75-82ab-f19ead96211d(oil.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1078308402140" name="jetbrains.mps.lang.editor.structure.CellModel_Custom" flags="sg" stub="8104358048506730068" index="gc7cB">
        <child id="1176795024817" name="cellProvider" index="3YsKMw" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
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
      <concept id="1186414860679" name="jetbrains.mps.lang.editor.structure.EditableStyleClassItem" flags="ln" index="VPxyj" />
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
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
        <property id="1160590353935" name="usesFolding" index="S$Qs1" />
        <child id="1106270802874" name="cellLayout" index="2iSdaV" />
        <child id="8709572687796959088" name="usesFoldingCondition" index="2xiA_6" />
        <child id="7723470090030138869" name="foldedCellModel" index="AHCbl" />
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
      <concept id="1225898583838" name="jetbrains.mps.lang.editor.structure.ReadOnlyModelAccessor" flags="ng" index="1HfYo3">
        <child id="1225898971709" name="getter" index="1Hhtcw" />
      </concept>
      <concept id="1225900081164" name="jetbrains.mps.lang.editor.structure.CellModel_ReadOnlyModelAccessor" flags="sg" stub="3708815482283559694" index="1HlG4h">
        <child id="1225900141900" name="modelAccessor" index="1HlULh" />
      </concept>
      <concept id="1176717841777" name="jetbrains.mps.lang.editor.structure.QueryFunction_ModelAccess_Getter" flags="in" index="3TQlhw" />
      <concept id="1176749715029" name="jetbrains.mps.lang.editor.structure.QueryFunction_CellProvider" flags="in" index="3VJUX4" />
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
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1163668896201" name="jetbrains.mps.baseLanguage.structure.TernaryOperatorExpression" flags="nn" index="3K4zz7">
        <child id="1163668914799" name="condition" index="3K4Cdx" />
        <child id="1163668922816" name="ifTrue" index="3K4E3e" />
        <child id="1163668934364" name="ifFalse" index="3K4GZi" />
      </concept>
    </language>
    <language id="53a2e8ff-4795-41ec-949d-d5c6bc4895de" name="com.mbeddr.mpsutil.breadcrumb.editor">
      <concept id="4317384196709001934" name="com.mbeddr.mpsutil.breadcrumb.editor.structure.BreadcrumbEditor" flags="ng" index="1gkWj3">
        <property id="4317384196709001935" name="showBreadcrumbIcons" index="1gkWj2" />
        <child id="4317384196709001940" name="content" index="1gkWjp" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1143234257716" name="jetbrains.mps.lang.smodel.structure.Node_GetModelOperation" flags="nn" index="I4A8Y" />
      <concept id="1145404486709" name="jetbrains.mps.lang.smodel.structure.SemanticDowncastExpression" flags="nn" index="2JrnkZ">
        <child id="1145404616321" name="leftExpression" index="2JrQYb" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="zf_u2EOoGR">
    <ref role="1XX52x" to="scpz:1x4fgD93NJv" resolve="OilFileInclude" />
    <node concept="3EZMnI" id="zf_u2EOoGT" role="2wV5jI">
      <node concept="3F0A7n" id="zf_u2EOoH6" role="3EZMnx">
        <ref role="1NtTu8" to="scpz:1x4fgD93NYC" resolve="path" />
      </node>
      <node concept="l2Vlx" id="zf_u2EOoGW" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="2N$8aY8I$VM">
    <ref role="1XX52x" to="scpz:2N$8aY8Ir9B" resolve="OilFileImport" />
    <node concept="3EZMnI" id="DubiFAY4$e" role="2wV5jI">
      <node concept="3EZMnI" id="DubiFBKmqi" role="3EZMnx">
        <node concept="l2Vlx" id="DubiFBKmqj" role="2iSdaV" />
        <node concept="gc7cB" id="DubiFB8AA9" role="3EZMnx">
          <node concept="3VJUX4" id="DubiFB8AAb" role="3YsKMw">
            <node concept="3clFbS" id="DubiFB8AAd" role="2VODD2">
              <node concept="3clFbF" id="DubiFB8AHh" role="3cqZAp">
                <node concept="2ShNRf" id="DubiFB8AHf" role="3clFbG">
                  <node concept="1pGfFk" id="DubiFB8Bnp" role="2ShVmc">
                    <ref role="37wK5l" to="r4b4:DubiFB4e4X" resolve="IconCell" />
                    <node concept="2OqwBi" id="DubiFBKjfp" role="37wK5m">
                      <node concept="pncrf" id="DubiFB8Bpg" role="2Oq$k0" />
                      <node concept="3TrEf2" id="2N$8aY8I_pC" role="2OqNvi">
                        <ref role="3Tt5mk" to="scpz:2N$8aY8I_21" />
                      </node>
                    </node>
                    <node concept="3cmrfG" id="DubiFBVEEr" role="37wK5m">
                      <property role="3cmrfH" value="3" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="VPM3Z" id="2A5UqXKzOz7" role="3F10Kt">
            <property role="VOm3f" value="false" />
          </node>
        </node>
        <node concept="pkWqt" id="DubiFBKmFc" role="pqm2j">
          <node concept="3clFbS" id="DubiFBKmFd" role="2VODD2">
            <node concept="3clFbF" id="DubiFBKmT9" role="3cqZAp">
              <node concept="3y3z36" id="DubiFBKoO8" role="3clFbG">
                <node concept="10Nm6u" id="DubiFBKoUB" role="3uHU7w" />
                <node concept="2OqwBi" id="DubiFBKn3b" role="3uHU7B">
                  <node concept="pncrf" id="DubiFBKmT8" role="2Oq$k0" />
                  <node concept="3TrEf2" id="2N$8aY8I_R0" role="2OqNvi">
                    <ref role="3Tt5mk" to="scpz:2N$8aY8I_21" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="VPM3Z" id="2A5UqXKmD9O" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
      </node>
      <node concept="1iCGBv" id="DubiFAY4$B" role="3EZMnx">
        <ref role="1NtTu8" to="scpz:2N$8aY8I_21" />
        <node concept="1sVBvm" id="DubiFAY4$C" role="1sWHZn">
          <node concept="3F0A7n" id="DubiFB14kK" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="2iRfu4" id="x1qBlZBqR" role="2iSdaV" />
      <node concept="VPM3Z" id="2A5UqXKmDqO" role="3F10Kt">
        <property role="VOm3f" value="true" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2N$8aY8IBsR">
    <ref role="1XX52x" to="scpz:2N$8aY8Ir9w" resolve="OilFileNoModule" />
    <node concept="1gkWj3" id="2N$8aY8IBFd" role="2wV5jI">
      <property role="1gkWj2" value="true" />
      <node concept="3EZMnI" id="2N$8aY8IBFe" role="1gkWjp">
        <property role="S$Qs1" value="true" />
        <node concept="3EZMnI" id="2N$8aY8IBFf" role="3EZMnx">
          <node concept="VPM3Z" id="2N$8aY8IBFg" role="3F10Kt">
            <property role="VOm3f" value="false" />
          </node>
          <node concept="3EZMnI" id="2N$8aY8IBFh" role="3EZMnx">
            <node concept="VPM3Z" id="2N$8aY8IBFi" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="l2Vlx" id="2N$8aY8IBFj" role="2iSdaV" />
            <node concept="PMmxH" id="2N$8aY8IBFk" role="3EZMnx">
              <ref role="PMmxG" to="r4b4:2A5UqXJPGTA" resolve="iconAndNameCell" />
            </node>
            <node concept="3EZMnI" id="2N$8aY8IBFl" role="3EZMnx">
              <node concept="l2Vlx" id="2N$8aY8IBFm" role="2iSdaV" />
              <node concept="3F0ifn" id="2N$8aY8IBFn" role="3EZMnx">
                <property role="3F0ifm" value="model  " />
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="VPM3Z" id="2N$8aY8IBFo" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
              </node>
              <node concept="1HlG4h" id="2N$8aY8IBFp" role="3EZMnx">
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="1HfYo3" id="2N$8aY8IBFq" role="1HlULh">
                  <node concept="3TQlhw" id="2N$8aY8IBFr" role="1Hhtcw">
                    <node concept="3clFbS" id="2N$8aY8IBFs" role="2VODD2">
                      <node concept="3clFbF" id="2N$8aY8IBFt" role="3cqZAp">
                        <node concept="2YIFZM" id="2N$8aY8IBFu" role="3clFbG">
                          <ref role="1Pybhc" to="unno:1NYD3hytmTa" resolve="SNodeOperations" />
                          <ref role="37wK5l" to="unno:7WvVJ3rORmu" resolve="getModelLongName" />
                          <node concept="2JrnkZ" id="2N$8aY8IBFv" role="37wK5m">
                            <node concept="2OqwBi" id="2N$8aY8IBFw" role="2JrQYb">
                              <node concept="pncrf" id="2N$8aY8IBFx" role="2Oq$k0" />
                              <node concept="I4A8Y" id="2N$8aY8IBFy" role="2OqNvi" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="11LMrY" id="2N$8aY8IBFz" role="3F10Kt">
                  <property role="VOm3f" value="true" />
                </node>
                <node concept="VPM3Z" id="2N$8aY8IBF$" role="3F10Kt">
                  <property role="VOm3f" value="true" />
                </node>
              </node>
              <node concept="pVoyu" id="2N$8aY8IBF_" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
            <node concept="3EZMnI" id="2N$8aY8IBFA" role="3EZMnx">
              <node concept="l2Vlx" id="2N$8aY8IBFB" role="2iSdaV" />
              <node concept="3F0ifn" id="2N$8aY8IBFC" role="3EZMnx">
                <property role="3F0ifm" value="package" />
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="VPM3Z" id="2N$8aY8IBFD" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
              </node>
              <node concept="1HlG4h" id="2N$8aY8IBFE" role="3EZMnx">
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="1HfYo3" id="2N$8aY8IBFF" role="1HlULh">
                  <node concept="3TQlhw" id="2N$8aY8IBFG" role="1Hhtcw">
                    <node concept="3clFbS" id="2N$8aY8IBFH" role="2VODD2">
                      <node concept="3clFbF" id="2N$8aY8IBFI" role="3cqZAp">
                        <node concept="3K4zz7" id="2N$8aY8IBFJ" role="3clFbG">
                          <node concept="2OqwBi" id="2N$8aY8IBFK" role="3K4E3e">
                            <node concept="pncrf" id="2N$8aY8IBFL" role="2Oq$k0" />
                            <node concept="3TrcHB" id="2N$8aY8IBFM" role="2OqNvi">
                              <ref role="3TsBF5" to="tpck:hnGE5uv" resolve="virtualPackage" />
                            </node>
                          </node>
                          <node concept="Xl_RD" id="2N$8aY8IBFN" role="3K4GZi">
                            <property role="Xl_RC" value="" />
                          </node>
                          <node concept="3y3z36" id="2N$8aY8IBFO" role="3K4Cdx">
                            <node concept="10Nm6u" id="2N$8aY8IBFP" role="3uHU7w" />
                            <node concept="2OqwBi" id="2N$8aY8IBFQ" role="3uHU7B">
                              <node concept="pncrf" id="2N$8aY8IBFR" role="2Oq$k0" />
                              <node concept="3TrcHB" id="2N$8aY8IBFS" role="2OqNvi">
                                <ref role="3TsBF5" to="tpck:hnGE5uv" resolve="virtualPackage" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="11LMrY" id="2N$8aY8IBFT" role="3F10Kt">
                  <property role="VOm3f" value="true" />
                </node>
              </node>
              <node concept="pVoyu" id="2N$8aY8IBFU" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
              <node concept="pkWqt" id="2N$8aY8IBFV" role="pqm2j">
                <node concept="3clFbS" id="2N$8aY8IBFW" role="2VODD2">
                  <node concept="3clFbF" id="2N$8aY8IBFX" role="3cqZAp">
                    <node concept="3y3z36" id="2N$8aY8IBFY" role="3clFbG">
                      <node concept="10Nm6u" id="2N$8aY8IBFZ" role="3uHU7w" />
                      <node concept="2OqwBi" id="2N$8aY8IBG0" role="3uHU7B">
                        <node concept="pncrf" id="2N$8aY8IBG1" role="2Oq$k0" />
                        <node concept="3TrcHB" id="2N$8aY8IBG2" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:hnGE5uv" resolve="virtualPackage" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3EZMnI" id="2N$8aY8IBG3" role="3EZMnx">
              <node concept="l2Vlx" id="2N$8aY8IBG4" role="2iSdaV" />
              <node concept="3F0ifn" id="2N$8aY8IBG5" role="3EZMnx">
                <property role="3F0ifm" value="oil version:" />
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="VPM3Z" id="2N$8aY8IBG6" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
              </node>
              <node concept="3F0A7n" id="2N$8aY8IBG7" role="3EZMnx">
                <ref role="1NtTu8" to="scpz:2N$8aY8IBsp" resolve="oilVersion" />
              </node>
              <node concept="pVoyu" id="2N$8aY8IBG8" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
          </node>
          <node concept="2iRfu4" id="2N$8aY8IBG9" role="2iSdaV" />
          <node concept="3XFhqQ" id="2N$8aY8IBGa" role="3EZMnx" />
          <node concept="3XFhqQ" id="2N$8aY8IBGb" role="3EZMnx" />
          <node concept="3EZMnI" id="2N$8aY8IBGc" role="3EZMnx">
            <node concept="2iRkQZ" id="2N$8aY8IBGd" role="2iSdaV" />
          </node>
        </node>
        <node concept="gc7cB" id="2N$8aY8IBGH" role="3EZMnx">
          <node concept="3VJUX4" id="2N$8aY8IBGI" role="3YsKMw">
            <node concept="3clFbS" id="2N$8aY8IBGJ" role="2VODD2">
              <node concept="3clFbF" id="2N$8aY8IBGK" role="3cqZAp">
                <node concept="2ShNRf" id="2N$8aY8IBGL" role="3clFbG">
                  <node concept="1pGfFk" id="2N$8aY8IBGM" role="2ShVmc">
                    <ref role="37wK5l" to="r4b4:3Dgh5aYiKso" resolve="HorizLineCell" />
                    <node concept="pncrf" id="2N$8aY8IBGN" role="37wK5m" />
                    <node concept="10M0yZ" id="2N$8aY8IBGO" role="37wK5m">
                      <ref role="3cqZAo" to="r4b4:2CEi94emCnI" resolve="KEYWORD_BLUE" />
                      <ref role="1PxDUh" to="r4b4:4tRpPVPUEa3" resolve="BasicColors" />
                    </node>
                    <node concept="3cmrfG" id="2N$8aY8IBGP" role="37wK5m">
                      <property role="3cmrfH" value="2" />
                    </node>
                    <node concept="3cmrfG" id="2N$8aY8IBGQ" role="37wK5m">
                      <property role="3cmrfH" value="3" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="pVoyu" id="2N$8aY8IBGR" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="2N$8aY8IBGS" role="3EZMnx">
          <property role="3F0ifm" value="" />
          <node concept="VPxyj" id="2N$8aY8IBGT" role="3F10Kt">
            <property role="VOm3f" value="false" />
          </node>
          <node concept="VPM3Z" id="2N$8aY8IBGU" role="3F10Kt">
            <property role="VOm3f" value="false" />
          </node>
          <node concept="pVoyu" id="2N$8aY8IBGV" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3EZMnI" id="2N$8aY8IBGW" role="3EZMnx">
          <node concept="l2Vlx" id="2N$8aY8IBGX" role="2iSdaV" />
          <node concept="3F1sOY" id="2N$8aY8IBGY" role="3EZMnx">
            <ref role="1NtTu8" to="scpz:2N$8aY8IBsr" />
          </node>
          <node concept="pVoyu" id="2N$8aY8IBGZ" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="l2Vlx" id="2N$8aY8IBH0" role="2iSdaV" />
        <node concept="3F0ifn" id="2N$8aY8IBH1" role="AHCbl">
          <property role="3F0ifm" value="..." />
        </node>
        <node concept="pkWqt" id="2N$8aY8IBH2" role="2xiA_6">
          <node concept="3clFbS" id="2N$8aY8IBH3" role="2VODD2">
            <node concept="3clFbF" id="2N$8aY8IBH4" role="3cqZAp">
              <node concept="2OqwBi" id="2N$8aY8IBH5" role="3clFbG">
                <node concept="pncrf" id="2N$8aY8IBH6" role="2Oq$k0" />
                <node concept="2qgKlT" id="2N$8aY8IBH7" role="2OqNvi">
                  <ref role="37wK5l" to="tpcu:hEwIMij" resolve="isInTemplates" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

