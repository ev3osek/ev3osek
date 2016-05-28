<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:a31c2933-9bce-4687-829b-738ad264cdda(oil.event.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="rx5q" ref="r:8e560f65-464b-43d8-97bf-faadc37f178e(oil.event.structure)" implicit="true" />
    <import index="mle0" ref="r:8664625f-e528-4bef-85fe-ee87292976ff(de.whz.osek.primitives.structure)" implicit="true" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" implicit="true" />
  </imports>
  <registry>
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
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
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
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1185788614172" name="jetbrains.mps.lang.typesystem.structure.NormalTypeClause" flags="ng" index="mw_s8">
        <child id="1185788644032" name="normalType" index="mwGJk" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="6405009306797516074" name="jetbrains.mps.lang.typesystem.structure.SubstituteTypeRule" flags="ig" index="3qnSWH">
        <child id="7323318266641100480" name="body" index="3hT0BD" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174643105530" name="jetbrains.mps.lang.typesystem.structure.InferenceRule" flags="ig" index="1YbPZF" />
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
  <node concept="1YbPZF" id="4ENJhDtdBDC">
    <property role="TrG5h" value="typeof_EventLiteral" />
    <node concept="3clFbS" id="4ENJhDtdBDD" role="18ibNy">
      <node concept="3cpWs8" id="62ww4MHpBwb" role="3cqZAp">
        <node concept="3cpWsn" id="62ww4MHpBwh" role="3cpWs9">
          <property role="TrG5h" value="et" />
          <node concept="3Tqbb2" id="62ww4MHpBwH" role="1tU5fm">
            <ref role="ehGHo" to="mj1l:7FQByU3CrCU" resolve="BooleanType" />
          </node>
          <node concept="2ShNRf" id="62ww4MHpBx5" role="33vP2m">
            <node concept="3zrR0B" id="62ww4MHpBAU" role="2ShVmc">
              <node concept="3Tqbb2" id="62ww4MHpBAW" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7FQByU3CrCU" resolve="BooleanType" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbF" id="62ww4MHpBBI" role="3cqZAp">
        <node concept="37vLTI" id="62ww4MHpC3I" role="3clFbG">
          <node concept="3clFbT" id="62ww4MHpC47" role="37vLTx">
            <property role="3clFbU" value="true" />
          </node>
          <node concept="2OqwBi" id="62ww4MHpBGd" role="37vLTJ">
            <node concept="37vLTw" id="62ww4MHpBBG" role="2Oq$k0">
              <ref role="3cqZAo" node="62ww4MHpBwh" resolve="et" />
            </node>
            <node concept="3TrcHB" id="62ww4MHpBQC" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$N7QC" resolve="const" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbF" id="62ww4MHpC61" role="3cqZAp">
        <node concept="37vLTI" id="62ww4MHpCx0" role="3clFbG">
          <node concept="3clFbT" id="62ww4MHpCxp" role="37vLTx">
            <property role="3clFbU" value="true" />
          </node>
          <node concept="2OqwBi" id="62ww4MHpCaA" role="37vLTJ">
            <node concept="37vLTw" id="62ww4MHpC5Z" role="2Oq$k0">
              <ref role="3cqZAo" node="62ww4MHpBwh" resolve="et" />
            </node>
            <node concept="3TrcHB" id="62ww4MHpCl1" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$YI0J" resolve="volatile" />
            </node>
          </node>
        </node>
      </node>
      <node concept="1Z5TYs" id="62ww4MHpAUq" role="3cqZAp">
        <node concept="mw_s8" id="62ww4MHpAUT" role="1ZfhKB">
          <node concept="37vLTw" id="62ww4MHpCz2" role="mwGJk">
            <ref role="3cqZAo" node="62ww4MHpBwh" resolve="et" />
          </node>
        </node>
        <node concept="mw_s8" id="62ww4MHpAUt" role="1ZfhK$">
          <node concept="1Z2H0r" id="62ww4MHpASv" role="mwGJk">
            <node concept="1YBJjd" id="62ww4MHpAT8" role="1Z2MuG">
              <ref role="1YBMHb" node="4ENJhDtdBDF" resolve="event" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbH" id="62ww4MHpASi" role="3cqZAp" />
      <node concept="1ZobV4" id="4ENJhDtdBDJ" role="3cqZAp">
        <node concept="mw_s8" id="4ENJhDtdBK9" role="1ZfhKB">
          <node concept="2ShNRf" id="4ENJhDtdBK5" role="mwGJk">
            <node concept="3zrR0B" id="4ENJhDtdBPS" role="2ShVmc">
              <node concept="3Tqbb2" id="4ENJhDtdBPU" role="3zrR0E">
                <ref role="ehGHo" to="mj1l:7lNBHBNBzyo" resolve="UnsignedInt64tType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4ENJhDtdBDR" role="1ZfhK$">
          <node concept="1Z2H0r" id="3tDp_yW61PW" role="mwGJk">
            <node concept="2OqwBi" id="3tDp_yW61SE" role="1Z2MuG">
              <node concept="1YBJjd" id="3tDp_yW61PX" role="2Oq$k0">
                <ref role="1YBMHb" node="4ENJhDtdBDF" resolve="event" />
              </node>
              <node concept="3TrEf2" id="3tDp_yW61WY" role="2OqNvi">
                <ref role="3Tt5mk" to="rx5q:78S7ngm5xPO" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4ENJhDtdBDF" role="1YuTPh">
      <property role="TrG5h" value="event" />
      <ref role="1YaFvo" to="rx5q:1x4fgD956iF" resolve="EventLiteral" />
    </node>
  </node>
  <node concept="1YbPZF" id="4B0n6H25C3v">
    <property role="TrG5h" value="typeof_EventDeclaration" />
    <node concept="3clFbS" id="4B0n6H25C3w" role="18ibNy">
      <node concept="1ZobV4" id="4B0n6H25C3A" role="3cqZAp">
        <node concept="mw_s8" id="4B0n6H25Dg$" role="1ZfhKB">
          <node concept="1Z2H0r" id="4B0n6H25Dgw" role="mwGJk">
            <node concept="2ShNRf" id="4B0n6H25DgP" role="1Z2MuG">
              <node concept="3zrR0B" id="4B0n6H25DmF" role="2ShVmc">
                <node concept="3Tqbb2" id="4B0n6H25DmH" role="3zrR0E">
                  <ref role="ehGHo" to="mle0:1JmJJmp3CpZ" resolve="EventMaskType" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4B0n6H25Cti" role="1ZfhK$">
          <node concept="1Z2H0r" id="4B0n6H25Cte" role="mwGJk">
            <node concept="2OqwBi" id="4B0n6H25C_v" role="1Z2MuG">
              <node concept="1YBJjd" id="4B0n6H25Ctz" role="2Oq$k0">
                <ref role="1YBMHb" node="4B0n6H25C3y" resolve="eventDeclaration" />
              </node>
              <node concept="3TrEf2" id="4B0n6H25Dd6" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4B0n6H25C3y" role="1YuTPh">
      <property role="TrG5h" value="eventDeclaration" />
      <ref role="1YaFvo" to="rx5q:4B0n6H25BL_" resolve="EventDeclaration" />
    </node>
  </node>
  <node concept="1YbPZF" id="5z6cQ9lf$MQ">
    <property role="TrG5h" value="typeof_EventRef" />
    <node concept="3clFbS" id="5z6cQ9lf$MR" role="18ibNy">
      <node concept="1ZobV4" id="5z6cQ9lfDcG" role="3cqZAp">
        <node concept="mw_s8" id="5z6cQ9lfDDO" role="1ZfhKB">
          <node concept="2ShNRf" id="5z6cQ9lfDDK" role="mwGJk">
            <node concept="3zrR0B" id="5z6cQ9lfDK0" role="2ShVmc">
              <node concept="3Tqbb2" id="5z6cQ9lfDK2" role="3zrR0E">
                <ref role="ehGHo" to="rx5q:4B0n6H25BL_" resolve="EventDeclaration" />
              </node>
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="5z6cQ9lfDdf" role="1ZfhK$">
          <node concept="1Z2H0r" id="5z6cQ9lfDdb" role="mwGJk">
            <node concept="2OqwBi" id="5z6cQ9lfDhR" role="1Z2MuG">
              <node concept="1YBJjd" id="5z6cQ9lfDdz" role="2Oq$k0">
                <ref role="1YBMHb" node="5z6cQ9lf$MT" resolve="eventRef" />
              </node>
              <node concept="3TrEf2" id="5z6cQ9lfDC2" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE72zUU" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="5z6cQ9lf$MT" role="1YuTPh">
      <property role="TrG5h" value="eventRef" />
      <ref role="1YaFvo" to="rx5q:1x4fgD956ve" resolve="EventRef" />
    </node>
  </node>
  <node concept="3qnSWH" id="5z6cQ9lfM34">
    <property role="TrG5h" value="substituteType_EventRef" />
    <node concept="1YaCAy" id="5z6cQ9lfM37" role="1YuTPh">
      <property role="TrG5h" value="eventRef" />
      <ref role="1YaFvo" to="rx5q:1x4fgD956ve" resolve="EventRef" />
    </node>
    <node concept="3clFbS" id="5z6cQ9lfM36" role="3hT0BD">
      <node concept="3cpWs6" id="5z6cQ9lfMjn" role="3cqZAp">
        <node concept="2ShNRf" id="5z6cQ9lfMjy" role="3cqZAk">
          <node concept="3zrR0B" id="5z6cQ9lfMvE" role="2ShVmc">
            <node concept="3Tqbb2" id="5z6cQ9lfMvG" role="3zrR0E">
              <ref role="ehGHo" to="rx5q:1x4fgD956iF" resolve="EventLiteral" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

