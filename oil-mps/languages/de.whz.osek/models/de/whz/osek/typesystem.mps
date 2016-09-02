<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4c3f0556-2304-431e-8716-2335d8e49087(de.whz.osek.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="ahli" ref="r:44ccebce-f3a6-4238-afbf-c4a18f6348c1(com.mbeddr.core.buildconfig.behavior)" implicit="true" />
    <import index="qd6m" ref="r:c4c3f7d3-0acf-4671-a134-5fab66c4e637(com.mbeddr.core.modules.behavior)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="7loq" ref="r:6080ec09-c756-4f2a-9d90-7695b076e53c(de.whz.osek.behavior)" implicit="true" />
    <import index="ywuz" ref="r:c6ce92e7-5a98-4a6f-866a-ec8b9e945dd8(com.mbeddr.core.expressions.behavior)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1188206331916" name="jetbrains.mps.baseLanguage.structure.Annotation" flags="ig" index="2ABs$o" />
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
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
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1082485599094" name="ifFalseStatement" index="9aQIa" />
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
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
      <concept id="1081506762703" name="jetbrains.mps.baseLanguage.structure.GreaterThanExpression" flags="nn" index="3eOSWO" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <property id="521412098689998745" name="nonStatic" index="2bfB8j" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="6329021646629104957" name="jetbrains.mps.baseLanguage.structure.TextCommentPart" flags="nn" index="3SKdUq">
        <property id="6329021646629104958" name="text" index="3SKdUp" />
      </concept>
      <concept id="6329021646629104954" name="jetbrains.mps.baseLanguage.structure.SingleLineComment" flags="nn" index="3SKdUt">
        <child id="6329021646629175155" name="commentPart" index="3SKWNk" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1185788614172" name="jetbrains.mps.lang.typesystem.structure.NormalTypeClause" flags="ng" index="mw_s8">
        <child id="1185788644032" name="normalType" index="mwGJk" />
      </concept>
      <concept id="1175147569072" name="jetbrains.mps.lang.typesystem.structure.AbstractSubtypingRule" flags="ig" index="2sgdUx">
        <child id="1175147624276" name="body" index="2sgrp5" />
      </concept>
      <concept id="1175147670730" name="jetbrains.mps.lang.typesystem.structure.SubtypingRule" flags="ig" index="2sgARr" />
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1227096498176" name="jetbrains.mps.lang.typesystem.structure.PropertyMessageTarget" flags="ng" index="2ODE4t">
        <reference id="1227096521710" name="propertyDeclaration" index="2ODJFN" />
      </concept>
      <concept id="1227096774658" name="jetbrains.mps.lang.typesystem.structure.MessageStatement" flags="ng" index="2OEH$v">
        <child id="1227096802791" name="helginsIntention" index="2OEOjU" />
        <child id="1227096802790" name="nodeToReport" index="2OEOjV" />
        <child id="1227096836496" name="messageTarget" index="2OEWyd" />
      </concept>
      <concept id="1216383170661" name="jetbrains.mps.lang.typesystem.structure.TypesystemQuickFix" flags="ng" index="Q5z_Y">
        <child id="1216383424566" name="executeBlock" index="Q6x$H" />
        <child id="1216391046856" name="descriptionBlock" index="QzAvj" />
      </concept>
      <concept id="1216383287005" name="jetbrains.mps.lang.typesystem.structure.QuickFixExecuteBlock" flags="in" index="Q5ZZ6" />
      <concept id="1216383337216" name="jetbrains.mps.lang.typesystem.structure.ConceptFunctionParameter_node" flags="nn" index="Q6c8r" />
      <concept id="1216390987552" name="jetbrains.mps.lang.typesystem.structure.QuickFixDescriptionBlock" flags="in" index="QznSV" />
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <property id="1195213689297" name="overrides" index="18ip37" />
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="6405009306797516074" name="jetbrains.mps.lang.typesystem.structure.SubstituteTypeRule" flags="ig" index="3qnSWH">
        <child id="7323318266641100480" name="body" index="3hT0BD" />
      </concept>
      <concept id="1210784285454" name="jetbrains.mps.lang.typesystem.structure.TypesystemIntention" flags="ng" index="3Cnw8n">
        <property id="1216127910019" name="applyImmediately" index="ARO6o" />
        <reference id="1216388525179" name="quickFix" index="QpYPw" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174643105530" name="jetbrains.mps.lang.typesystem.structure.InferenceRule" flags="ig" index="1YbPZF">
        <child id="1193733919555" name="dependency" index="3K5x9m" />
      </concept>
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
      <concept id="1174657487114" name="jetbrains.mps.lang.typesystem.structure.TypeOfExpression" flags="nn" index="1Z2H0r">
        <child id="1174657509053" name="term" index="1Z2MuG" />
      </concept>
      <concept id="1174658326157" name="jetbrains.mps.lang.typesystem.structure.CreateEquationStatement" flags="nn" index="1Z5TYs" />
      <concept id="1174660718586" name="jetbrains.mps.lang.typesystem.structure.AbstractEquationStatement" flags="nn" index="1Zf1VF">
        <child id="1174660783413" name="leftExpression" index="1ZfhK$" />
        <child id="1174660783414" name="rightExpression" index="1ZfhKB" />
      </concept>
      <concept id="1174663118805" name="jetbrains.mps.lang.typesystem.structure.CreateLessThanInequationStatement" flags="nn" index="1ZobV4" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1145383075378" name="jetbrains.mps.lang.smodel.structure.SNodeListType" flags="in" index="2I9FWS">
        <reference id="1145383142433" name="elementConcept" index="2I9WkF" />
      </concept>
      <concept id="1145567426890" name="jetbrains.mps.lang.smodel.structure.SNodeListCreator" flags="nn" index="2T8Vx0">
        <child id="1145567471833" name="createdType" index="2T96Bj" />
      </concept>
      <concept id="3562215692195599741" name="jetbrains.mps.lang.smodel.structure.SLinkImplicitSelect" flags="nn" index="13MTOL">
        <reference id="3562215692195600259" name="link" index="13MTZf" />
      </concept>
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
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
      <concept id="540871147943773365" name="jetbrains.mps.baseLanguage.collections.structure.SingleArgumentSequenceOperation" flags="nn" index="25WWJ4">
        <child id="540871147943773366" name="argument" index="25WWJ7" />
      </concept>
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
      <concept id="1235566554328" name="jetbrains.mps.baseLanguage.collections.structure.AnyOperation" flags="nn" index="2HwmR7" />
      <concept id="1203518072036" name="jetbrains.mps.baseLanguage.collections.structure.SmartClosureParameterDeclaration" flags="ig" index="Rh6nW" />
      <concept id="1160612413312" name="jetbrains.mps.baseLanguage.collections.structure.AddElementOperation" flags="nn" index="TSZUe" />
      <concept id="1160666733551" name="jetbrains.mps.baseLanguage.collections.structure.AddAllElementsOperation" flags="nn" index="X8dFx" />
      <concept id="1162935959151" name="jetbrains.mps.baseLanguage.collections.structure.GetSizeOperation" flags="nn" index="34oBXx" />
      <concept id="1167380149909" name="jetbrains.mps.baseLanguage.collections.structure.RemoveElementOperation" flags="nn" index="3dhRuq" />
      <concept id="1225727723840" name="jetbrains.mps.baseLanguage.collections.structure.FindFirstOperation" flags="nn" index="1z4cxt" />
    </language>
  </registry>
  <node concept="1YbPZF" id="4B0n6H259rh">
    <property role="TrG5h" value="typeof_OilObjectRef" />
    <node concept="3clFbS" id="4B0n6H259ri" role="18ibNy">
      <node concept="1Z5TYs" id="4B0n6H259AN" role="3cqZAp">
        <node concept="mw_s8" id="4B0n6H259Bw" role="1ZfhKB">
          <node concept="1Z2H0r" id="4B0n6H259Bs" role="mwGJk">
            <node concept="2OqwBi" id="4B0n6H259FY" role="1Z2MuG">
              <node concept="1YBJjd" id="4B0n6H259BL" role="2Oq$k0">
                <ref role="1YBMHb" node="4B0n6H259rk" resolve="oilObjectRef" />
              </node>
              <node concept="3TrEf2" id="4B0n6H259Q3" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:4B0n6H258gR" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4B0n6H259AQ" role="1ZfhK$">
          <node concept="1Z2H0r" id="4B0n6H259Sx" role="mwGJk">
            <node concept="1YBJjd" id="4B0n6H259Sy" role="1Z2MuG">
              <ref role="1YBMHb" node="4B0n6H259rk" resolve="oilObjectRef" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4B0n6H259rk" role="1YuTPh">
      <property role="TrG5h" value="oilObjectRef" />
      <ref role="1YaFvo" to="bwbq:4B0n6H25803" resolve="OilObjectRef" />
    </node>
  </node>
  <node concept="18kY7G" id="4EZxVF6oUP4">
    <property role="TrG5h" value="check_OsekExecutable" />
    <property role="18ip37" value="true" />
    <node concept="3clFbS" id="4EZxVF6oUP5" role="18ibNy">
      <node concept="3SKdUt" id="1Bd1FdQVtG2" role="3cqZAp">
        <node concept="3SKdUq" id="1Bd1FdQVtG4" role="3SKWNk">
          <property role="3SKdUp" value="check for user_1ms_isr_type2" />
        </node>
      </node>
      <node concept="3cpWs8" id="7JdyDzjokAI" role="3cqZAp">
        <node concept="3cpWsn" id="7JdyDzjokAL" role="3cpWs9">
          <property role="TrG5h" value="user1msIsrType2s" />
          <node concept="2I9FWS" id="7JdyDzjokAG" role="1tU5fm">
            <ref role="2I9WkF" to="x27k:5_l8w1EmTvx" resolve="Function" />
          </node>
          <node concept="2ShNRf" id="7JdyDzjol2K" role="33vP2m">
            <node concept="2T8Vx0" id="7JdyDzjol2I" role="2ShVmc">
              <node concept="2I9FWS" id="7JdyDzjol2J" role="2T96Bj">
                <ref role="2I9WkF" to="x27k:5_l8w1EmTvx" resolve="Function" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2Gpval" id="7JdyDzjoaHQ" role="3cqZAp">
        <node concept="2GrKxI" id="7JdyDzjoaHS" role="2Gsz3X">
          <property role="TrG5h" value="impl" />
        </node>
        <node concept="2OqwBi" id="7JdyDzjobaE" role="2GsD0m">
          <node concept="1YBJjd" id="7JdyDzjob5n" role="2Oq$k0">
            <ref role="1YBMHb" node="4EZxVF6oUP7" resolve="osekExecutable" />
          </node>
          <node concept="2qgKlT" id="7JdyDzjobPX" role="2OqNvi">
            <ref role="37wK5l" to="ahli:7RiewQ_lHPf" resolve="referencedImplModules" />
          </node>
        </node>
        <node concept="3clFbS" id="7JdyDzjoaHW" role="2LFqv$">
          <node concept="3clFbJ" id="7JdyDzjobSN" role="3cqZAp">
            <node concept="2OqwBi" id="7JdyDzjoe5l" role="3clFbw">
              <node concept="2OqwBi" id="7JdyDzjobVf" role="2Oq$k0">
                <node concept="2GrUjf" id="7JdyDzjobSZ" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="7JdyDzjoaHS" resolve="impl" />
                </node>
                <node concept="2qgKlT" id="7JdyDzjod3u" role="2OqNvi">
                  <ref role="37wK5l" to="qd6m:5DwX9xlFNJe" resolve="flattenedContents" />
                </node>
              </node>
              <node concept="2HwmR7" id="7JdyDzjohQ4" role="2OqNvi">
                <node concept="1bVj0M" id="7JdyDzjohQ6" role="23t8la">
                  <node concept="3clFbS" id="7JdyDzjohQ7" role="1bW5cS">
                    <node concept="3clFbF" id="7JdyDzjohXD" role="3cqZAp">
                      <node concept="2OqwBi" id="7JdyDzjoiOp" role="3clFbG">
                        <node concept="2OqwBi" id="7JdyDzjoi4e" role="2Oq$k0">
                          <node concept="37vLTw" id="7JdyDzjohXC" role="2Oq$k0">
                            <ref role="3cqZAo" node="7JdyDzjohQ8" resolve="it" />
                          </node>
                          <node concept="3TrcHB" id="7JdyDzjoiv9" role="2OqNvi">
                            <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                          </node>
                        </node>
                        <node concept="liA8E" id="7JdyDzjoj7b" role="2OqNvi">
                          <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object):boolean" resolve="equals" />
                          <node concept="Xl_RD" id="7JdyDzjojgq" role="37wK5m">
                            <property role="Xl_RC" value="user_1ms_isr_type2" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="Rh6nW" id="7JdyDzjohQ8" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="7JdyDzjohQ9" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbS" id="7JdyDzjobSP" role="3clFbx">
              <node concept="3clFbF" id="7JdyDzjomfG" role="3cqZAp">
                <node concept="2OqwBi" id="7JdyDzjooI8" role="3clFbG">
                  <node concept="37vLTw" id="7JdyDzjomfF" role="2Oq$k0">
                    <ref role="3cqZAo" node="7JdyDzjokAL" resolve="user1msIsrType2s" />
                  </node>
                  <node concept="TSZUe" id="7JdyDzjoyVq" role="2OqNvi">
                    <node concept="1PxgMI" id="7JdyDzjoPBZ" role="25WWJ7">
                      <ref role="1PxNhF" to="x27k:5_l8w1EmTvx" resolve="Function" />
                      <node concept="2OqwBi" id="7JdyDzjoAGE" role="1PxMeX">
                        <node concept="2OqwBi" id="7JdyDzjozLh" role="2Oq$k0">
                          <node concept="2GrUjf" id="7JdyDzjozid" role="2Oq$k0">
                            <ref role="2Gs0qQ" node="7JdyDzjoaHS" resolve="impl" />
                          </node>
                          <node concept="2qgKlT" id="7JdyDzjo_1P" role="2OqNvi">
                            <ref role="37wK5l" to="qd6m:5DwX9xlFNJe" resolve="flattenedContents" />
                          </node>
                        </node>
                        <node concept="1z4cxt" id="7JdyDzjoDau" role="2OqNvi">
                          <node concept="1bVj0M" id="7JdyDzjoDaw" role="23t8la">
                            <node concept="3clFbS" id="7JdyDzjoDax" role="1bW5cS">
                              <node concept="3clFbF" id="7JdyDzjoE6C" role="3cqZAp">
                                <node concept="2OqwBi" id="7JdyDzjoGKr" role="3clFbG">
                                  <node concept="2OqwBi" id="7JdyDzjoEHz" role="2Oq$k0">
                                    <node concept="37vLTw" id="7JdyDzjoE6B" role="2Oq$k0">
                                      <ref role="3cqZAo" node="7JdyDzjoDay" resolve="it" />
                                    </node>
                                    <node concept="3TrcHB" id="7JdyDzjoFMj" role="2OqNvi">
                                      <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                                    </node>
                                  </node>
                                  <node concept="liA8E" id="7JdyDzjoHFC" role="2OqNvi">
                                    <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object):boolean" resolve="equals" />
                                    <node concept="Xl_RD" id="7JdyDzjoI_3" role="37wK5m">
                                      <property role="Xl_RC" value="user_1ms_isr_type2" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                            <node concept="Rh6nW" id="7JdyDzjoDay" role="1bW2Oz">
                              <property role="TrG5h" value="it" />
                              <node concept="2jxLKc" id="7JdyDzjoDaz" role="1tU5fm" />
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
      </node>
      <node concept="3clFbJ" id="7JdyDzjn4hj" role="3cqZAp">
        <node concept="3clFbS" id="7JdyDzjn4hl" role="3clFbx">
          <node concept="3clFbJ" id="7JdyDzjo3lG" role="3cqZAp">
            <node concept="3clFbS" id="7JdyDzjo3lI" role="3clFbx">
              <node concept="2MkqsV" id="7JdyDzjpwv_" role="3cqZAp">
                <node concept="Xl_RD" id="7JdyDzjpwwy" role="2MkJ7o">
                  <property role="Xl_RC" value="No module contains any user_1ms_isr_type2 OSEK hook and Generation does not work properly yet." />
                </node>
                <node concept="1YBJjd" id="7JdyDzjpwA4" role="2OEOjV">
                  <ref role="1YBMHb" node="4EZxVF6oUP7" resolve="osekExecutable" />
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="7JdyDzjo4e0" role="3clFbw">
              <node concept="2OqwBi" id="7JdyDzjo3uu" role="2Oq$k0">
                <node concept="1YBJjd" id="7JdyDzjo3pn" role="2Oq$k0">
                  <ref role="1YBMHb" node="4EZxVF6oUP7" resolve="osekExecutable" />
                </node>
                <node concept="2qgKlT" id="7JdyDzjo48g" role="2OqNvi">
                  <ref role="37wK5l" to="7loq:7JdyDzjneDe" resolve="referencedOilFiles" />
                </node>
              </node>
              <node concept="2HwmR7" id="7JdyDzjo4DK" role="2OqNvi">
                <node concept="1bVj0M" id="7JdyDzjo4DM" role="23t8la">
                  <node concept="3clFbS" id="7JdyDzjo4DN" role="1bW5cS">
                    <node concept="3clFbF" id="7JdyDzjo4Jj" role="3cqZAp">
                      <node concept="3eOSWO" id="7JdyDzjo6v5" role="3clFbG">
                        <node concept="3cmrfG" id="7JdyDzjo6v8" role="3uHU7w">
                          <property role="3cmrfH" value="0" />
                        </node>
                        <node concept="2OqwBi" id="7JdyDzjo5E2" role="3uHU7B">
                          <node concept="2OqwBi" id="7JdyDzjo4Ur" role="2Oq$k0">
                            <node concept="37vLTw" id="7JdyDzjo4Ji" role="2Oq$k0">
                              <ref role="3cqZAo" node="7JdyDzjo4DO" resolve="it" />
                            </node>
                            <node concept="2qgKlT" id="7JdyDzjo5_d" role="2OqNvi">
                              <ref role="37wK5l" to="7loq:3WvbRq1Wl$2" resolve="getCounters" />
                            </node>
                          </node>
                          <node concept="34oBXx" id="7JdyDzjo5S1" role="2OqNvi" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="Rh6nW" id="7JdyDzjo4DO" role="1bW2Oz">
                    <property role="TrG5h" value="it" />
                    <node concept="2jxLKc" id="7JdyDzjo4DP" role="1tU5fm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="9aQIb" id="7JdyDzjo7rk" role="9aQIa">
          <node concept="3clFbS" id="7JdyDzjo7rl" role="9aQI4">
            <node concept="2Gpval" id="7JdyDzjpd_s" role="3cqZAp">
              <node concept="2GrKxI" id="7JdyDzjpd_t" role="2Gsz3X">
                <property role="TrG5h" value="user1msIsrType2" />
              </node>
              <node concept="37vLTw" id="7JdyDzjpdAY" role="2GsD0m">
                <ref role="3cqZAo" node="7JdyDzjokAL" resolve="user1msIsrType2s" />
              </node>
              <node concept="3clFbS" id="7JdyDzjpd_v" role="2LFqv$">
                <node concept="3clFbJ" id="7JdyDzjpdBm" role="3cqZAp">
                  <node concept="3fqX7Q" id="7JdyDzjpeyU" role="3clFbw">
                    <node concept="2OqwBi" id="7JdyDzjpeyW" role="3fr31v">
                      <node concept="2GrUjf" id="7JdyDzjpeyX" role="2Oq$k0">
                        <ref role="2Gs0qQ" node="7JdyDzjpd_t" resolve="user1msIsrType2" />
                      </node>
                      <node concept="3TrcHB" id="7JdyDzjpeyY" role="2OqNvi">
                        <ref role="3TsBF5" to="x27k:5Oog2UbP_d2" resolve="preventNameMangling" />
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="7JdyDzjpdBo" role="3clFbx">
                    <node concept="2MkqsV" id="7JdyDzjpeBD" role="3cqZAp">
                      <node concept="Xl_RD" id="7JdyDzjpeBP" role="2MkJ7o">
                        <property role="Xl_RC" value="Enable 'Prevent Name Mangling' for user_1ms_isr_type2" />
                      </node>
                      <node concept="2GrUjf" id="7JdyDzjpeEq" role="2OEOjV">
                        <ref role="2Gs0qQ" node="7JdyDzjpd_t" resolve="user1msIsrType2" />
                      </node>
                      <node concept="2ODE4t" id="7JdyDzjpeG1" role="2OEWyd">
                        <ref role="2ODJFN" to="x27k:5Oog2UbP_d2" resolve="preventNameMangling" />
                      </node>
                      <node concept="3Cnw8n" id="7JdyDzjpG2J" role="2OEOjU">
                        <property role="ARO6o" value="true" />
                        <ref role="QpYPw" node="7JdyDzjpDGI" resolve="togglePreventNameMangling" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbJ" id="7JdyDzjpg86" role="3cqZAp">
                  <node concept="3clFbS" id="7JdyDzjpg88" role="3clFbx">
                    <node concept="2MkqsV" id="7JdyDzjphdC" role="3cqZAp">
                      <node concept="Xl_RD" id="7JdyDzjphdR" role="2MkJ7o">
                        <property role="Xl_RC" value="user_1ms_isr_type2 must be exported" />
                      </node>
                      <node concept="2GrUjf" id="7JdyDzjpheG" role="2OEOjV">
                        <ref role="2Gs0qQ" node="7JdyDzjpd_t" resolve="user1msIsrType2" />
                      </node>
                      <node concept="2ODE4t" id="7JdyDzjphj$" role="2OEWyd">
                        <ref role="2ODJFN" to="x27k:19a6$uAA0vK" resolve="exported" />
                      </node>
                      <node concept="3Cnw8n" id="7JdyDzjpDx9" role="2OEOjU">
                        <property role="ARO6o" value="true" />
                        <ref role="QpYPw" node="7JdyDzjpAnV" resolve="toggleExport" />
                      </node>
                    </node>
                  </node>
                  <node concept="3fqX7Q" id="7JdyDzjpg8v" role="3clFbw">
                    <node concept="2OqwBi" id="7JdyDzjpgsB" role="3fr31v">
                      <node concept="2GrUjf" id="7JdyDzjpg8J" role="2Oq$k0">
                        <ref role="2Gs0qQ" node="7JdyDzjpd_t" resolve="user1msIsrType2" />
                      </node>
                      <node concept="3TrcHB" id="7JdyDzjph7q" role="2OqNvi">
                        <ref role="3TsBF5" to="x27k:19a6$uAA0vK" resolve="exported" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbC" id="7JdyDzjpcOT" role="3clFbw">
          <node concept="3cmrfG" id="7JdyDzjpdzq" role="3uHU7w">
            <property role="3cmrfH" value="0" />
          </node>
          <node concept="2OqwBi" id="7JdyDzjoWWg" role="3uHU7B">
            <node concept="37vLTw" id="7JdyDzjoTct" role="2Oq$k0">
              <ref role="3cqZAo" node="7JdyDzjokAL" resolve="user1msIsrType2s" />
            </node>
            <node concept="34oBXx" id="7JdyDzjp7BO" role="2OqNvi" />
          </node>
        </node>
      </node>
      <node concept="3clFbH" id="1Bd1FdQVsyB" role="3cqZAp" />
      <node concept="3SKdUt" id="1Bd1FdQVu4J" role="3cqZAp">
        <node concept="3SKdUq" id="1Bd1FdQVu4L" role="3SKWNk">
          <property role="3SKdUp" value="check for unique EventMasks" />
        </node>
      </node>
      <node concept="3SKdUt" id="1Bd1FdR3Wni" role="3cqZAp">
        <node concept="3SKdUq" id="1Bd1FdR3Wnk" role="3SKWNk">
          <property role="3SKdUp" value="TODO: funktioniert leider nicht wie gewünscht" />
        </node>
      </node>
      <node concept="3cpWs8" id="1Bd1FdQVuQc" role="3cqZAp">
        <node concept="3cpWsn" id="1Bd1FdQVuQf" role="3cpWs9">
          <property role="TrG5h" value="eventMasks" />
          <node concept="2I9FWS" id="1Bd1FdQVuQa" role="1tU5fm">
            <ref role="2I9WkF" to="mj1l:7FQByU3CrCM" resolve="Expression" />
          </node>
          <node concept="2ShNRf" id="1Bd1FdQVvfl" role="33vP2m">
            <node concept="2T8Vx0" id="1Bd1FdQVvfj" role="2ShVmc">
              <node concept="2I9FWS" id="1Bd1FdQVvfk" role="2T96Bj">
                <ref role="2I9WkF" to="mj1l:7FQByU3CrCM" resolve="Expression" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2Gpval" id="1Bd1FdQVvCl" role="3cqZAp">
        <node concept="2GrKxI" id="1Bd1FdQVvCn" role="2Gsz3X">
          <property role="TrG5h" value="oilFile" />
        </node>
        <node concept="2OqwBi" id="1Bd1FdQVw6X" role="2GsD0m">
          <node concept="1YBJjd" id="1Bd1FdQVw1E" role="2Oq$k0">
            <ref role="1YBMHb" node="4EZxVF6oUP7" resolve="osekExecutable" />
          </node>
          <node concept="2qgKlT" id="1Bd1FdQVwCe" role="2OqNvi">
            <ref role="37wK5l" to="7loq:7JdyDzjneDe" resolve="referencedOilFiles" />
          </node>
        </node>
        <node concept="3clFbS" id="1Bd1FdQVvCr" role="2LFqv$">
          <node concept="3clFbF" id="1Bd1FdR1_8L" role="3cqZAp">
            <node concept="2OqwBi" id="1Bd1FdR1_S5" role="3clFbG">
              <node concept="37vLTw" id="1Bd1FdR1_8K" role="2Oq$k0">
                <ref role="3cqZAo" node="1Bd1FdQVuQf" resolve="eventMasks" />
              </node>
              <node concept="X8dFx" id="1Bd1FdR1Cpv" role="2OqNvi">
                <node concept="2OqwBi" id="1Bd1FdR1Kv1" role="25WWJ7">
                  <node concept="2OqwBi" id="1Bd1FdR1HbR" role="2Oq$k0">
                    <node concept="2OqwBi" id="1Bd1FdR1DM7" role="2Oq$k0">
                      <node concept="2GrUjf" id="1Bd1FdR1D1g" role="2Oq$k0">
                        <ref role="2Gs0qQ" node="1Bd1FdQVvCn" resolve="oilFile" />
                      </node>
                      <node concept="3TrEf2" id="1Bd1FdR1Fy3" role="2OqNvi">
                        <ref role="3Tt5mk" to="bwbq:7FCpXS_VYUZ" />
                      </node>
                    </node>
                    <node concept="3Tsc0h" id="1Bd1FdR1Ibj" role="2OqNvi">
                      <ref role="3TtcxE" to="bwbq:62xxBiE6sz5" />
                    </node>
                  </node>
                  <node concept="13MTOL" id="1Bd1FdR1O$w" role="2OqNvi">
                    <ref role="13MTZf" to="x27k:2VsHNE717Q8" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2Gpval" id="1Bd1FdQWGox" role="3cqZAp">
        <node concept="2GrKxI" id="1Bd1FdQWGoz" role="2Gsz3X">
          <property role="TrG5h" value="eventMask" />
        </node>
        <node concept="37vLTw" id="1Bd1FdR3yWE" role="2GsD0m">
          <ref role="3cqZAo" node="1Bd1FdQVuQf" resolve="eventMasks" />
        </node>
        <node concept="3clFbS" id="1Bd1FdQWGoB" role="2LFqv$">
          <node concept="3clFbF" id="1Bd1FdQWMHT" role="3cqZAp">
            <node concept="2OqwBi" id="1Bd1FdQWNja" role="3clFbG">
              <node concept="37vLTw" id="1Bd1FdQWMHR" role="2Oq$k0">
                <ref role="3cqZAo" node="1Bd1FdQVuQf" resolve="eventMasks" />
              </node>
              <node concept="3dhRuq" id="1Bd1FdQWQa0" role="2OqNvi">
                <node concept="2GrUjf" id="1Bd1FdQWRu4" role="25WWJ7">
                  <ref role="2Gs0qQ" node="1Bd1FdQWGoz" resolve="eventMask" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbJ" id="1Bd1FdQWGNq" role="3cqZAp">
            <node concept="3fqX7Q" id="1Bd1FdR30aP" role="3clFbw">
              <node concept="2OqwBi" id="1Bd1FdR30aR" role="3fr31v">
                <node concept="37vLTw" id="1Bd1FdR30aS" role="2Oq$k0">
                  <ref role="3cqZAo" node="1Bd1FdQVuQf" resolve="eventMasks" />
                </node>
                <node concept="2HwmR7" id="1Bd1FdR30aT" role="2OqNvi">
                  <node concept="1bVj0M" id="1Bd1FdR30aU" role="23t8la">
                    <node concept="3clFbS" id="1Bd1FdR30aV" role="1bW5cS">
                      <node concept="3clFbF" id="1Bd1FdR30aW" role="3cqZAp">
                        <node concept="3clFbC" id="1Bd1FdR3_DX" role="3clFbG">
                          <node concept="2OqwBi" id="1Bd1FdR3B0Y" role="3uHU7w">
                            <node concept="2GrUjf" id="1Bd1FdR3Axx" role="2Oq$k0">
                              <ref role="2Gs0qQ" node="1Bd1FdQWGoz" resolve="eventMask" />
                            </node>
                            <node concept="2qgKlT" id="1Bd1FdR3CcI" role="2OqNvi">
                              <ref role="37wK5l" to="ywuz:6OxpEKG0KPv" resolve="evaluateStatically" />
                            </node>
                          </node>
                          <node concept="2OqwBi" id="1Bd1FdR30aY" role="3uHU7B">
                            <node concept="37vLTw" id="1Bd1FdR30aZ" role="2Oq$k0">
                              <ref role="3cqZAo" node="1Bd1FdR30b5" resolve="it" />
                            </node>
                            <node concept="2qgKlT" id="1Bd1FdR30b0" role="2OqNvi">
                              <ref role="37wK5l" to="ywuz:6OxpEKG0KPv" resolve="evaluateStatically" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="Rh6nW" id="1Bd1FdR30b5" role="1bW2Oz">
                      <property role="TrG5h" value="it" />
                      <node concept="2jxLKc" id="1Bd1FdR30b6" role="1tU5fm" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbS" id="1Bd1FdQWGNs" role="3clFbx">
              <node concept="2MkqsV" id="1Bd1FdQX4Ws" role="3cqZAp">
                <node concept="Xl_RD" id="1Bd1FdQX4WC" role="2MkJ7o">
                  <property role="Xl_RC" value="EventMasks must be unique." />
                </node>
                <node concept="2GrUjf" id="1Bd1FdQX4X8" role="2OEOjV">
                  <ref role="2Gs0qQ" node="1Bd1FdQWGoz" resolve="eventMask" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4EZxVF6oUP7" role="1YuTPh">
      <property role="TrG5h" value="osekExecutable" />
      <ref role="1YaFvo" to="bwbq:4EZxVF6o_1Q" resolve="OsekExecutable" />
    </node>
  </node>
  <node concept="1YbPZF" id="6g77ZYUpPGv">
    <property role="TrG5h" value="typeof_ResourceDeclaration" />
    <property role="3GE5qa" value="Resource" />
    <node concept="3clFbS" id="6g77ZYUpPGw" role="18ibNy">
      <node concept="1ZobV4" id="6g77ZYUpPGA" role="3cqZAp">
        <node concept="mw_s8" id="6g77ZYUpQNq" role="1ZfhKB">
          <node concept="1Z2H0r" id="6g77ZYUpQU5" role="mwGJk">
            <node concept="2ShNRf" id="6g77ZYUpQUl" role="1Z2MuG">
              <node concept="3zrR0B" id="6g77ZYUpR0B" role="2ShVmc">
                <node concept="3Tqbb2" id="6g77ZYUpR0D" role="3zrR0E">
                  <ref role="ehGHo" to="bwbq:6g77ZYUpzdT" resolve="IResource" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6g77ZYUpPGK" role="1ZfhK$">
          <node concept="1Z2H0r" id="6g77ZYUpPGG" role="mwGJk">
            <node concept="2OqwBi" id="6g77ZYUpPPz" role="1Z2MuG">
              <node concept="1YBJjd" id="6g77ZYUpPHC" role="2Oq$k0">
                <ref role="1YBMHb" node="6g77ZYUpPGy" resolve="resourceDeclaration" />
              </node>
              <node concept="3TrEf2" id="6g77ZYUpQKI" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6g77ZYUpPGy" role="1YuTPh">
      <property role="TrG5h" value="resourceDeclaration" />
      <ref role="1YaFvo" to="bwbq:6g77ZYUpC8T" resolve="ResourceDeclaration" />
    </node>
    <node concept="2ABs$o" id="6g77ZYUpPH1" role="3K5x9m">
      <property role="2bfB8j" value="true" />
      <property role="TrG5h" value="res" />
      <node concept="3Tm1VV" id="6g77ZYUpPH3" role="1B3o_S" />
    </node>
  </node>
  <node concept="1YbPZF" id="6g77ZYUpTaF">
    <property role="TrG5h" value="typeof_ResourceRef" />
    <property role="3GE5qa" value="Resource" />
    <node concept="3clFbS" id="6g77ZYUpTaG" role="18ibNy">
      <node concept="1ZobV4" id="6g77ZYUpTaM" role="3cqZAp">
        <node concept="mw_s8" id="6g77ZYUpTMB" role="1ZfhKB">
          <node concept="1Z2H0r" id="6g77ZYUpTMz" role="mwGJk">
            <node concept="2ShNRf" id="6g77ZYUpTMS" role="1Z2MuG">
              <node concept="3zrR0B" id="6g77ZYUpTTa" role="2ShVmc">
                <node concept="3Tqbb2" id="6g77ZYUpTTc" role="3zrR0E">
                  <ref role="ehGHo" to="bwbq:6g77ZYUpzdT" resolve="IResource" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6g77ZYUpTaW" role="1ZfhK$">
          <node concept="1Z2H0r" id="6g77ZYUpTaS" role="mwGJk">
            <node concept="2OqwBi" id="6g77ZYUpTfD" role="1Z2MuG">
              <node concept="1YBJjd" id="6g77ZYUpTbd" role="2Oq$k0">
                <ref role="1YBMHb" node="6g77ZYUpTaI" resolve="resourceRef" />
              </node>
              <node concept="3TrEf2" id="58wCuMl1VJz" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:58wCuMl1UJ2" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6g77ZYUpTaI" role="1YuTPh">
      <property role="TrG5h" value="resourceRef" />
      <ref role="1YaFvo" to="bwbq:1x4fgD956dR" resolve="ResourceRef" />
    </node>
  </node>
  <node concept="1YbPZF" id="4ENJhDtdAXw">
    <property role="TrG5h" value="typeof_Task" />
    <property role="3GE5qa" value="Task" />
    <node concept="3clFbS" id="4ENJhDtdAXx" role="18ibNy">
      <node concept="1ZobV4" id="58wCuMkZK_7" role="3cqZAp">
        <node concept="mw_s8" id="58wCuMkZLic" role="1ZfhKB">
          <node concept="2ShNRf" id="58wCuMkZLi8" role="mwGJk">
            <node concept="3zrR0B" id="58wCuMkZMny" role="2ShVmc">
              <node concept="3Tqbb2" id="58wCuMkZMn$" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="58wCuMkZK__" role="1ZfhK$">
          <node concept="1Z2H0r" id="58wCuMkZK_x" role="mwGJk">
            <node concept="2OqwBi" id="58wCuMkZKGv" role="1Z2MuG">
              <node concept="1YBJjd" id="58wCuMkZK_Q" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdAXz" resolve="task" />
              </node>
              <node concept="3TrEf2" id="58wCuMkZLfk" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:58wCuMkZKxs" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtdAXz" role="1YuTPh">
      <property role="TrG5h" value="task" />
      <ref role="1YaFvo" to="bwbq:1x4fgD956cc" resolve="Task" />
    </node>
  </node>
  <node concept="1YbPZF" id="4ENJhDtdA24">
    <property role="TrG5h" value="typeof_AlarmAutostart" />
    <property role="3GE5qa" value="Timer" />
    <node concept="3clFbS" id="4ENJhDtdA25" role="18ibNy">
      <node concept="1ZobV4" id="4ENJhDtdAg0" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtdAhJ" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtdAhF" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdAnu" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdAnw" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtdAg3" role="1ZfhK$">
          <node concept="1Z2H0r" id="3tDp_yW621W" role="mwGJk">
            <node concept="2OqwBi" id="3tDp_yW624G" role="1Z2MuG">
              <node concept="1YBJjd" id="3tDp_yW621X" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdA27" resolve="alarmAutostart" />
              </node>
              <node concept="3TrEf2" id="3tDp_yW62b7" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPA" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="4ENJhDtdAo6" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtdAwc" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtdAw8" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdA_V" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdA_X" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtdAon" role="1ZfhK$">
          <node concept="1Z2H0r" id="3tDp_yW62mJ" role="mwGJk">
            <node concept="2OqwBi" id="3tDp_yW62p_" role="1Z2MuG">
              <node concept="1YBJjd" id="3tDp_yW62mK" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdA27" resolve="alarmAutostart" />
              </node>
              <node concept="3TrEf2" id="3tDp_yW62w6" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPC" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtdA27" role="1YuTPh">
      <property role="TrG5h" value="alarmAutostart" />
      <ref role="1YaFvo" to="bwbq:7FCpXS_WSTn" resolve="AlarmAutostart" />
    </node>
  </node>
  <node concept="1YbPZF" id="4ENJhDtcXsb">
    <property role="TrG5h" value="typeof_Counter" />
    <property role="3GE5qa" value="Timer" />
    <node concept="3clFbS" id="4ENJhDtcXsc" role="18ibNy">
      <node concept="1ZobV4" id="4ENJhDtcY3g" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtcY3C" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtcY3$" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtcZ2O" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtcZ2Q" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtcY3j" role="1ZfhK$">
          <node concept="1Z2H0r" id="4ENJhDtcXsl" role="mwGJk">
            <node concept="2OqwBi" id="4ENJhDtcXNJ" role="1Z2MuG">
              <node concept="1YBJjd" id="4ENJhDtcXLZ" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtcXse" resolve="counter" />
              </node>
              <node concept="3TrEf2" id="4ENJhDtcXUT" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPc" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="4ENJhDtd_MW" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtd_VM" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtd_VI" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdA1x" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdA1z" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtd_Nq" role="1ZfhK$">
          <node concept="1Z2H0r" id="4ENJhDtd_Nm" role="mwGJk">
            <node concept="2OqwBi" id="4ENJhDtd_Pu" role="1Z2MuG">
              <node concept="1YBJjd" id="4ENJhDtd_NF" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtcXse" resolve="counter" />
              </node>
              <node concept="3TrEf2" id="4ENJhDtd_Ul" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPv" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1ZobV4" id="4ENJhDtd_yG" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtd_EU" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtd_EQ" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtd_KD" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtd_KF" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtd_z0" role="1ZfhK$">
          <node concept="1Z2H0r" id="4ENJhDtd_yW" role="mwGJk">
            <node concept="2OqwBi" id="4ENJhDtd__4" role="1Z2MuG">
              <node concept="1YBJjd" id="4ENJhDtd_zh" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtcXse" resolve="counter" />
              </node>
              <node concept="3TrEf2" id="4ENJhDtd_DG" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPy" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtcXse" role="1YuTPh">
      <property role="TrG5h" value="counter" />
      <ref role="1YaFvo" to="bwbq:5KtH1a6jX_3" resolve="CounterLiteral" />
    </node>
  </node>
  <node concept="1YbPZF" id="7ZTJPb1S2CG">
    <property role="TrG5h" value="typeof_COM" />
    <property role="3GE5qa" value="COM" />
    <node concept="3clFbS" id="7ZTJPb1S2CH" role="18ibNy">
      <node concept="1ZobV4" id="7ZTJPb1S2L7" role="3cqZAp">
        <node concept="mw_s8" id="7ZTJPb1S2Vx" role="1ZfhKB">
          <node concept="2ShNRf" id="7ZTJPb1S2Vt" role="mwGJk">
            <node concept="3zrR0B" id="7ZTJPb1S3VP" role="2ShVmc">
              <node concept="3Tqbb2" id="7ZTJPb1S3VR" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:477NaqBEMuv" resolve="FloatType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="7ZTJPb1S2Lh" role="1ZfhK$">
          <node concept="1Z2H0r" id="7ZTJPb1S2Ld" role="mwGJk">
            <node concept="2OqwBi" id="7ZTJPb1S2Nl" role="1Z2MuG">
              <node concept="1YBJjd" id="7ZTJPb1S2Ly" role="2Oq$k0">
                <ref role="1YBMHb" node="7ZTJPb1S2CJ" resolve="com" />
              </node>
              <node concept="3TrEf2" id="7ZTJPb1S2Uy" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:7ZTJPb1S2Cz" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="7ZTJPb1S2CJ" role="1YuTPh">
      <property role="TrG5h" value="com" />
      <ref role="1YaFvo" to="bwbq:1x4fgD956o9" resolve="COM" />
    </node>
  </node>
  <node concept="3qnSWH" id="62ww4MHp_Do">
    <property role="TrG5h" value="substituteType_EventMaskType" />
    <property role="3GE5qa" value="Event" />
    <node concept="3clFbS" id="62ww4MHp_Dq" role="3hT0BD">
      <node concept="3cpWs6" id="62ww4MHp_Dv" role="3cqZAp">
        <node concept="2ShNRf" id="62ww4MHp_DE" role="3cqZAk">
          <node concept="3zrR0B" id="62ww4MHp_Jq" role="2ShVmc">
            <node concept="3Tqbb2" id="62ww4MHp_Js" role="3zrR0E">
              <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="62ww4MHp_Dr" role="1YuTPh">
      <property role="TrG5h" value="eventMaskType" />
      <ref role="1YaFvo" to="bwbq:1JmJJmp3CpZ" resolve="EventMaskType" />
    </node>
  </node>
  <node concept="2sgARr" id="1Y5JHpRy20E">
    <property role="TrG5h" value="subtyping_ResourceType" />
    <property role="3GE5qa" value="Resource" />
    <node concept="3clFbS" id="1Y5JHpRy20F" role="2sgrp5">
      <node concept="3clFbF" id="1Y5JHpRy20N" role="3cqZAp">
        <node concept="2ShNRf" id="1Y5JHpRy20L" role="3clFbG">
          <node concept="3zrR0B" id="1Y5JHpRy26E" role="2ShVmc">
            <node concept="3Tqbb2" id="1Y5JHpRy26G" role="3zrR0E">
              <ref role="ehGHo" to="mj1l:7lNBHBNBzyt" resolve="UnsignedInt8tType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1Y5JHpRy20H" role="1YuTPh">
      <property role="TrG5h" value="resourceType" />
      <ref role="1YaFvo" to="bwbq:v5qeus8Gck" resolve="ResourceType" />
    </node>
  </node>
  <node concept="2sgARr" id="1Y5JHpRyzdZ">
    <property role="TrG5h" value="subtyping_TaskType" />
    <property role="3GE5qa" value="Task" />
    <node concept="3clFbS" id="1Y5JHpRyze0" role="2sgrp5">
      <node concept="3clFbF" id="1Y5JHpRyzeo" role="3cqZAp">
        <node concept="2ShNRf" id="1Y5JHpRyzem" role="3clFbG">
          <node concept="3zrR0B" id="1Y5JHpRyzkf" role="2ShVmc">
            <node concept="3Tqbb2" id="1Y5JHpRyzkh" role="3zrR0E">
              <ref role="ehGHo" to="mj1l:7lNBHBNB4PU" resolve="UnsignedIntType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="1Y5JHpRyze2" role="1YuTPh">
      <property role="TrG5h" value="taskType" />
      <ref role="1YaFvo" to="bwbq:1Y5JHpRyzdS" resolve="TaskType" />
    </node>
  </node>
  <node concept="1YbPZF" id="2CJ7vlDPYg3">
    <property role="TrG5h" value="typeof_EventDeclaration" />
    <property role="3GE5qa" value="Event" />
    <node concept="3clFbS" id="2CJ7vlDPYg4" role="18ibNy">
      <node concept="1ZobV4" id="2CJ7vlDPYk4" role="3cqZAp">
        <node concept="mw_s8" id="2CJ7vlDPZ6j" role="1ZfhKB">
          <node concept="1Z2H0r" id="2CJ7vlDPZ6f" role="mwGJk">
            <node concept="2ShNRf" id="2CJ7vlDQ0ch" role="1Z2MuG">
              <node concept="3zrR0B" id="2CJ7vlDQ0oR" role="2ShVmc">
                <node concept="3Tqbb2" id="2CJ7vlDQ0oT" role="3zrR0E">
                  <ref role="ehGHo" to="bwbq:1x4fgD956iF" resolve="EventLiteral" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="2CJ7vlDPYke" role="1ZfhK$">
          <node concept="1Z2H0r" id="2CJ7vlDPYka" role="mwGJk">
            <node concept="2OqwBi" id="2CJ7vlDPYsk" role="1Z2MuG">
              <node concept="1YBJjd" id="2CJ7vlDPYkv" role="2Oq$k0">
                <ref role="1YBMHb" node="2CJ7vlDPYg6" resolve="eventDeclaration" />
              </node>
              <node concept="3TrEf2" id="2CJ7vlDPZ3V" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="2CJ7vlDPYg6" role="1YuTPh">
      <property role="TrG5h" value="eventDeclaration" />
      <ref role="1YaFvo" to="bwbq:4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
  </node>
  <node concept="1YbPZF" id="3WvbRq1R7$v">
    <property role="TrG5h" value="typeof_CounterDeclaration" />
    <property role="3GE5qa" value="Timer" />
    <node concept="3clFbS" id="3WvbRq1R7$w" role="18ibNy">
      <node concept="1ZobV4" id="3WvbRq1R7BE" role="3cqZAp">
        <node concept="mw_s8" id="3WvbRq1R7BO" role="1ZfhK$">
          <node concept="1Z2H0r" id="3WvbRq1R7BK" role="mwGJk">
            <node concept="2OqwBi" id="3WvbRq1R7JY" role="1Z2MuG">
              <node concept="1YBJjd" id="3WvbRq1R7C5" role="2Oq$k0">
                <ref role="1YBMHb" node="3WvbRq1R7$y" resolve="counterDeclaration" />
              </node>
              <node concept="3TrEf2" id="3WvbRq1R8n_" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="3WvbRq1R8s4" role="1ZfhKB">
          <node concept="1Z2H0r" id="3WvbRq1R8s0" role="mwGJk">
            <node concept="2ShNRf" id="3WvbRq1R8sl" role="1Z2MuG">
              <node concept="3zrR0B" id="3WvbRq1R9xO" role="2ShVmc">
                <node concept="3Tqbb2" id="3WvbRq1R9xQ" role="3zrR0E">
                  <ref role="ehGHo" to="bwbq:5KtH1a6jX_3" resolve="CounterLiteral" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="3WvbRq1R7$y" role="1YuTPh">
      <property role="TrG5h" value="counterDeclaration" />
      <ref role="1YaFvo" to="bwbq:3WvbRq1R3ja" resolve="CounterDeclaration" />
    </node>
  </node>
  <node concept="Q5z_Y" id="7JdyDzjpAnV">
    <property role="TrG5h" value="toggleExport" />
    <node concept="Q5ZZ6" id="7JdyDzjpAnW" role="Q6x$H">
      <node concept="3clFbS" id="7JdyDzjpAnX" role="2VODD2">
        <node concept="3clFbF" id="7JdyDzjpAsS" role="3cqZAp">
          <node concept="37vLTI" id="7JdyDzjpCEW" role="3clFbG">
            <node concept="3clFbT" id="7JdyDzjpCKW" role="37vLTx">
              <property role="3clFbU" value="true" />
            </node>
            <node concept="2OqwBi" id="7JdyDzjpAKJ" role="37vLTJ">
              <node concept="1PxgMI" id="7JdyDzjpAx0" role="2Oq$k0">
                <ref role="1PxNhF" to="x27k:5_l8w1EmTvx" resolve="Function" />
                <node concept="Q6c8r" id="7JdyDzjpAsR" role="1PxMeX" />
              </node>
              <node concept="3TrcHB" id="7JdyDzjpC1x" role="2OqNvi">
                <ref role="3TsBF5" to="x27k:19a6$uAA0vK" resolve="exported" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="QznSV" id="7JdyDzjpOAw" role="QzAvj">
      <node concept="3clFbS" id="7JdyDzjpOAx" role="2VODD2">
        <node concept="3clFbF" id="7JdyDzjpOBE" role="3cqZAp">
          <node concept="Xl_RD" id="7JdyDzjpOBD" role="3clFbG">
            <property role="Xl_RC" value="Toggle Export" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="Q5z_Y" id="7JdyDzjpDGI">
    <property role="TrG5h" value="togglePreventNameMangling" />
    <node concept="Q5ZZ6" id="7JdyDzjpDGJ" role="Q6x$H">
      <node concept="3clFbS" id="7JdyDzjpDGK" role="2VODD2">
        <node concept="3clFbF" id="7JdyDzjpDGW" role="3cqZAp">
          <node concept="37vLTI" id="7JdyDzjpFWj" role="3clFbG">
            <node concept="3clFbT" id="7JdyDzjpFYc" role="37vLTx">
              <property role="3clFbU" value="true" />
            </node>
            <node concept="2OqwBi" id="7JdyDzjpDXT" role="37vLTJ">
              <node concept="1PxgMI" id="7JdyDzjpDI3" role="2Oq$k0">
                <ref role="1PxNhF" to="x27k:5_l8w1EmTvx" resolve="Function" />
                <node concept="Q6c8r" id="7JdyDzjpDGV" role="1PxMeX" />
              </node>
              <node concept="3TrcHB" id="7JdyDzjpFeL" role="2OqNvi">
                <ref role="3TsBF5" to="x27k:5Oog2UbP_d2" resolve="preventNameMangling" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="QznSV" id="7JdyDzjpOQQ" role="QzAvj">
      <node concept="3clFbS" id="7JdyDzjpOQR" role="2VODD2">
        <node concept="3clFbF" id="7JdyDzjpOS0" role="3cqZAp">
          <node concept="Xl_RD" id="7JdyDzjpORZ" role="3clFbG">
            <property role="Xl_RC" value="Toggle Prevent Name Mangling" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1YbPZF" id="5wLhgGNO1Yp">
    <property role="TrG5h" value="typeof_EventLiteral" />
    <property role="3GE5qa" value="Event" />
    <node concept="3clFbS" id="5wLhgGNO1Yq" role="18ibNy">
      <node concept="1ZobV4" id="5wLhgGNO218" role="3cqZAp">
        <node concept="mw_s8" id="5wLhgGNO21s" role="1ZfhKB">
          <node concept="2ShNRf" id="5wLhgGNO21o" role="mwGJk">
            <node concept="3zrR0B" id="5wLhgGNO36O" role="2ShVmc">
              <node concept="3Tqbb2" id="5wLhgGNO36Q" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyi" resolve="UnsignedInt32tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="5wLhgGNO21b" role="1ZfhK$">
          <node concept="1Z2H0r" id="5wLhgGNO1Yw" role="mwGJk">
            <node concept="1YBJjd" id="5wLhgGNO1YW" role="1Z2MuG">
              <ref role="1YBMHb" node="5wLhgGNO1Ys" resolve="eventLiteral" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="5wLhgGNO1Ys" role="1YuTPh">
      <property role="TrG5h" value="eventLiteral" />
      <ref role="1YaFvo" to="bwbq:1x4fgD956iF" resolve="EventLiteral" />
    </node>
  </node>
</model>

