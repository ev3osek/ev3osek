<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:0e745a14-aae3-41f3-99ae-d34f7af3cb6b(de.whz.osek.primitives.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="mle0" ref="r:8664625f-e528-4bef-85fe-ee87292976ff(de.whz.osek.primitives.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1175147569072" name="jetbrains.mps.lang.typesystem.structure.AbstractSubtypingRule" flags="ig" index="2sgdUx">
        <child id="1175147624276" name="body" index="2sgrp5" />
      </concept>
      <concept id="1175147670730" name="jetbrains.mps.lang.typesystem.structure.SubtypingRule" flags="ig" index="2sgARr" />
      <concept id="6405009306797516074" name="jetbrains.mps.lang.typesystem.structure.SubstituteTypeRule" flags="ig" index="3qnSWH">
        <child id="7323318266641100480" name="body" index="3hT0BD" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1180636770613" name="jetbrains.mps.lang.smodel.structure.SNodeCreator" flags="nn" index="3zrR0B">
        <child id="1180636770616" name="createdType" index="3zrR0E" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
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
  <node concept="3qnSWH" id="62ww4MHp_Do">
    <property role="TrG5h" value="substituteType_EventMaskType" />
    <property role="3GE5qa" value="" />
    <node concept="3clFbS" id="62ww4MHp_Dq" role="3hT0BD">
      <node concept="3cpWs6" id="62ww4MHp_Dv" role="3cqZAp">
        <node concept="2ShNRf" id="62ww4MHp_DE" role="3cqZAk">
          <node concept="3zrR0B" id="62ww4MHp_Jq" role="2ShVmc">
            <node concept="3Tqbb2" id="62ww4MHp_Js" role="3zrR0E">
              <ref role="ehGHo" to="mj1l:7FQByU3CrCU" resolve="BooleanType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="62ww4MHp_Dr" role="1YuTPh">
      <property role="TrG5h" value="eventMaskType" />
      <ref role="1YaFvo" to="mle0:1JmJJmp3CpZ" resolve="EventMaskType" />
    </node>
  </node>
  <node concept="2sgARr" id="1Y5JHpRy20E">
    <property role="TrG5h" value="subtyping_ResourceType" />
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
      <ref role="1YaFvo" to="mle0:v5qeus8Gck" resolve="ResourceType" />
    </node>
  </node>
  <node concept="2sgARr" id="1Y5JHpRyzdZ">
    <property role="TrG5h" value="subtyping_TaskType" />
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
      <ref role="1YaFvo" to="mle0:1Y5JHpRyzdS" resolve="TaskType" />
    </node>
  </node>
</model>

