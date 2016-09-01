<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:14f33158-518b-490e-a475-66b7b7b8c6de(de.whz.osek.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="3" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="53a2e8ff-4795-41ec-949d-d5c6bc4895de" name="com.mbeddr.mpsutil.breadcrumb.editor" version="0" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
    <import index="qdv7" ref="r:1ff3d952-eae5-4d94-b89e-ea3060b11545(com.mbeddr.cc.var.annotations.structure)" />
    <import index="r4b4" ref="r:1784e088-20fd-4fdb-96b8-bc57f0056d94(com.mbeddr.core.base.editor)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" />
    <import index="cl6c" ref="r:890ea833-37c9-445e-a04d-3b69ce24aa30(com.mbeddr.core.modules.editor)" />
    <import index="j4gk" ref="r:44b6f9b4-bfdb-4b99-b104-960ec485d777(com.mbeddr.core.statements.editor)" />
    <import index="tpen" ref="r:00000000-0000-4000-0000-011c895902c3(jetbrains.mps.baseLanguage.editor)" />
    <import index="tpcu" ref="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" />
    <import index="vs0r" ref="r:f7764ca4-8c75-4049-922b-08516400a727(com.mbeddr.core.base.structure)" />
    <import index="unno" ref="r:61e3d524-8c49-4491-b5e3-f6d6e9364527(jetbrains.mps.util)" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
        <child id="2597348684684069742" name="contextHints" index="CpUAK" />
      </concept>
      <concept id="1176897764478" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeFactory" flags="in" index="4$FPG" />
      <concept id="6822301196700715228" name="jetbrains.mps.lang.editor.structure.ConceptEditorHintDeclarationReference" flags="ig" index="2aJ2om">
        <reference id="5944657839026714445" name="hint" index="2$4xQ3" />
      </concept>
      <concept id="1198489924438" name="jetbrains.mps.lang.editor.structure.CellModel_Block" flags="sg" stub="8104358048506730066" index="b$f91">
        <child id="1198489985045" name="header" index="b$u42" />
        <child id="1198489993734" name="body" index="b$wch" />
      </concept>
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <property id="1140524450557" name="separatorText" index="2czwfO" />
        <property id="1160590307797" name="usesFolding" index="S$F3r" />
        <child id="1176897874615" name="nodeFactory" index="4_6I_" />
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
        <child id="1140524464359" name="emptyCellModel" index="2czzBI" />
        <child id="1233141163694" name="separatorStyle" index="sWeuL" />
        <child id="6046489571270834038" name="foldedCellModel" index="3EmGlc" />
      </concept>
      <concept id="1078308402140" name="jetbrains.mps.lang.editor.structure.CellModel_Custom" flags="sg" stub="8104358048506730068" index="gc7cB">
        <child id="1176795024817" name="cellProvider" index="3YsKMw" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1106270637846" name="jetbrains.mps.lang.editor.structure.CellLayout_Flow" flags="nn" index="2iR$Sn" />
      <concept id="1237303669825" name="jetbrains.mps.lang.editor.structure.CellLayout_Indent" flags="nn" index="l2Vlx" />
      <concept id="1237307900041" name="jetbrains.mps.lang.editor.structure.IndentLayoutIndentStyleClassItem" flags="ln" index="lj46D" />
      <concept id="1237308012275" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineStyleClassItem" flags="ln" index="ljvvj" />
      <concept id="1237375020029" name="jetbrains.mps.lang.editor.structure.IndentLayoutNewLineChildrenStyleClassItem" flags="ln" index="pj6Ft" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1237385578942" name="jetbrains.mps.lang.editor.structure.IndentLayoutOnNewLineStyleClassItem" flags="ln" index="pVoyu" />
      <concept id="1233148810477" name="jetbrains.mps.lang.editor.structure.InlineStyleDeclaration" flags="ng" index="tppnM" />
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
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186403751766" name="jetbrains.mps.lang.editor.structure.FontStyleStyleClassItem" flags="ln" index="Vb9p2" />
      <concept id="1186414536763" name="jetbrains.mps.lang.editor.structure.BooleanStyleSheetItem" flags="ln" index="VOi$J">
        <property id="1186414551515" name="flag" index="VOm3f" />
      </concept>
      <concept id="1186414860679" name="jetbrains.mps.lang.editor.structure.EditableStyleClassItem" flags="ln" index="VPxyj" />
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1186414976055" name="jetbrains.mps.lang.editor.structure.DrawBorderStyleClassItem" flags="ln" index="VPXOz" />
      <concept id="1233758997495" name="jetbrains.mps.lang.editor.structure.PunctuationLeftStyleClassItem" flags="ln" index="11L4FC" />
      <concept id="1233759184865" name="jetbrains.mps.lang.editor.structure.PunctuationRightStyleClassItem" flags="ln" index="11LMrY" />
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
        <property id="1214560368769" name="emptyNoTargetText" index="39s7Ar" />
        <property id="1139852716018" name="noTargetText" index="1$x2rV" />
        <property id="1140017977771" name="readOnly" index="1Intyy" />
        <property id="1140114345053" name="allowEmptyText" index="1O74Pk" />
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
        <property id="1130859485024" name="attractsFocus" index="1cu_pB" />
        <reference id="1139959269582" name="actionMap" index="1ERwB7" />
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
        <property id="1082639509531" name="nullText" index="ilYzB" />
        <property id="1073389577007" name="text" index="3F0ifm" />
      </concept>
      <concept id="1073389658414" name="jetbrains.mps.lang.editor.structure.CellModel_Property" flags="sg" stub="730538219796134133" index="3F0A7n" />
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ng" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1073389882823" name="jetbrains.mps.lang.editor.structure.CellModel_RefNode" flags="sg" stub="730538219795960754" index="3F1sOY" />
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
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
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
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
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
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
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
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
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
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
      <concept id="7453996997717780434" name="jetbrains.mps.lang.smodel.structure.Node_GetSConceptOperation" flags="nn" index="2yIwOk" />
      <concept id="1143234257716" name="jetbrains.mps.lang.smodel.structure.Node_GetModelOperation" flags="nn" index="I4A8Y" />
      <concept id="1145404486709" name="jetbrains.mps.lang.smodel.structure.SemanticDowncastExpression" flags="nn" index="2JrnkZ">
        <child id="1145404616321" name="leftExpression" index="2JrQYb" />
      </concept>
      <concept id="1154546950173" name="jetbrains.mps.lang.smodel.structure.ConceptReference" flags="ng" index="3gn64h">
        <reference id="1154546997487" name="concept" index="3gnhBz" />
      </concept>
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="6039268229364358244" name="jetbrains.mps.lang.smodel.structure.ExactConceptCase" flags="ng" index="1pnPoh">
        <child id="6039268229364358388" name="body" index="1pnPq1" />
        <child id="6039268229364358387" name="concept" index="1pnPq6" />
      </concept>
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
      </concept>
      <concept id="5944356402132808749" name="jetbrains.mps.lang.smodel.structure.ConceptSwitchStatement" flags="nn" index="1_3QMa">
        <child id="6039268229365417680" name="defaultBlock" index="1prKM_" />
        <child id="5944356402132808753" name="case" index="1_3QMm" />
        <child id="5944356402132808752" name="expression" index="1_3QMn" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI">
        <reference id="1140138128738" name="concept" index="1PxNhF" />
        <child id="1140138123956" name="leftExpression" index="1PxMeX" />
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
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
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
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1203518072036" name="jetbrains.mps.baseLanguage.collections.structure.SmartClosureParameterDeclaration" flags="ig" index="Rh6nW" />
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
      <concept id="1202120902084" name="jetbrains.mps.baseLanguage.collections.structure.WhereOperation" flags="nn" index="3zZkjj" />
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
  <node concept="24kQdi" id="2UjW4IkI07o">
    <property role="3GE5qa" value="Timer" />
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
                    <node concept="3TrEf2" id="4ZphVsbECnI" role="2OqNvi">
                      <ref role="3Tt5mk" to="bwbq:58wCuMl1UJ2" />
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
        <ref role="1NtTu8" to="bwbq:58wCuMl1UJ2" />
        <node concept="1sVBvm" id="6g77ZYUpUQS" role="1sWHZn">
          <node concept="3F0A7n" id="6g77ZYUpUU1" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="_SoWTEes9w">
    <property role="3GE5qa" value="Event" />
    <ref role="1XX52x" to="bwbq:1x4fgD956ve" resolve="EventRef" />
    <node concept="3EZMnI" id="_SoWTEes9y" role="2wV5jI">
      <node concept="3F0ifn" id="_SoWTEes9D" role="3EZMnx">
        <property role="3F0ifm" value="(E)" />
      </node>
      <node concept="1iCGBv" id="_SoWTEes9N" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:5JhwNflEF4y" />
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
    <property role="3GE5qa" value="Event" />
    <ref role="1XX52x" to="bwbq:4B0n6H25BL_" resolve="EventDeclaration" />
    <node concept="3F1sOY" id="4B0n6H25IFy" role="2wV5jI">
      <ref role="1NtTu8" to="x27k:2VsHNE717Q8" />
    </node>
  </node>
  <node concept="24kQdi" id="_SoWTEeejV">
    <property role="3GE5qa" value="Event" />
    <ref role="1XX52x" to="bwbq:1x4fgD956iF" resolve="EventLiteral" />
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
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPO" />
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
  <node concept="24kQdi" id="4PUAo64jfj6">
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:1x4fgD956tm" resolve="TaskRef" />
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
                      <ref role="3Tt5mk" to="bwbq:1x4fgD956tn" />
                    </node>
                  </node>
                  <node concept="2yIwOk" id="1eGaHOMv7A4" role="2OqNvi" />
                </node>
                <node concept="1pnPoh" id="1eGaHOMv7C6" role="1_3QMm">
                  <node concept="3gn64h" id="1eGaHOMv7Eb" role="1pnPq6">
                    <ref role="3gnhBz" to="bwbq:4F1Ib7ChyL$" resolve="ExtendedTask" />
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
                      <ref role="3Tt5mk" to="bwbq:1x4fgD956tn" />
                    </node>
                  </node>
                  <node concept="2yIwOk" id="1eGaHOMvaAU" role="2OqNvi" />
                </node>
                <node concept="1pnPoh" id="1eGaHOMvaAV" role="1_3QMm">
                  <node concept="3gn64h" id="1eGaHOMvaAW" role="1pnPq6">
                    <ref role="3gnhBz" to="bwbq:4F1Ib7ChyL$" resolve="ExtendedTask" />
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
        <ref role="1NtTu8" to="bwbq:1x4fgD956tn" />
        <node concept="1sVBvm" id="4PUAo64jfjn" role="1sWHZn">
          <node concept="3F0A7n" id="4PUAo64jfjv" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="2ZNMQTB12lY">
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:2ZNMQTB12lN" resolve="TaskMacro" />
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
        <ref role="1NtTu8" to="bwbq:2ZNMQTB12lR" />
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
        <ref role="1NtTu8" to="bwbq:2ZNMQTB12lR" />
        <node concept="1sVBvm" id="7saPwHYIaRV" role="1sWHZn">
          <node concept="PMmxH" id="7saPwHYIaS8" role="2wV5jI">
            <ref role="PMmxG" node="4PUAo64jhdw" resolve="TaskPart" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="4NwoSLUgvym">
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:4NwoSLUgvyg" resolve="TerminateTaskStatement" />
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
  <node concept="24kQdi" id="4PUAo64jhi9">
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:4F1Ib7ChyL$" resolve="ExtendedTask" />
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
          <ref role="1NtTu8" to="bwbq:4F1Ib7ChyL_" />
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
  <node concept="24kQdi" id="4PUAo64h_fU">
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:1x4fgD956cc" resolve="Task" />
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
  <node concept="PKFIW" id="4PUAo64jhdw">
    <property role="TrG5h" value="TaskPart" />
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:1x4fgD956cc" resolve="Task" />
    <node concept="3EZMnI" id="4PUAo64jhdO" role="2wV5jI">
      <node concept="3EZMnI" id="4PUAo64jhdV" role="3EZMnx">
        <node concept="VPM3Z" id="4PUAo64jhdX" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="4PUAo64jhe6" role="3EZMnx">
          <property role="3F0ifm" value="with priority" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6gbI" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPF" />
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
          <ref role="1NtTu8" to="bwbq:3QwuWjHllkV" resolve="schedule" />
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
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPJ" />
        </node>
        <node concept="3F0ifn" id="4PUAo64jhfh" role="3EZMnx">
          <property role="3F0ifm" value="concurrent activations" />
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
          <ref role="1NtTu8" to="bwbq:4F1Ib7ChyLh" />
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
          <ref role="1NtTu8" to="bwbq:4F1Ib7ChyLB" />
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
          <ref role="1NtTu8" to="bwbq:62xxBiE6fOz" />
          <node concept="l2Vlx" id="62xxBiE6gca" role="2czzBx" />
          <node concept="3F0ifn" id="62xxBiE6gce" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
      </node>
      <node concept="3EZMnI" id="58wCuMkZSD1" role="3EZMnx">
        <node concept="VPM3Z" id="58wCuMkZSD3" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3F0ifn" id="58wCuMkZSD5" role="3EZMnx">
          <property role="3F0ifm" value="stacksize:" />
        </node>
        <node concept="3F1sOY" id="58wCuMkZSDO" role="3EZMnx">
          <property role="39s7Ar" value="true" />
          <property role="1$x2rV" value="default (16 Bytes)" />
          <ref role="1NtTu8" to="bwbq:58wCuMkZKxs" />
        </node>
        <node concept="3F0ifn" id="2CJ7vlDQSxQ" role="3EZMnx">
          <property role="3F0ifm" value="bytes" />
          <node concept="pkWqt" id="2CJ7vlDQSxW" role="pqm2j">
            <node concept="3clFbS" id="2CJ7vlDQSxX" role="2VODD2">
              <node concept="3clFbF" id="2CJ7vlDQSyK" role="3cqZAp">
                <node concept="2OqwBi" id="2CJ7vlDQTn8" role="3clFbG">
                  <node concept="2OqwBi" id="2CJ7vlDQSF3" role="2Oq$k0">
                    <node concept="pncrf" id="2CJ7vlDQSyJ" role="2Oq$k0" />
                    <node concept="3TrEf2" id="2CJ7vlDQT1N" role="2OqNvi">
                      <ref role="3Tt5mk" to="bwbq:58wCuMkZKxs" />
                    </node>
                  </node>
                  <node concept="3x8VRR" id="2CJ7vlDQTxV" role="2OqNvi" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="l2Vlx" id="58wCuMkZSD6" role="2iSdaV" />
      </node>
      <node concept="2iRkQZ" id="4PUAo64jhdR" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="3tDp_yW5YMd">
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:1x4fgD956cc" resolve="Task" />
    <node concept="PMmxH" id="3tDp_yW5YMk" role="2wV5jI">
      <ref role="PMmxG" node="23s$hiVSTNT" resolve="OilTaskEditor" />
    </node>
    <node concept="2aJ2om" id="3tDp_yW5YMh" role="CpUAK">
      <ref role="2$4xQ3" node="3MPhGBwyb2B" resolve="Oil" />
    </node>
  </node>
  <node concept="PKFIW" id="23s$hiVSTNT">
    <property role="TrG5h" value="OilTaskEditor" />
    <property role="3GE5qa" value="Task" />
    <ref role="1XX52x" to="bwbq:1x4fgD956cc" resolve="Task" />
    <node concept="b$f91" id="23s$hiVSTOk" role="2wV5jI">
      <node concept="3EZMnI" id="23s$hiVSTPM" role="b$wch">
        <node concept="l2Vlx" id="23s$hiVSTPP" role="2iSdaV" />
        <node concept="3F0ifn" id="23s$hiVSTQ9" role="3EZMnx">
          <property role="3F0ifm" value="PRIORITY   =" />
        </node>
        <node concept="3F1sOY" id="23s$hiVSTQh" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPF" />
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
          <ref role="1NtTu8" to="bwbq:3QwuWjHllkV" resolve="schedule" />
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
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPJ" />
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
  <node concept="24kQdi" id="JBnlGGCADY">
    <property role="3GE5qa" value="Timer" />
    <ref role="1XX52x" to="bwbq:7FCpXS_WSTn" resolve="AlarmAutostart" />
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
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPA" />
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
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPC" />
        </node>
        <node concept="3F0ifn" id="JBnlGGCAHM" role="3EZMnx">
          <property role="3F0ifm" value="ticks" />
        </node>
      </node>
      <node concept="3EZMnI" id="58wCuMl0I1W" role="3EZMnx">
        <node concept="VPM3Z" id="58wCuMl0I1X" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="58wCuMl0I1Y" role="3EZMnx" />
        <node concept="3F0ifn" id="58wCuMl0I1Z" role="3EZMnx">
          <property role="3F0ifm" value="allowed in Appmodes" />
        </node>
        <node concept="3F2HdR" id="58wCuMl0K1R" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:7FCpXS_WSQo" />
          <node concept="l2Vlx" id="58wCuMl0K1T" role="2czzBx" />
          <node concept="3F0ifn" id="58wCuMl0K1Z" role="2czzBI">
            <property role="3F0ifm" value="none" />
            <ref role="1k5W1q" to="tpco:hshO_Yc" resolve="StubImplementation" />
          </node>
        </node>
        <node concept="l2Vlx" id="58wCuMl0I20" role="2iSdaV" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGBxA1">
    <property role="3GE5qa" value="Timer" />
    <ref role="1XX52x" to="bwbq:5KtH1a6jX_3" resolve="CounterLiteral" />
    <node concept="3EZMnI" id="JBnlGGBxAK" role="2wV5jI">
      <node concept="2iRkQZ" id="JBnlGGBxAL" role="2iSdaV" />
      <node concept="3EZMnI" id="JBnlGGBxBj" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGBxBl" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGBxD5" role="3EZMnx" />
        <node concept="3F0ifn" id="JBnlGGBxBK" role="3EZMnx">
          <property role="3F0ifm" value="minimum cycle" />
        </node>
        <node concept="3F1sOY" id="62xxBiE6gl7" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPy" />
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
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPv" />
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
          <ref role="1NtTu8" to="bwbq:78S7ngm5xPc" />
        </node>
        <node concept="l2Vlx" id="JBnlGGBxEz" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="JBnlGGBxFt" role="3EZMnx">
        <property role="3F0ifm" value="}" />
        <ref role="1k5W1q" to="r4b4:2CEi94dgZq3" resolve="Braces" />
      </node>
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGCGZX">
    <property role="3GE5qa" value="Timer" />
    <ref role="1XX52x" to="bwbq:7FCpXS_WYAv" resolve="AlarmActionCallback" />
    <node concept="3EZMnI" id="JBnlGGCGZZ" role="2wV5jI">
      <node concept="3F0ifn" id="JBnlGGCH06" role="3EZMnx">
        <property role="3F0ifm" value="use Callback" />
      </node>
      <node concept="3F0A7n" id="JBnlGGCH0c" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:7FCpXS_WYAw" resolve="callbackName" />
      </node>
      <node concept="l2Vlx" id="JBnlGGCH02" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGCVg3">
    <property role="3GE5qa" value="Timer" />
    <ref role="1XX52x" to="bwbq:1x4fgD956fc" resolve="Alarm" />
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
          <ref role="1NtTu8" to="bwbq:7FCpXS_WYu$" />
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
          <ref role="1NtTu8" to="bwbq:7FCpXS_WYQV" />
        </node>
        <node concept="l2Vlx" id="JBnlGGCVlp" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="JBnlGGCVmE" role="3EZMnx">
        <node concept="VPM3Z" id="JBnlGGCVmG" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="JBnlGGCVne" role="3EZMnx" />
        <node concept="3F1sOY" id="JBnlGGCVno" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:7FCpXS_WYwf" />
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
          <ref role="1NtTu8" to="bwbq:62xxBiE6gkR" />
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
  <node concept="24kQdi" id="JBnlGGCKFj">
    <property role="3GE5qa" value="Timer" />
    <ref role="1XX52x" to="bwbq:7FCpXS_WYIB" resolve="AlarmActionSetEvent" />
    <node concept="3EZMnI" id="JBnlGGCKFo" role="2wV5jI">
      <node concept="3F0ifn" id="JBnlGGCKFq" role="3EZMnx">
        <property role="3F0ifm" value="activate Event" />
      </node>
      <node concept="1iCGBv" id="JBnlGGCKFA" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:7FCpXS_WYKh" />
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
        <ref role="1NtTu8" to="bwbq:7FCpXS_WYGX" />
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
  <node concept="24kQdi" id="JBnlGGCIHq">
    <property role="3GE5qa" value="Timer" />
    <ref role="1XX52x" to="bwbq:7FCpXS_WYDG" resolve="AlarmActionActivateTask" />
    <node concept="3EZMnI" id="JBnlGGCIHs" role="2wV5jI">
      <node concept="3F0ifn" id="JBnlGGCIHz" role="3EZMnx">
        <property role="3F0ifm" value="activate Task" />
      </node>
      <node concept="1iCGBv" id="JBnlGGCII5" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:7FCpXS_WYGX" />
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
  <node concept="24kQdi" id="2q8YB8RhyUf">
    <property role="3GE5qa" value="Message" />
    <ref role="1XX52x" to="bwbq:1x4fgD956$h" resolve="MessageType" />
    <node concept="3EZMnI" id="2q8YB8RhyUh" role="2wV5jI">
      <node concept="3F0ifn" id="2q8YB8RhyUo" role="3EZMnx">
        <property role="3F0ifm" value="(M)" />
      </node>
      <node concept="1iCGBv" id="2q8YB8RhyUy" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:1x4fgD956$i" />
        <node concept="1sVBvm" id="2q8YB8RhyU$" role="1sWHZn">
          <node concept="3F0A7n" id="2q8YB8RhyUJ" role="2wV5jI">
            <property role="1Intyy" value="true" />
            <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="l2Vlx" id="2q8YB8RhyUk" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="1eGaHOMvqOe">
    <property role="3GE5qa" value="Message" />
    <ref role="1XX52x" to="bwbq:1x4fgD956kb" resolve="Message" />
    <node concept="3EZMnI" id="1eGaHOMvqOg" role="2wV5jI">
      <node concept="3F0ifn" id="1eGaHOMvqOn" role="3EZMnx">
        <property role="3F0ifm" value="Message" />
      </node>
      <node concept="3F0A7n" id="1eGaHOMvqOx" role="3EZMnx">
        <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
      </node>
      <node concept="l2Vlx" id="1eGaHOMvqOj" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="JBnlGGDxpe">
    <property role="3GE5qa" value="ISR" />
    <ref role="1XX52x" to="bwbq:62xxBiE6fO3" resolve="ISRType" />
    <node concept="3EZMnI" id="JBnlGGDxpm" role="2wV5jI">
      <node concept="3F0ifn" id="62xxBiE6fO7" role="3EZMnx">
        <property role="3F0ifm" value="(I)" />
      </node>
      <node concept="1iCGBv" id="62xxBiE6fOd" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:62xxBiE6fO4" />
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
    <property role="3GE5qa" value="ISR" />
    <ref role="1XX52x" to="bwbq:1x4fgD956dS" resolve="ISR" />
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
          <ref role="1NtTu8" to="bwbq:2WOANQOwsfT" resolve="category" />
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
          <ref role="1NtTu8" to="bwbq:2WOANQOwsi8" />
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
          <ref role="1NtTu8" to="bwbq:2WOANQOwsia" />
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
  <node concept="24kQdi" id="62xxBiE6Cn3">
    <property role="3GE5qa" value="Core" />
    <ref role="1XX52x" to="bwbq:1x4fgD956aP" resolve="AppMode" />
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
  <node concept="24kQdi" id="_SoWTEesaz">
    <property role="3GE5qa" value="Core" />
    <ref role="1XX52x" to="bwbq:1x4fgD956_n" resolve="AppModeType" />
    <node concept="3EZMnI" id="_SoWTEesa_" role="2wV5jI">
      <node concept="3F0ifn" id="_SoWTEesaG" role="3EZMnx">
        <property role="3F0ifm" value="(A)" />
      </node>
      <node concept="1iCGBv" id="_SoWTEesaQ" role="3EZMnx">
        <ref role="1NtTu8" to="bwbq:1x4fgD956_o" />
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
  <node concept="24kQdi" id="62xxBiE6swj">
    <property role="3GE5qa" value="Core" />
    <ref role="1XX52x" to="bwbq:1x4fgD94T$4" resolve="CPU" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD956aq" />
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
                      <ref role="3Tt5mk" to="bwbq:62xxBiE6szm" />
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
          <ref role="1NtTu8" to="bwbq:62xxBiE6szm" />
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
          <ref role="1NtTu8" to="bwbq:5KtH1a6kkoW" />
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
          <ref role="1NtTu8" to="bwbq:7FCpXS_WSLS" />
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
          <ref role="1NtTu8" to="bwbq:62xxBiE6sz5" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD956bG" />
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
          <ref role="1NtTu8" to="bwbq:7FCpXS_W1Ko" />
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
          <ref role="1NtTu8" to="bwbq:7FCpXS_W1Kk" />
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
          <ref role="1NtTu8" to="bwbq:62xxBiE6szd" />
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
          <ref role="1NtTu8" to="bwbq:62xxBiE6szO" />
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
          <ref role="1NtTu8" to="bwbq:62xxBiE7yQ$" />
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
          <ref role="1NtTu8" to="bwbq:6g77ZYUpcAO" />
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
  <node concept="24kQdi" id="_SoWTEesbi">
    <property role="3GE5qa" value="Core" />
    <ref role="1XX52x" to="bwbq:1x4fgD94T$g" resolve="OS" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T$u" resolve="status" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T$T" resolve="preTaskHook" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T$Z" resolve="postTaskHook" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T$K" resolve="errorHook" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T$w" resolve="startupHook" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T$O" resolve="shutdownHook" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T_v" resolve="useParamterAccess" />
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
          <ref role="1NtTu8" to="bwbq:1x4fgD94T_C" resolve="useResScheduler" />
        </node>
        <node concept="l2Vlx" id="_SoWTEeskS" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="_SoWTEeslU" role="3EZMnx">
        <node concept="VPM3Z" id="_SoWTEeslV" role="3F10Kt">
          <property role="VOm3f" value="false" />
        </node>
        <node concept="3XFhqQ" id="_SoWTEeslW" role="3EZMnx" />
        <node concept="3F0ifn" id="_SoWTEespP" role="3EZMnx">
          <property role="3F0ifm" value="use get service ID" />
        </node>
        <node concept="3F0A7n" id="_SoWTEespB" role="3EZMnx">
          <ref role="1NtTu8" to="bwbq:1x4fgD94T_n" resolve="useGetServiceID" />
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
  <node concept="24kQdi" id="1eGaHOMvqOI">
    <property role="3GE5qa" value="COM" />
    <ref role="1XX52x" to="bwbq:1x4fgD956pO" resolve="IPDU" />
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
  <node concept="24kQdi" id="zf_u2EOSyg">
    <property role="3GE5qa" value="COM" />
    <ref role="1XX52x" to="bwbq:1x4fgD956o9" resolve="COM" />
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
          <ref role="1NtTu8" to="bwbq:6pX2__D8l7l" resolve="status" />
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
          <ref role="1NtTu8" to="bwbq:7ZTJPb1S2Cz" />
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
          <ref role="1NtTu8" to="bwbq:6pX2__D8l7f" resolve="startCOMExtension" />
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
          <ref role="1NtTu8" to="bwbq:6pX2__D8qNa" resolve="use" />
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
          <ref role="1NtTu8" to="bwbq:6pX2__D8l6T" resolve="useServiceID" />
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
          <ref role="1NtTu8" to="bwbq:6pX2__D8l7a" resolve="useParameterAccess" />
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
          <ref role="1NtTu8" to="bwbq:6pX2__D8l6Q" resolve="errorHook" />
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
          <ref role="1NtTu8" to="bwbq:6pX2__D8qMC" />
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
  <node concept="24kQdi" id="zf_u2EOoHo">
    <ref role="1XX52x" to="bwbq:1x4fgD93Cjb" resolve="OilFile" />
    <node concept="1gkWj3" id="3pj_nYrpEJc" role="2wV5jI">
      <property role="1gkWj2" value="true" />
      <node concept="3EZMnI" id="5_l8w1EmTdD" role="1gkWjp">
        <property role="S$Qs1" value="true" />
        <node concept="3EZMnI" id="3r83Ks0g9P$" role="3EZMnx">
          <node concept="VPM3Z" id="3r83Ks0g9P_" role="3F10Kt">
            <property role="VOm3f" value="false" />
          </node>
          <node concept="3EZMnI" id="3r83Ks0g9PC" role="3EZMnx">
            <node concept="VPM3Z" id="3r83Ks0g9PD" role="3F10Kt">
              <property role="VOm3f" value="false" />
            </node>
            <node concept="l2Vlx" id="3r83Ks0g9PF" role="2iSdaV" />
            <node concept="PMmxH" id="5YkaFUJUWiV" role="3EZMnx">
              <ref role="PMmxG" to="r4b4:2A5UqXJPGTA" resolve="iconAndNameCell" />
            </node>
            <node concept="3EZMnI" id="3r83Ks0gb4c" role="3EZMnx">
              <node concept="l2Vlx" id="3r83Ks0gb4d" role="2iSdaV" />
              <node concept="3F0ifn" id="3r83Ks0gb4e" role="3EZMnx">
                <property role="3F0ifm" value="model  " />
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="VPM3Z" id="3r83Ks0gyrX" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
              </node>
              <node concept="1HlG4h" id="3r83Ks0gb4f" role="3EZMnx">
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="1HfYo3" id="3r83Ks0gb4g" role="1HlULh">
                  <node concept="3TQlhw" id="3r83Ks0gb4h" role="1Hhtcw">
                    <node concept="3clFbS" id="3r83Ks0gb4i" role="2VODD2">
                      <node concept="3clFbF" id="3r83Ks0gb4E" role="3cqZAp">
                        <node concept="2YIFZM" id="5Hxjapwed33" role="3clFbG">
                          <ref role="1Pybhc" to="unno:1NYD3hytmTa" resolve="SNodeOperations" />
                          <ref role="37wK5l" to="unno:7WvVJ3rORmu" resolve="getModelLongName" />
                          <node concept="2JrnkZ" id="5Hxjapwed34" role="37wK5m">
                            <node concept="2OqwBi" id="5Hxjapwed35" role="2JrQYb">
                              <node concept="pncrf" id="5Hxjapwed36" role="2Oq$k0" />
                              <node concept="I4A8Y" id="5Hxjapwed37" role="2OqNvi" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="11LMrY" id="3r83Ks0gb4u" role="3F10Kt">
                  <property role="VOm3f" value="true" />
                </node>
                <node concept="VPM3Z" id="7Ua2xCXxDA6" role="3F10Kt">
                  <property role="VOm3f" value="true" />
                </node>
              </node>
              <node concept="pVoyu" id="3r83Ks0gb4v" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
            <node concept="3EZMnI" id="3r83Ks0g7Sk" role="3EZMnx">
              <node concept="l2Vlx" id="3r83Ks0g7Sl" role="2iSdaV" />
              <node concept="3F0ifn" id="3r83Ks0gb4b" role="3EZMnx">
                <property role="3F0ifm" value="package" />
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="VPM3Z" id="3r83Ks0gyrW" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
              </node>
              <node concept="1HlG4h" id="6GZLGDRsw6C" role="3EZMnx">
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="1HfYo3" id="6GZLGDRsw6D" role="1HlULh">
                  <node concept="3TQlhw" id="6GZLGDRsw6E" role="1Hhtcw">
                    <node concept="3clFbS" id="6GZLGDRsw6F" role="2VODD2">
                      <node concept="3clFbF" id="6GZLGDRsw6J" role="3cqZAp">
                        <node concept="3K4zz7" id="6GZLGDRsw8g" role="3clFbG">
                          <node concept="2OqwBi" id="6GZLGDRsw8D" role="3K4E3e">
                            <node concept="pncrf" id="6GZLGDRsw8k" role="2Oq$k0" />
                            <node concept="3TrcHB" id="6GZLGDRsw8J" role="2OqNvi">
                              <ref role="3TsBF5" to="tpck:hnGE5uv" resolve="virtualPackage" />
                            </node>
                          </node>
                          <node concept="Xl_RD" id="6GZLGDRsw99" role="3K4GZi">
                            <property role="Xl_RC" value="" />
                          </node>
                          <node concept="3y3z36" id="6GZLGDRsw7S" role="3K4Cdx">
                            <node concept="10Nm6u" id="6GZLGDRsw7V" role="3uHU7w" />
                            <node concept="2OqwBi" id="6GZLGDRsw77" role="3uHU7B">
                              <node concept="pncrf" id="6GZLGDRsw6M" role="2Oq$k0" />
                              <node concept="3TrcHB" id="6GZLGDRsw7d" role="2OqNvi">
                                <ref role="3TsBF5" to="tpck:hnGE5uv" resolve="virtualPackage" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="11LMrY" id="6GZLGDRsw6G" role="3F10Kt">
                  <property role="VOm3f" value="true" />
                </node>
              </node>
              <node concept="pVoyu" id="3r83Ks0g7Sp" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
              <node concept="pkWqt" id="3r83Ks0g8eZ" role="pqm2j">
                <node concept="3clFbS" id="3r83Ks0g8f0" role="2VODD2">
                  <node concept="3clFbF" id="3r83Ks0g8f1" role="3cqZAp">
                    <node concept="3y3z36" id="3r83Ks0g8fN" role="3clFbG">
                      <node concept="10Nm6u" id="3r83Ks0g8fQ" role="3uHU7w" />
                      <node concept="2OqwBi" id="3r83Ks0g8fn" role="3uHU7B">
                        <node concept="pncrf" id="3r83Ks0g8f2" role="2Oq$k0" />
                        <node concept="3TrcHB" id="3r83Ks0g8ft" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:hnGE5uv" resolve="virtualPackage" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3EZMnI" id="1Y5JHpRzCE$" role="3EZMnx">
              <node concept="l2Vlx" id="1Y5JHpRzCE_" role="2iSdaV" />
              <node concept="3F0ifn" id="1Y5JHpRzCEA" role="3EZMnx">
                <property role="3F0ifm" value="oil version:" />
                <ref role="1k5W1q" to="r4b4:2CEi94e3iKI" resolve="PassiveText" />
                <node concept="VPM3Z" id="1Y5JHpRzCEB" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
              </node>
              <node concept="3F0A7n" id="1Y5JHpRzCMJ" role="3EZMnx">
                <ref role="1NtTu8" to="bwbq:1x4fgD93NIt" resolve="oilVersion" />
              </node>
              <node concept="pVoyu" id="1Y5JHpRzCEO" role="3F10Kt">
                <property role="VOm3f" value="true" />
              </node>
            </node>
          </node>
          <node concept="2iRfu4" id="3r83Ks0g9PB" role="2iSdaV" />
          <node concept="3XFhqQ" id="3r83Ks0gvLu" role="3EZMnx" />
          <node concept="3XFhqQ" id="3r83Ks0gvLr" role="3EZMnx" />
          <node concept="3EZMnI" id="7XSydqWQbu" role="3EZMnx">
            <node concept="2iRkQZ" id="7XSydqWQbv" role="2iSdaV" />
            <node concept="3EZMnI" id="3r83Ks0g9PH" role="3EZMnx">
              <node concept="VPM3Z" id="3r83Ks0g9PI" role="3F10Kt">
                <property role="VOm3f" value="false" />
              </node>
              <node concept="3F0ifn" id="19a6$uAA8hM" role="3EZMnx">
                <property role="3F0ifm" value="include" />
                <ref role="1k5W1q" to="r4b4:2CEi94dgHKA" resolve="KW" />
              </node>
              <node concept="3F0ifn" id="7XSydqWWfC" role="3EZMnx">
                <property role="3F0ifm" value="   " />
                <node concept="VPxyj" id="7XSydqWXJh" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
                <node concept="VPM3Z" id="7XSydqWXK8" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
              </node>
              <node concept="3F2HdR" id="19a6$uAA8hV" role="3EZMnx">
                <property role="S$F3r" value="true" />
                <ref role="1NtTu8" to="x27k:19a6$uAA8hU" />
                <node concept="3F0ifn" id="19a6$uAAakq" role="2czzBI">
                  <property role="ilYzB" value="nothing" />
                  <ref role="1k5W1q" to="r4b4:2$$_2GR98qK" resolve="nothing" />
                  <node concept="VPxyj" id="3FBBKmmMM1E" role="3F10Kt">
                    <property role="VOm3f" value="true" />
                  </node>
                </node>
                <node concept="pj6Ft" id="7apEgWbIFgo" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
                <node concept="2iRkQZ" id="3r83Ks0g8fR" role="2czzBx" />
                <node concept="ljvvj" id="7apEgWbIFgq" role="3F10Kt">
                  <property role="VOm3f" value="false" />
                </node>
                <node concept="1HlG4h" id="3r83Ks0g8fT" role="3EmGlc">
                  <node concept="1HfYo3" id="3r83Ks0g8fU" role="1HlULh">
                    <node concept="3TQlhw" id="3r83Ks0g8fV" role="1Hhtcw">
                      <node concept="3clFbS" id="3r83Ks0g8fW" role="2VODD2">
                        <node concept="3clFbF" id="3r83Ks0g8fX" role="3cqZAp">
                          <node concept="3cpWs3" id="3r83Ks0g8I4" role="3clFbG">
                            <node concept="Xl_RD" id="3r83Ks0g8I7" role="3uHU7w">
                              <property role="Xl_RC" value=" imports" />
                            </node>
                            <node concept="2OqwBi" id="3r83Ks0g8gL" role="3uHU7B">
                              <node concept="2OqwBi" id="3r83Ks0g8gl" role="2Oq$k0">
                                <node concept="pncrf" id="3r83Ks0g8g0" role="2Oq$k0" />
                                <node concept="3Tsc0h" id="3r83Ks0g8gr" role="2OqNvi">
                                  <ref role="3TtcxE" to="x27k:19a6$uAA8hU" />
                                </node>
                              </node>
                              <node concept="34oBXx" id="3r83Ks0g8gR" role="2OqNvi" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="4$FPG" id="5Xe$YcRFT7K" role="4_6I_">
                  <node concept="3clFbS" id="5Xe$YcRFT7L" role="2VODD2">
                    <node concept="3clFbF" id="5Xe$YcRFTN$" role="3cqZAp">
                      <node concept="2ShNRf" id="5Xe$YcRFTNy" role="3clFbG">
                        <node concept="3zrR0B" id="5Xe$YcRFZ6S" role="2ShVmc">
                          <node concept="3Tqbb2" id="5Xe$YcRFZ6U" role="3zrR0E">
                            <ref role="ehGHo" to="vs0r:5Xe$YcRDdel" resolve="EmptyChunkDependency" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="l2Vlx" id="3r83Ks0g9PK" role="2iSdaV" />
            </node>
          </node>
        </node>
        <node concept="gc7cB" id="3Dgh5aYj2Ho" role="3EZMnx">
          <node concept="3VJUX4" id="3Dgh5aYj2Hp" role="3YsKMw">
            <node concept="3clFbS" id="3Dgh5aYj2Hq" role="2VODD2">
              <node concept="3clFbF" id="3Dgh5aYijI8" role="3cqZAp">
                <node concept="2ShNRf" id="3Dgh5aYijI9" role="3clFbG">
                  <node concept="1pGfFk" id="3Dgh5aYiA9J" role="2ShVmc">
                    <ref role="37wK5l" to="r4b4:3Dgh5aYiKso" resolve="HorizLineCell" />
                    <node concept="pncrf" id="3Dgh5aYiKt7" role="37wK5m" />
                    <node concept="10M0yZ" id="2CEi94evnhX" role="37wK5m">
                      <ref role="1PxDUh" to="r4b4:4tRpPVPUEa3" resolve="BasicColors" />
                      <ref role="3cqZAo" to="r4b4:2CEi94emCnI" resolve="KEYWORD_BLUE" />
                    </node>
                    <node concept="3cmrfG" id="3Dgh5aYiKtb" role="37wK5m">
                      <property role="3cmrfH" value="2" />
                    </node>
                    <node concept="3cmrfG" id="3Dgh5aYiKtd" role="37wK5m">
                      <property role="3cmrfH" value="3" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="pVoyu" id="3r83Ks0fRwq" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3F0ifn" id="7FZLineUJny" role="3EZMnx">
          <property role="3F0ifm" value="" />
          <node concept="VPxyj" id="3Dgh5aYjUHJ" role="3F10Kt">
            <property role="VOm3f" value="false" />
          </node>
          <node concept="VPM3Z" id="3Dgh5aYjUHL" role="3F10Kt">
            <property role="VOm3f" value="false" />
          </node>
          <node concept="pVoyu" id="3r83Ks0fRws" role="3F10Kt">
            <property role="VOm3f" value="true" />
          </node>
        </node>
        <node concept="3EZMnI" id="zf_u2EOoMG" role="3EZMnx">
          <node concept="l2Vlx" id="zf_u2EOoMH" role="2iSdaV" />
          <node concept="3F1sOY" id="zf_u2EOoKF" role="3EZMnx">
            <ref role="1NtTu8" to="bwbq:7FCpXS_VYUZ" />
          </node>
          <node concept="pVoyu" id="1Y5JHpRzHR3" role="3F10Kt">
            <property role="VOm3f" value="true" />
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
  </node>
  <node concept="24kQdi" id="3WvbRq1RuPP">
    <property role="3GE5qa" value="Timer" />
    <ref role="1XX52x" to="bwbq:3WvbRq1R3ja" resolve="CounterDeclaration" />
    <node concept="3EZMnI" id="3WvbRq1RuPR" role="2wV5jI">
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
      <node concept="3F1sOY" id="3WvbRq1RuQa" role="3EZMnx">
        <ref role="1NtTu8" to="x27k:2VsHNE717Q8" />
      </node>
      <node concept="2iRkQZ" id="3WvbRq1RuPU" role="2iSdaV" />
    </node>
    <node concept="1HlG4h" id="3WvbRq1TKE2" role="6VMZX">
      <node concept="1HfYo3" id="3WvbRq1TKE3" role="1HlULh">
        <node concept="3TQlhw" id="3WvbRq1TKE4" role="1Hhtcw">
          <node concept="3clFbS" id="3WvbRq1TKE5" role="2VODD2">
            <node concept="3clFbF" id="3WvbRq1TKFv" role="3cqZAp">
              <node concept="3cpWs3" id="3WvbRq1U8PE" role="3clFbG">
                <node concept="Xl_RD" id="3WvbRq1UnR3" role="3uHU7B">
                  <property role="Xl_RC" value="Counter is used by the following alarms: " />
                </node>
                <node concept="2OqwBi" id="3WvbRq1TXr2" role="3uHU7w">
                  <node concept="2OqwBi" id="3WvbRq1TWl3" role="2Oq$k0">
                    <node concept="1PxgMI" id="3WvbRq1TW9G" role="2Oq$k0">
                      <ref role="1PxNhF" to="bwbq:1x4fgD94T$4" resolve="CPU" />
                      <node concept="2OqwBi" id="3WvbRq1TUZd" role="1PxMeX">
                        <node concept="pncrf" id="3WvbRq1TUyK" role="2Oq$k0" />
                        <node concept="1mfA1w" id="3WvbRq1TVmu" role="2OqNvi" />
                      </node>
                    </node>
                    <node concept="3Tsc0h" id="3WvbRq1TWCZ" role="2OqNvi">
                      <ref role="3TtcxE" to="bwbq:7FCpXS_WSLS" />
                    </node>
                  </node>
                  <node concept="3zZkjj" id="3WvbRq1UaMx" role="2OqNvi">
                    <node concept="1bVj0M" id="3WvbRq1UaMz" role="23t8la">
                      <node concept="3clFbS" id="3WvbRq1UaM$" role="1bW5cS">
                        <node concept="3clFbF" id="3WvbRq1UaXA" role="3cqZAp">
                          <node concept="3clFbC" id="3WvbRq1UbGh" role="3clFbG">
                            <node concept="pncrf" id="3WvbRq1UbSb" role="3uHU7w" />
                            <node concept="2OqwBi" id="3WvbRq1Ub3o" role="3uHU7B">
                              <node concept="37vLTw" id="3WvbRq1UaX_" role="2Oq$k0">
                                <ref role="3cqZAo" node="3WvbRq1UaM_" resolve="it" />
                              </node>
                              <node concept="3TrEf2" id="3WvbRq1UbgG" role="2OqNvi">
                                <ref role="3Tt5mk" to="bwbq:7FCpXS_WYu$" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="Rh6nW" id="3WvbRq1UaM_" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="3WvbRq1UaMA" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

