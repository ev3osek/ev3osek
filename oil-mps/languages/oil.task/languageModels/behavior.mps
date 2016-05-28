<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:cb495cbc-bc07-4999-af55-d6b2339ed3e7(oil.task.behavior)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="hwgx" ref="r:fd2980c8-676c-4b19-b524-18c70e02f8b7(com.mbeddr.core.base.behavior)" />
    <import index="ywuz" ref="r:c6ce92e7-5a98-4a6f-866a-ec8b9e945dd8(com.mbeddr.core.expressions.behavior)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="c4fa" ref="r:9f0e84b6-2ec7-4f9e-83e0-feedc77b63a3(com.mbeddr.core.statements.structure)" />
    <import index="sxb1" ref="r:e0f1041f-50c7-4cb6-be85-b08f97c50ebb(oil.task.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240805" name="method" index="13h7CS" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194472830" name="jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration" flags="ng" index="13i0hz">
        <property id="1225194472832" name="isVirtual" index="13i0it" />
        <property id="1225194472834" name="isAbstract" index="13i0iv" />
        <reference id="1225194472831" name="overriddenMethod" index="13i0hy" />
      </concept>
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
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
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ng" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138757581985" name="jetbrains.mps.lang.smodel.structure.Link_SetNewChildOperation" flags="nn" index="zfrQC">
        <reference id="1139880128956" name="concept" index="1A9B2P" />
      </concept>
      <concept id="1139184414036" name="jetbrains.mps.lang.smodel.structure.LinkList_AddNewChildOperation" flags="nn" index="WFELt">
        <reference id="1139877738879" name="concept" index="1A0vxQ" />
      </concept>
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI">
        <reference id="1140138128738" name="concept" index="1PxNhF" />
        <child id="1140138123956" name="leftExpression" index="1PxMeX" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2" />
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
  </registry>
  <node concept="13h7C7" id="1Y5JHpRyyuA">
    <ref role="13h7C2" to="sxb1:1x4fgD956tm" resolve="TaskRef" />
    <node concept="13i0hz" id="2JIP8cA02dc" role="13h7CS">
      <property role="TrG5h" value="renderReadable" />
      <ref role="13i0hy" to="ywuz:1VQvajLb13M" resolve="renderReadable" />
      <node concept="3clFbS" id="2JIP8cA02dd" role="3clF47">
        <node concept="3clFbF" id="2JIP8cA02dg" role="3cqZAp">
          <node concept="2OqwBi" id="2JIP8cA02eQ" role="3clFbG">
            <node concept="2OqwBi" id="2JIP8cA02dA" role="2Oq$k0">
              <node concept="13iPFW" id="2JIP8cA02dh" role="2Oq$k0" />
              <node concept="3TrEf2" id="1Y5JHpRyyLv" role="2OqNvi">
                <ref role="3Tt5mk" to="sxb1:1x4fgD956tn" />
              </node>
            </node>
            <node concept="3TrcHB" id="2JIP8cA02eV" role="2OqNvi">
              <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
            </node>
          </node>
        </node>
      </node>
      <node concept="17QB3L" id="2JIP8cA02de" role="3clF45" />
      <node concept="3Tm1VV" id="2JIP8cA02df" role="1B3o_S" />
    </node>
    <node concept="13i0hz" id="1JmJJmp3OjY" role="13h7CS">
      <property role="13i0iv" value="false" />
      <property role="13i0it" value="false" />
      <property role="TrG5h" value="rebindToProxy" />
      <ref role="13i0hy" to="hwgx:7jSUHHvkApb" resolve="rebindToProxy" />
      <node concept="3Tm1VV" id="1JmJJmp3OjZ" role="1B3o_S" />
      <node concept="3clFbS" id="1JmJJmp3Ok4" role="3clF47">
        <node concept="3clFbF" id="1JmJJmp3OlP" role="3cqZAp">
          <node concept="37vLTI" id="1JmJJmp3P0o" role="3clFbG">
            <node concept="1PxgMI" id="1JmJJmp3P4H" role="37vLTx">
              <ref role="1PxNhF" to="sxb1:1x4fgD956cc" resolve="Task" />
              <node concept="37vLTw" id="1JmJJmp3P26" role="1PxMeX">
                <ref role="3cqZAo" node="1JmJJmp3Ok5" resolve="proxyElement" />
              </node>
            </node>
            <node concept="2OqwBi" id="1JmJJmp3Or1" role="37vLTJ">
              <node concept="13iPFW" id="1JmJJmp3OlO" role="2Oq$k0" />
              <node concept="3TrEf2" id="1Y5JHpRyyXK" role="2OqNvi">
                <ref role="3Tt5mk" to="sxb1:1x4fgD956tn" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="37vLTG" id="1JmJJmp3Ok5" role="3clF46">
        <property role="TrG5h" value="proxyElement" />
        <node concept="3Tqbb2" id="1JmJJmp3Ok6" role="1tU5fm" />
      </node>
      <node concept="3cqZAl" id="1JmJJmp3Ok7" role="3clF45" />
    </node>
    <node concept="13i0hz" id="1JmJJmp3Pa2" role="13h7CS">
      <property role="13i0iv" value="false" />
      <property role="13i0it" value="false" />
      <property role="TrG5h" value="referencedModuleContent" />
      <ref role="13i0hy" to="hwgx:7jSUHHvkAph" resolve="referencedModuleContent" />
      <node concept="3Tm1VV" id="1JmJJmp3Pa3" role="1B3o_S" />
      <node concept="3clFbS" id="1JmJJmp3Pa6" role="3clF47">
        <node concept="3clFbF" id="1JmJJmp3Pcs" role="3cqZAp">
          <node concept="2OqwBi" id="1JmJJmp3PhK" role="3clFbG">
            <node concept="13iPFW" id="1JmJJmp3Pcr" role="2Oq$k0" />
            <node concept="3TrEf2" id="1Y5JHpRyzaR" role="2OqNvi">
              <ref role="3Tt5mk" to="sxb1:1x4fgD956tn" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tqbb2" id="1JmJJmp3Pa7" role="3clF45" />
    </node>
    <node concept="13hLZK" id="1Y5JHpRyyuB" role="13h7CW">
      <node concept="3clFbS" id="1Y5JHpRyyuC" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="5g5RAGpV$k1">
    <ref role="13h7C2" to="sxb1:2ZNMQTB12lN" resolve="TaskMacro" />
    <node concept="13hLZK" id="5g5RAGpV$k2" role="13h7CW">
      <node concept="3clFbS" id="5g5RAGpV$k3" role="2VODD2">
        <node concept="3clFbF" id="5g5RAGpV$k5" role="3cqZAp">
          <node concept="2OqwBi" id="5g5RAGpWwAD" role="3clFbG">
            <node concept="2OqwBi" id="5g5RAGpV$yf" role="2Oq$k0">
              <node concept="13iPFW" id="5g5RAGpV$k4" role="2Oq$k0" />
              <node concept="3TrEf2" id="5g5RAGpV_Hq" role="2OqNvi">
                <ref role="3Tt5mk" to="mj1l:hEaDaGor64" />
              </node>
            </node>
            <node concept="zfrQC" id="5g5RAGpWzM9" role="2OqNvi">
              <ref role="1A9B2P" to="mj1l:6Q7bJ$$mwOp" resolve="VoidType" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="1Y5JHpRy6cK" role="3cqZAp">
          <node concept="2OqwBi" id="1Y5JHpRya2D" role="3clFbG">
            <node concept="2OqwBi" id="1Y5JHpRy8xb" role="2Oq$k0">
              <node concept="2OqwBi" id="1Y5JHpRy6rD" role="2Oq$k0">
                <node concept="13iPFW" id="1Y5JHpRy6cI" role="2Oq$k0" />
                <node concept="3TrEf2" id="1Y5JHpRy7Ka" role="2OqNvi">
                  <ref role="3Tt5mk" to="x27k:3CmSUB7Fp_k" />
                </node>
              </node>
              <node concept="3Tsc0h" id="1Y5JHpRy92l" role="2OqNvi">
                <ref role="3TtcxE" to="c4fa:3CmSUB7Fp_m" />
              </node>
            </node>
            <node concept="WFELt" id="1Y5JHpRyd_e" role="2OqNvi">
              <ref role="1A0vxQ" to="sxb1:4NwoSLUgvyg" resolve="TerminateTaskStatement" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="13h7C7" id="6Jey9O34cf6">
    <ref role="13h7C2" to="sxb1:4NwoSLUgvyg" resolve="TerminateTaskStatement" />
    <node concept="13hLZK" id="6Jey9O34cf7" role="13h7CW">
      <node concept="3clFbS" id="6Jey9O34cf8" role="2VODD2" />
    </node>
  </node>
  <node concept="13h7C7" id="1Y5JHpRzhyz">
    <ref role="13h7C2" to="sxb1:1x4fgD956cc" resolve="Task" />
    <node concept="13hLZK" id="1Y5JHpRzhy$" role="13h7CW">
      <node concept="3clFbS" id="1Y5JHpRzhy_" role="2VODD2">
        <node concept="3clFbF" id="1Y5JHpRzhyB" role="3cqZAp">
          <node concept="37vLTI" id="1Y5JHpRzib8" role="3clFbG">
            <node concept="2OqwBi" id="1Y5JHpRzhCS" role="37vLTJ">
              <node concept="13iPFW" id="1Y5JHpRzhyA" role="2Oq$k0" />
              <node concept="3TrcHB" id="1Y5JHpRzhT8" role="2OqNvi">
                <ref role="3TsBF5" to="mj1l:1UQ4qqfV3yK" resolve="value" />
              </node>
            </node>
            <node concept="Xl_RD" id="1Y5JHpRzidJ" role="37vLTx">
              <property role="Xl_RC" value="0" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

