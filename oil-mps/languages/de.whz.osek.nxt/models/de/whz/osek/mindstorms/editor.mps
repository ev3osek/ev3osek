<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:1c87ad17-0db5-40a4-945d-99577a3e6003(de.whz.osek.mindstorms.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="3" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="53a2e8ff-4795-41ec-949d-d5c6bc4895de" name="com.mbeddr.mpsutil.breadcrumb.editor" version="0" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="4if3" ref="r:14f33158-518b-490e-a475-66b7b7b8c6de(de.whz.osek.editor)" />
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="u1z9" ref="r:bd641933-ad1e-436e-ae92-247a9a3b4aa2(oil.core.structure)" />
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="tpcu" ref="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" />
    <import index="tpen" ref="r:00000000-0000-4000-0000-011c895902c3(jetbrains.mps.baseLanguage.editor)" />
    <import index="scpz" ref="r:dcec6791-9de2-4c75-82ab-f19ead96211d(oil.structure)" />
    <import index="unno" ref="r:61e3d524-8c49-4491-b5e3-f6d6e9364527(jetbrains.mps.util)" />
    <import index="f1b2" ref="r:d71c8116-04a3-4636-a4a4-ecaa1d59d2d4(de.whz.osek.mindstorms.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1402906326895675325" name="jetbrains.mps.lang.editor.structure.CellActionMap_FunctionParm_selectedNode" flags="nn" index="0IXxy" />
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
        <child id="2597348684684069742" name="contextHints" index="CpUAK" />
      </concept>
      <concept id="1176897764478" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeFactory" flags="in" index="4$FPG" />
      <concept id="6822301196700715228" name="jetbrains.mps.lang.editor.structure.ConceptEditorHintDeclarationReference" flags="ig" index="2aJ2om">
        <reference id="5944657839026714445" name="hint" index="2$4xQ3" />
      </concept>
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1176897874615" name="nodeFactory" index="4_6I_" />
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
        <child id="1140524464359" name="emptyCellModel" index="2czzBI" />
      </concept>
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1237308012275" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineStyleClassItem" flags="ln" index="ljvvj" />
      <concept id="1237375020029" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineChildrenStyleClassItem" flags="ln" index="pj6Ft" />
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
      <concept id="1139535219966" name="jetbrains.mps.lang.editor.structure.CellActionMapDeclaration" flags="ig" index="1h_SRR">
        <reference id="1139535219968" name="applicableConcept" index="1h_SK9" />
        <child id="1139535219969" name="item" index="1h_SK8" />
      </concept>
      <concept id="1139535280617" name="jetbrains.mps.lang.editor.structure.CellActionMapItem" flags="lg" index="1hA7zw">
        <property id="1139535298778" name="actionId" index="1hAc7j" />
        <child id="1139535280620" name="executeFunction" index="1hA7z_" />
      </concept>
      <concept id="1139535439104" name="jetbrains.mps.lang.editor.structure.CellActionMap_ExecuteFunction" flags="in" index="1hAIg9" />
      <concept id="1381004262292414836" name="jetbrains.mps.lang.editor.structure.ICellStyle" flags="ng" index="1k5N5V">
        <reference id="1381004262292426837" name="parentStyleClass" index="1k5W1q" />
      </concept>
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
        <reference id="1139959269582" name="actionMap" index="1ERwB7" />
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
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ng" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR">
        <reference id="1173177718857" name="elementActionMap" index="APP_o" />
      </concept>
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
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
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
      <concept id="1138661924179" name="jetbrains.mps.lang.smodel.structure.Property_SetOperation" flags="nn" index="tyxLq">
        <child id="1138662048170" name="value" index="tz02z" />
      </concept>
      <concept id="1138757581985" name="jetbrains.mps.lang.smodel.structure.Link_SetNewChildOperation" flags="nn" index="zfrQC" />
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
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
  <node concept="24kQdi" id="1BGVUyeSJki">
    <ref role="1XX52x" to="f1b2:1BGVUyeSGhp" resolve="NxtOsekApplication" />
    <node concept="PMmxH" id="1BGVUyeSQ99" role="2wV5jI">
      <ref role="PMmxG" node="1BGVUyeSKqm" resolve="NxtOsekApplicationImplementation" />
    </node>
    <node concept="2aJ2om" id="1BGVUyeSJkm" role="CpUAK">
      <ref role="2$4xQ3" to="4if3:3MPhGBwylQJ" resolve="Implementation" />
    </node>
    <node concept="3F1sOY" id="1BGVUyeSQ9d" role="6VMZX">
      <ref role="1NtTu8" to="bwbq:5uygRN5jnry" />
    </node>
  </node>
  <node concept="PKFIW" id="1BGVUyeSKqm">
    <property role="TrG5h" value="NxtOsekApplicationImplementation" />
    <ref role="1XX52x" to="f1b2:1BGVUyeSGhp" resolve="NxtOsekApplication" />
    <node concept="3EZMnI" id="5uygRN5jnrB" role="2wV5jI">
      <node concept="1gkWj3" id="3pj_nYrpEJc" role="3EZMnx">
        <property role="1gkWj2" value="true" />
        <node concept="3EZMnI" id="5_l8w1EmTdD" role="1gkWjp">
          <property role="S$Qs1" value="true" />
          <node concept="PMmxH" id="3tDp_yW5tR7" role="3EZMnx">
            <ref role="PMmxG" to="4if3:3tDp_yW5oQx" resolve="OsekApplicationImplementationHeader" />
          </node>
          <node concept="3F0ifn" id="3tDp_yW5C9F" role="3EZMnx">
            <property role="3F0ifm" value="" />
            <node concept="VPxyj" id="3tDp_yW5C9G" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="VPM3Z" id="3tDp_yW5C9H" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="pVoyu" id="3tDp_yW5C9I" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
          </node>
          <node concept="3F0ifn" id="3tDp_yW5_T7" role="3EZMnx">
            <property role="3F0ifm" value="/* Lejos OSEK Hooks */" />
            <ref role="1k5W1q" to="r4b4:2CEi94dhncU" resolve="CodeComment" />
            <node concept="ljvvj" id="3tDp_yW5_Zv" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
          </node>
          <node concept="3F1sOY" id="1BGVUyeSpCg" role="3EZMnx">
            <ref role="1NtTu8" to="f1b2:1BGVUyeRuR3" />
            <ref role="1ERwB7" node="3tDp_yW4IsW" resolve="nameInit" />
            <node concept="pj6Ft" id="1BGVUyeSuIE" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
            <node concept="ljvvj" id="1BGVUyeSuIF" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
            <node concept="pVoyu" id="1BGVUyeSuIG" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
          </node>
          <node concept="3F0ifn" id="1BGVUyeSsy$" role="3EZMnx">
            <property role="3F0ifm" value="" />
            <node concept="VPxyj" id="1BGVUyeSsy_" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="VPM3Z" id="1BGVUyeSsyA" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="pVoyu" id="1BGVUyeSsyB" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
          </node>
          <node concept="3F1sOY" id="1BGVUyeSqPJ" role="3EZMnx">
            <ref role="1NtTu8" to="f1b2:1BGVUyeRuR9" />
            <ref role="1ERwB7" node="3tDp_yW4Nh9" resolve="nameTerminate" />
            <node concept="pj6Ft" id="1BGVUyeSuIN" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
            <node concept="ljvvj" id="1BGVUyeSuIO" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
            <node concept="pVoyu" id="1BGVUyeSuIP" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
          </node>
          <node concept="3F0ifn" id="1BGVUyeSrNR" role="3EZMnx">
            <property role="3F0ifm" value="" />
            <node concept="VPxyj" id="1BGVUyeSrNS" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="VPM3Z" id="1BGVUyeSrNT" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="pVoyu" id="1BGVUyeSrNU" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
          </node>
          <node concept="3F2HdR" id="5_l8w1EmTdN" role="3EZMnx">
            <ref role="1NtTu8" to="x27k:5_l8w1EmTdh" />
            <ref role="APP_o" to="r4b4:$hL4249ROO" resolve="deleteEmptyStuffInCollection" />
            <node concept="pj6Ft" id="7apEgWbIFgt" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
            <node concept="2iRkQZ" id="1Fd_UL3AQRY" role="2czzBx" />
            <node concept="ljvvj" id="7apEgWbIFgv" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
            <node concept="pVoyu" id="7apEgWbIHBM" role="3F10Kt">
              <property role="VOm3f" value="true" />
            </node>
            <node concept="4$FPG" id="7JWieF82LsV" role="4_6I_">
              <node concept="3clFbS" id="7JWieF82LsW" role="2VODD2">
                <node concept="3clFbF" id="7JWieF82LsX" role="3cqZAp">
                  <node concept="2ShNRf" id="7JWieF82LsY" role="3clFbG">
                    <node concept="3zrR0B" id="7JWieF82Lt0" role="2ShVmc">
                      <node concept="3Tqbb2" id="7JWieF82Lt1" role="3zrR0E">
                        <ref role="ehGHo" to="x27k:7JWieF82Lsz" resolve="EmptyModuleContent" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3F0ifn" id="4usdeMNVnYj" role="2czzBI">
              <property role="3F0ifm" value="&lt;&lt; no further functions &gt;&gt;" />
              <ref role="1k5W1q" to="tpen:hinfsDb" resolve="EmptyCell" />
              <node concept="VPxyj" id="4usdeMNVnYk" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
          </node>
          <node concept="l2Vlx" id="7apEgWbIFgx" role="2iSdaV" />
          <node concept="3F0ifn" id="1TS1BLOPryc" role="AHCbl">
            <property role="3F0ifm" value="..." />
          </node>
          <node concept="pkWqt" id="5meTu9orXgL" role="2xiA_6">
            <node concept="3clFbS" id="5meTu9orXgM" role="2VODD2">
              <node concept="3clFbF" id="5meTu9orXgN" role="3cqZAp">
                <node concept="2OqwBi" id="5meTu9orXh9" role="3clFbG">
                  <node concept="pncrf" id="5meTu9orXgO" role="2Oq$k0" />
                  <node concept="2qgKlT" id="5meTu9orXhf" role="2OqNvi">
                    <ref role="37wK5l" to="tpcu:hEwIMij" resolve="isInTemplates" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="1BGVUyeSN8o" role="3EZMnx">
        <property role="3F0ifm" value="" />
        <node concept="VPxyj" id="1BGVUyeSN8p" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="VPM3Z" id="1BGVUyeSN8q" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="pVoyu" id="1BGVUyeSN8r" role="3F10Kt">
          <property role="VOm3f" value="true" />
        </node>
      </node>
      <node concept="PMmxH" id="3tDp_yW5uhh" role="3EZMnx">
        <ref role="PMmxG" to="4if3:3tDp_yW5qAl" resolve="OsekApplicationImplementationTasks" />
      </node>
      <node concept="l2Vlx" id="5uygRN5jnrE" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="1BGVUyeSQaK">
    <ref role="1XX52x" to="f1b2:1BGVUyeSGhp" resolve="NxtOsekApplication" />
    <node concept="3F1sOY" id="1BGVUyeSQqc" role="2wV5jI">
      <ref role="1NtTu8" to="bwbq:5uygRN5jnry" />
    </node>
    <node concept="2aJ2om" id="1BGVUyeSQaO" role="CpUAK">
      <ref role="2$4xQ3" to="4if3:3MPhGBwyb2B" resolve="Oil" />
    </node>
    <node concept="PMmxH" id="1BGVUyeSQqf" role="6VMZX">
      <ref role="PMmxG" node="1BGVUyeSKqm" resolve="NxtOsekApplicationImplementation" />
    </node>
  </node>
  <node concept="1h_SRR" id="3tDp_yW4IsW">
    <property role="TrG5h" value="nameInit" />
    <ref role="1h_SK9" to="f1b2:1BGVUyeSGhp" resolve="NxtOsekApplication" />
    <node concept="1hA7zw" id="3tDp_yW4IsX" role="1h_SK8">
      <property role="1hAc7j" value="insert_action_id" />
      <node concept="1hAIg9" id="3tDp_yW4IsY" role="1hA7z_">
        <node concept="3clFbS" id="3tDp_yW4IsZ" role="2VODD2">
          <node concept="3clFbF" id="3tDp_yW5bNY" role="3cqZAp">
            <node concept="2OqwBi" id="3tDp_yW5dF4" role="3clFbG">
              <node concept="2OqwBi" id="3tDp_yW5bYk" role="2Oq$k0">
                <node concept="0IXxy" id="3tDp_yW5bNW" role="2Oq$k0" />
                <node concept="3TrEf2" id="3tDp_yW5cYi" role="2OqNvi">
                  <ref role="3Tt5mk" to="f1b2:1BGVUyeRuR3" />
                </node>
              </node>
              <node concept="zfrQC" id="3tDp_yW5gsA" role="2OqNvi" />
            </node>
          </node>
          <node concept="3clFbF" id="3tDp_yW4It8" role="3cqZAp">
            <node concept="2OqwBi" id="3tDp_yW4LcQ" role="3clFbG">
              <node concept="2OqwBi" id="3tDp_yW4JKR" role="2Oq$k0">
                <node concept="2OqwBi" id="3tDp_yW4IBc" role="2Oq$k0">
                  <node concept="0IXxy" id="3tDp_yW4It7" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3tDp_yW4J45" role="2OqNvi">
                    <ref role="3Tt5mk" to="f1b2:1BGVUyeRuR3" />
                  </node>
                </node>
                <node concept="3TrcHB" id="3tDp_yW4KrQ" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
              <node concept="tyxLq" id="3tDp_yW4LuX" role="2OqNvi">
                <node concept="Xl_RD" id="3tDp_yW4L_O" role="tz02z">
                  <property role="Xl_RC" value="ecrobot_device_initialize" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1h_SRR" id="3tDp_yW4Nh9">
    <property role="TrG5h" value="nameTerminate" />
    <ref role="1h_SK9" to="f1b2:1BGVUyeSGhp" resolve="NxtOsekApplication" />
    <node concept="1hA7zw" id="3tDp_yW4Nha" role="1h_SK8">
      <property role="1hAc7j" value="insert_action_id" />
      <node concept="1hAIg9" id="3tDp_yW4Nhb" role="1hA7z_">
        <node concept="3clFbS" id="3tDp_yW4Nhc" role="2VODD2">
          <node concept="3clFbF" id="3tDp_yW4T3f" role="3cqZAp">
            <node concept="2OqwBi" id="3tDp_yW4UUl" role="3clFbG">
              <node concept="2OqwBi" id="3tDp_yW4TdA" role="2Oq$k0">
                <node concept="0IXxy" id="3tDp_yW4T3d" role="2Oq$k0" />
                <node concept="3TrEf2" id="3tDp_yW4Udz" role="2OqNvi">
                  <ref role="3Tt5mk" to="f1b2:1BGVUyeRuR9" />
                </node>
              </node>
              <node concept="zfrQC" id="3tDp_yW4Wdq" role="2OqNvi" />
            </node>
          </node>
          <node concept="3clFbF" id="3tDp_yW4Nhl" role="3cqZAp">
            <node concept="37vLTI" id="3tDp_yW4PoX" role="3clFbG">
              <node concept="Xl_RD" id="3tDp_yW4Ppw" role="37vLTx">
                <property role="Xl_RC" value="ecrobot_device_terminate" />
              </node>
              <node concept="2OqwBi" id="3tDp_yW4O_4" role="37vLTJ">
                <node concept="2OqwBi" id="3tDp_yW4Nrp" role="2Oq$k0">
                  <node concept="0IXxy" id="3tDp_yW4Nhk" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3tDp_yW4NSi" role="2OqNvi">
                    <ref role="3Tt5mk" to="f1b2:1BGVUyeRuR9" />
                  </node>
                </node>
                <node concept="3TrcHB" id="3tDp_yW4Pg3" role="2OqNvi">
                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

