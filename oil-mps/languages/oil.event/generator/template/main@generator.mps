<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:101ae93e-7904-4ccd-8526-bd8e47ec7d2f(oil.event.generator.template.main@generator)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures" version="0" />
    <use id="63650c59-16c8-498a-99c8-005c7ee9515d" name="jetbrains.mps.lang.access" version="0" />
    <use id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core" version="1" />
    <use id="61c69711-ed61-4850-81d9-7714ff227fb0" name="com.mbeddr.core.expressions" version="3" />
    <use id="a9d69647-0840-491e-bf39-2eb0805d2011" name="com.mbeddr.core.statements" version="1" />
    <use id="d4280a54-f6df-4383-aa41-d1b2bffa7eb1" name="com.mbeddr.core.base" version="3" />
    <use id="9ded098b-ad6a-4657-bfd9-48636cfe8bc3" name="jetbrains.mps.lang.traceable" version="0" />
    <use id="223dd778-c44f-4ef3-9535-7aa7d12244a6" name="com.mbeddr.core.debug" version="0" />
    <use id="c1c2a88a-323c-4605-a37d-9ab77a2ccbd2" name="com.mbeddr.mpsutil.suppresswarning" version="0" />
    <use id="efda956e-491e-4f00-ba14-36af2f213ecf" name="com.mbeddr.core.udt" version="1" />
    <use id="92d2ea16-5a42-4fdf-a676-c7604efe3504" name="de.slisson.mps.richtext" version="0" />
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="1" />
    <use id="ed6d7656-532c-4bc2-81d1-af945aeb8280" name="jetbrains.mps.baseLanguage.blTypes" version="0" />
    <use id="d7706f63-9be2-479c-a3da-ae92af1e64d5" name="jetbrains.mps.lang.generator.generationContext" version="0" />
    <use id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator" version="0" />
    <use id="3bf5377a-e904-4ded-9754-5a516023bfaa" name="com.mbeddr.core.pointers" version="0" />
    <use id="3441a607-e35e-4d6e-b985-e96d84ae790d" name="de.whz.osek.primitives" version="0" />
    <use id="6d11763d-483d-4b2b-8efc-09336c1b0001" name="com.mbeddr.core.modules" version="0" />
    <use id="5a14cfb7-f38c-4709-bde5-91507cdad10e" name="oil.event" version="0" />
    <use id="479c7a8c-02f9-43b5-9139-d910cb22f298" name="jetbrains.mps.core.xml" version="0" />
    <use id="a482b416-d0c9-473f-8f67-725ed642b3f3" name="com.mbeddr.mpsutil.breadcrumb" version="0" />
    <use id="d09a16fb-1d68-4a92-a5a4-20b4b2f86a62" name="com.mbeddr.mpsutil.jung" version="0" />
    <use id="b4d28e19-7d2d-47e9-943e-3a41f97a0e52" name="com.mbeddr.mpsutil.plantuml.node" version="0" />
    <use id="63e0e566-5131-447e-90e3-12ea330e1a00" name="com.mbeddr.mpsutil.blutil" version="1" />
    <use id="760a0a8c-eabb-4521-8bfd-65db761a9ba3" name="jetbrains.mps.baseLanguage.logging" version="0" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <use id="13744753-c81f-424a-9c1b-cf8943bf4e86" name="jetbrains.mps.lang.sharedConcepts" version="0" />
    <use id="93ee8f9b-79ea-488f-91af-997abb3f8200" name="oil.task" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="8uvm" ref="r:101ae93e-7904-4ccd-8526-bd8e47ec7d2f(oil.event.generator.template.main@generator)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="mle0" ref="r:8664625f-e528-4bef-85fe-ee87292976ff(de.whz.osek.primitives.structure)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="rx5q" ref="r:8e560f65-464b-43d8-97bf-faadc37f178e(oil.event.structure)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="13744753-c81f-424a-9c1b-cf8943bf4e86" name="jetbrains.mps.lang.sharedConcepts">
      <concept id="1161622665029" name="jetbrains.mps.lang.sharedConcepts.structure.ConceptFunctionParameter_model" flags="nn" index="1Q6Npb" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
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
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
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
      <concept id="1144226303539" name="jetbrains.mps.baseLanguage.structure.ForeachStatement" flags="nn" index="1DcWWT">
        <child id="1144226360166" name="iterable" index="1DdaDG" />
      </concept>
      <concept id="1144230876926" name="jetbrains.mps.baseLanguage.structure.AbstractForStatement" flags="nn" index="1DupvO">
        <child id="1144230900587" name="variable" index="1Duv9x" />
      </concept>
    </language>
    <language id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator">
      <concept id="1095416546421" name="jetbrains.mps.lang.generator.structure.MappingConfiguration" flags="ig" index="bUwia">
        <child id="1195502100749" name="preMappingScript" index="1puA0r" />
      </concept>
      <concept id="1195499912406" name="jetbrains.mps.lang.generator.structure.MappingScript" flags="lg" index="1pmfR0">
        <property id="1195595592106" name="scriptKind" index="1v3f2W" />
        <child id="1195501105008" name="codeBlock" index="1pqMTA" />
      </concept>
      <concept id="1195500722856" name="jetbrains.mps.lang.generator.structure.MappingScript_CodeBlock" flags="in" index="1pplIY" />
      <concept id="1195502151594" name="jetbrains.mps.lang.generator.structure.MappingScriptReference" flags="lg" index="1puMqW">
        <reference id="1195502167610" name="mappingScript" index="1puQsG" />
      </concept>
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1140725362528" name="jetbrains.mps.lang.smodel.structure.Link_SetTargetOperation" flags="nn" index="2oxUTD">
        <child id="1140725362529" name="linkTarget" index="2oxUTC" />
      </concept>
      <concept id="1138661924179" name="jetbrains.mps.lang.smodel.structure.Property_SetOperation" flags="nn" index="tyxLq">
        <child id="1138662048170" name="value" index="tz02z" />
      </concept>
      <concept id="1173122760281" name="jetbrains.mps.lang.smodel.structure.Node_GetAncestorsOperation" flags="nn" index="z$bX8" />
      <concept id="1171323947159" name="jetbrains.mps.lang.smodel.structure.Model_NodesOperation" flags="nn" index="2SmgA7">
        <child id="1758937410080001570" name="conceptArgument" index="1dBWTz" />
      </concept>
      <concept id="1139621453865" name="jetbrains.mps.lang.smodel.structure.Node_IsInstanceOfOperation" flags="nn" index="1mIQ4w">
        <child id="1177027386292" name="conceptArgument" index="cj9EA" />
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
      <concept id="1235566554328" name="jetbrains.mps.baseLanguage.collections.structure.AnyOperation" flags="nn" index="2HwmR7" />
      <concept id="1203518072036" name="jetbrains.mps.baseLanguage.collections.structure.SmartClosureParameterDeclaration" flags="ig" index="Rh6nW" />
      <concept id="1160612413312" name="jetbrains.mps.baseLanguage.collections.structure.AddElementOperation" flags="nn" index="TSZUe" />
      <concept id="1225727723840" name="jetbrains.mps.baseLanguage.collections.structure.FindFirstOperation" flags="nn" index="1z4cxt" />
    </language>
  </registry>
  <node concept="bUwia" id="4B0n6H28ejc">
    <property role="TrG5h" value="addOilDeclarationsToModules" />
    <node concept="1puMqW" id="4B0n6H28ejd" role="1puA0r">
      <ref role="1puQsG" node="4B0n6H28eYe" resolve="addEventDeclarations" />
    </node>
  </node>
  <node concept="1pmfR0" id="4B0n6H28eYe">
    <property role="TrG5h" value="addEventDeclarations" />
    <property role="1v3f2W" value="pre_processing" />
    <node concept="1pplIY" id="4B0n6H28eYf" role="1pqMTA">
      <node concept="3clFbS" id="4B0n6H28eYg" role="2VODD2">
        <node concept="1DcWWT" id="4B0n6H28fcP" role="3cqZAp">
          <node concept="3cpWsn" id="4B0n6H28fcQ" role="1Duv9x">
            <property role="TrG5h" value="eventRef" />
            <node concept="3Tqbb2" id="4B0n6H28fpe" role="1tU5fm">
              <ref role="ehGHo" to="rx5q:4B0n6H27Uy_" resolve="EventImplmentationRef" />
            </node>
          </node>
          <node concept="3clFbS" id="4B0n6H28fcR" role="2LFqv$">
            <node concept="3cpWs8" id="4B0n6H28rME" role="3cqZAp">
              <node concept="3cpWsn" id="4B0n6H28rMH" role="3cpWs9">
                <property role="TrG5h" value="module" />
                <node concept="3Tqbb2" id="4B0n6H28rMD" role="1tU5fm">
                  <ref role="ehGHo" to="x27k:5_l8w1EmTde" resolve="ImplementationModule" />
                </node>
                <node concept="1PxgMI" id="4B0n6H28s1Q" role="33vP2m">
                  <ref role="1PxNhF" to="x27k:5_l8w1EmTde" resolve="ImplementationModule" />
                  <node concept="2OqwBi" id="4B0n6H28pmQ" role="1PxMeX">
                    <node concept="2OqwBi" id="4B0n6H28oM7" role="2Oq$k0">
                      <node concept="37vLTw" id="4B0n6H28oIn" role="2Oq$k0">
                        <ref role="3cqZAo" node="4B0n6H28fcQ" resolve="eventRef" />
                      </node>
                      <node concept="z$bX8" id="4B0n6H28oWq" role="2OqNvi" />
                    </node>
                    <node concept="1z4cxt" id="4B0n6H28q1R" role="2OqNvi">
                      <node concept="1bVj0M" id="4B0n6H28q1T" role="23t8la">
                        <node concept="3clFbS" id="4B0n6H28q1U" role="1bW5cS">
                          <node concept="3clFbF" id="4B0n6H28q3M" role="3cqZAp">
                            <node concept="2OqwBi" id="4B0n6H28qd7" role="3clFbG">
                              <node concept="37vLTw" id="4B0n6H28qaA" role="2Oq$k0">
                                <ref role="3cqZAo" node="4B0n6H28q1V" resolve="it" />
                              </node>
                              <node concept="1mIQ4w" id="4B0n6H28qgs" role="2OqNvi">
                                <node concept="chp4Y" id="4B0n6H28qj0" role="cj9EA">
                                  <ref role="cht4Q" to="x27k:5_l8w1EmTde" resolve="ImplementationModule" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="Rh6nW" id="4B0n6H28q1V" role="1bW2Oz">
                          <property role="TrG5h" value="it" />
                          <node concept="2jxLKc" id="4B0n6H28q1W" role="1tU5fm" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4B0n6H28Rka" role="3cqZAp">
              <node concept="3clFbS" id="4B0n6H28Rkc" role="3clFbx">
                <node concept="3cpWs8" id="4B0n6H28sbq" role="3cqZAp">
                  <node concept="3cpWsn" id="4B0n6H28sbw" role="3cpWs9">
                    <property role="TrG5h" value="eventDec" />
                    <node concept="3Tqbb2" id="4B0n6H28sbV" role="1tU5fm">
                      <ref role="ehGHo" to="x27k:5IYyAOzCrre" resolve="GlobalVariableDeclaration" />
                    </node>
                    <node concept="2ShNRf" id="4B0n6H28ske" role="33vP2m">
                      <node concept="3zrR0B" id="4B0n6H28uq7" role="2ShVmc">
                        <node concept="3Tqbb2" id="4B0n6H28uq9" role="3zrR0E">
                          <ref role="ehGHo" to="x27k:5IYyAOzCrre" resolve="GlobalVariableDeclaration" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="4B0n6H28uqU" role="3cqZAp">
                  <node concept="37vLTI" id="4B0n6H28vVi" role="3clFbG">
                    <node concept="2OqwBi" id="4B0n6H28wNi" role="37vLTx">
                      <node concept="2OqwBi" id="4B0n6H28w3G" role="2Oq$k0">
                        <node concept="37vLTw" id="4B0n6H28vYY" role="2Oq$k0">
                          <ref role="3cqZAo" node="4B0n6H28fcQ" resolve="eventRef" />
                        </node>
                        <node concept="3TrEf2" id="4B0n6H28wrs" role="2OqNvi">
                          <ref role="3Tt5mk" to="rx5q:4B0n6H2834W" />
                        </node>
                      </node>
                      <node concept="3TrcHB" id="4B0n6H28xzz" role="2OqNvi">
                        <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                      </node>
                    </node>
                    <node concept="2OqwBi" id="4B0n6H28u$N" role="37vLTJ">
                      <node concept="37vLTw" id="4B0n6H28uqS" role="2Oq$k0">
                        <ref role="3cqZAo" node="4B0n6H28sbw" resolve="eventDec" />
                      </node>
                      <node concept="3TrcHB" id="4B0n6H28vr1" role="2OqNvi">
                        <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="4B0n6H28xEJ" role="3cqZAp">
                  <node concept="37vLTI" id="4B0n6H28zb7" role="3clFbG">
                    <node concept="3clFbT" id="4B0n6H28zbw" role="37vLTx">
                      <property role="3clFbU" value="true" />
                    </node>
                    <node concept="2OqwBi" id="4B0n6H28xOM" role="37vLTJ">
                      <node concept="37vLTw" id="4B0n6H28xEH" role="2Oq$k0">
                        <ref role="3cqZAo" node="4B0n6H28sbw" resolve="eventDec" />
                      </node>
                      <node concept="3TrcHB" id="4B0n6H28yF0" role="2OqNvi">
                        <ref role="3TsBF5" to="x27k:5Oog2UbPmsL" resolve="extern" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3cpWs8" id="4B0n6H28QmE" role="3cqZAp">
                  <node concept="3cpWsn" id="4B0n6H28QmK" role="3cpWs9">
                    <property role="TrG5h" value="type" />
                    <node concept="3Tqbb2" id="4B0n6H28QnQ" role="1tU5fm">
                      <ref role="ehGHo" to="mle0:1JmJJmp3CpZ" resolve="EventMaskType" />
                    </node>
                    <node concept="2ShNRf" id="4B0n6H28Qoe" role="33vP2m">
                      <node concept="3zrR0B" id="4B0n6H28Qv_" role="2ShVmc">
                        <node concept="3Tqbb2" id="4B0n6H28QvB" role="3zrR0E">
                          <ref role="ehGHo" to="mle0:1JmJJmp3CpZ" resolve="EventMaskType" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="4B0n6H28Qx3" role="3cqZAp">
                  <node concept="2OqwBi" id="4B0n6H294u8" role="3clFbG">
                    <node concept="2OqwBi" id="4B0n6H28Q_7" role="2Oq$k0">
                      <node concept="37vLTw" id="4B0n6H28Qx1" role="2Oq$k0">
                        <ref role="3cqZAo" node="4B0n6H28QmK" resolve="type" />
                      </node>
                      <node concept="3TrcHB" id="4B0n6H28QL$" role="2OqNvi">
                        <ref role="3TsBF5" to="mj1l:2zhwXA$N7QC" resolve="const" />
                      </node>
                    </node>
                    <node concept="tyxLq" id="4B0n6H294$k" role="2OqNvi">
                      <node concept="3clFbT" id="4B0n6H294$A" role="tz02z">
                        <property role="3clFbU" value="true" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="4B0n6H28zfJ" role="3cqZAp">
                  <node concept="2OqwBi" id="4B0n6H28Aqm" role="3clFbG">
                    <node concept="2OqwBi" id="4B0n6H28zpS" role="2Oq$k0">
                      <node concept="37vLTw" id="4B0n6H28zfH" role="2Oq$k0">
                        <ref role="3cqZAo" node="4B0n6H28sbw" resolve="eventDec" />
                      </node>
                      <node concept="3TrEf2" id="4B0n6H28_6d" role="2OqNvi">
                        <ref role="3Tt5mk" to="mj1l:hEaDaGor64" />
                      </node>
                    </node>
                    <node concept="2oxUTD" id="4B0n6H28RhA" role="2OqNvi">
                      <node concept="37vLTw" id="4B0n6H28Ri4" role="2oxUTC">
                        <ref role="3cqZAo" node="4B0n6H28QmK" resolve="type" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbF" id="4B0n6H28CBC" role="3cqZAp">
                  <node concept="2OqwBi" id="4B0n6H28Erd" role="3clFbG">
                    <node concept="2OqwBi" id="4B0n6H28CLP" role="2Oq$k0">
                      <node concept="37vLTw" id="4B0n6H28CBA" role="2Oq$k0">
                        <ref role="3cqZAo" node="4B0n6H28rMH" resolve="module" />
                      </node>
                      <node concept="3Tsc0h" id="4B0n6H28Dc_" role="2OqNvi">
                        <ref role="3TtcxE" to="x27k:5_l8w1EmTdh" />
                      </node>
                    </node>
                    <node concept="TSZUe" id="4B0n6H28HSQ" role="2OqNvi">
                      <node concept="37vLTw" id="4B0n6H28I6C" role="25WWJ7">
                        <ref role="3cqZAo" node="4B0n6H28sbw" resolve="eventDec" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3fqX7Q" id="4B0n6H28YK5" role="3clFbw">
                <node concept="2OqwBi" id="4B0n6H28YK7" role="3fr31v">
                  <node concept="2OqwBi" id="4B0n6H28YK8" role="2Oq$k0">
                    <node concept="37vLTw" id="4B0n6H28YK9" role="2Oq$k0">
                      <ref role="3cqZAo" node="4B0n6H28rMH" resolve="module" />
                    </node>
                    <node concept="3Tsc0h" id="4B0n6H28YKa" role="2OqNvi">
                      <ref role="3TtcxE" to="x27k:5_l8w1EmTdh" />
                    </node>
                  </node>
                  <node concept="2HwmR7" id="4B0n6H28YKb" role="2OqNvi">
                    <node concept="1bVj0M" id="4B0n6H28YKc" role="23t8la">
                      <node concept="3clFbS" id="4B0n6H28YKd" role="1bW5cS">
                        <node concept="3clFbF" id="4B0n6H28YKe" role="3cqZAp">
                          <node concept="2OqwBi" id="4B0n6H28YKf" role="3clFbG">
                            <node concept="2OqwBi" id="4B0n6H28YKg" role="2Oq$k0">
                              <node concept="37vLTw" id="4B0n6H28YKh" role="2Oq$k0">
                                <ref role="3cqZAo" node="4B0n6H28YKp" resolve="it" />
                              </node>
                              <node concept="3TrcHB" id="4B0n6H28YKi" role="2OqNvi">
                                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                              </node>
                            </node>
                            <node concept="liA8E" id="4B0n6H28YKj" role="2OqNvi">
                              <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object):boolean" resolve="equals" />
                              <node concept="2OqwBi" id="4B0n6H28YKk" role="37wK5m">
                                <node concept="2OqwBi" id="4B0n6H28YKl" role="2Oq$k0">
                                  <node concept="37vLTw" id="4B0n6H28YKm" role="2Oq$k0">
                                    <ref role="3cqZAo" node="4B0n6H28fcQ" resolve="eventRef" />
                                  </node>
                                  <node concept="3TrEf2" id="4B0n6H28YKn" role="2OqNvi">
                                    <ref role="3Tt5mk" to="rx5q:4B0n6H2834W" />
                                  </node>
                                </node>
                                <node concept="3TrcHB" id="4B0n6H28Z_W" role="2OqNvi">
                                  <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="Rh6nW" id="4B0n6H28YKp" role="1bW2Oz">
                        <property role="TrG5h" value="it" />
                        <node concept="2jxLKc" id="4B0n6H28YKq" role="1tU5fm" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="4B0n6H28f$N" role="1DdaDG">
            <node concept="2SmgA7" id="4B0n6H28fCW" role="2OqNvi">
              <node concept="chp4Y" id="4B0n6H28fTM" role="1dBWTz">
                <ref role="cht4Q" to="rx5q:4B0n6H27Uy_" resolve="EventImplmentationRef" />
              </node>
            </node>
            <node concept="1Q6Npb" id="4B0n6H28hoY" role="2Oq$k0" />
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

