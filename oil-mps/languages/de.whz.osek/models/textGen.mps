<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:a8da1015-2618-4b82-b7b3-7aab82d1ed5d(de.whz.osek.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen">
      <concept id="1237305208784" name="jetbrains.mps.lang.textGen.structure.NewLineAppendPart" flags="ng" index="l8MVK" />
      <concept id="1237305334312" name="jetbrains.mps.lang.textGen.structure.NodeAppendPart" flags="ng" index="l9hG8">
        <child id="1237305790512" name="value" index="lb14g" />
      </concept>
      <concept id="1237305557638" name="jetbrains.mps.lang.textGen.structure.ConstantStringAppendPart" flags="ng" index="la8eA">
        <property id="1237305576108" name="value" index="lacIc" />
        <property id="1237306361677" name="withIndent" index="ldcpH" />
      </concept>
      <concept id="1237306079178" name="jetbrains.mps.lang.textGen.structure.AppendOperation" flags="nn" index="lc7rE">
        <child id="1237306115446" name="part" index="lcghm" />
      </concept>
      <concept id="4357423944233036906" name="jetbrains.mps.lang.textGen.structure.IndentPart" flags="ng" index="2BGw6n" />
      <concept id="1233670071145" name="jetbrains.mps.lang.textGen.structure.ConceptTextGenDeclaration" flags="ig" index="WtQ9Q">
        <reference id="1233670257997" name="conceptDeclaration" index="WuzLi" />
        <child id="1233749296504" name="textGenBlock" index="11c4hB" />
      </concept>
      <concept id="1233748055915" name="jetbrains.mps.lang.textGen.structure.NodeParameter" flags="nn" index="117lpO" />
      <concept id="1233749247888" name="jetbrains.mps.lang.textGen.structure.GenerateTextDeclaration" flags="in" index="11bSqf" />
      <concept id="1236188139846" name="jetbrains.mps.lang.textGen.structure.WithIndentOperation" flags="nn" index="3izx1p">
        <child id="1236188238861" name="list" index="3izTki" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
    </language>
  </registry>
  <node concept="WtQ9Q" id="2UjW4IkI0bx">
    <ref role="WuzLi" to="bwbq:2UjW4IkI07e" resolve="DeclareCounterMacro" />
    <node concept="11bSqf" id="2UjW4IkI0by" role="11c4hB">
      <node concept="3clFbS" id="2UjW4IkI0bz" role="2VODD2">
        <node concept="lc7rE" id="2UjW4IkI0bJ" role="3cqZAp">
          <node concept="la8eA" id="2UjW4IkI0bX" role="lcghm">
            <property role="lacIc" value="DeclareCounter(" />
          </node>
          <node concept="l9hG8" id="2UjW4IkI0cJ" role="lcghm">
            <node concept="2OqwBi" id="2UjW4IkI0H1" role="lb14g">
              <node concept="117lpO" id="2UjW4IkI0dw" role="2Oq$k0" />
              <node concept="3TrcHB" id="2UjW4IkINjA" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="4EZxVF6nZt2" role="lcghm">
            <property role="lacIc" value=");" />
          </node>
          <node concept="l8MVK" id="4EZxVF6nZw$" role="lcghm" />
        </node>
        <node concept="3clFbH" id="4EZxVF6nZpI" role="3cqZAp" />
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="6g77ZYUpC1j">
    <property role="3GE5qa" value="Resource" />
    <ref role="WuzLi" to="bwbq:6g77ZYUpzaO" resolve="ResourceLiteral" />
    <node concept="11bSqf" id="6g77ZYUpC1k" role="11c4hB">
      <node concept="3clFbS" id="6g77ZYUpC1l" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHkYtA" role="3cqZAp">
          <node concept="2BGw6n" id="7_fwX8D8JFa" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHkYtO" role="lcghm">
            <property role="lacIc" value="RESOURCE " />
          </node>
          <node concept="l9hG8" id="3QwuWjHkYuv" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHkYxk" role="lb14g">
              <node concept="117lpO" id="3QwuWjHkYvg" role="2Oq$k0" />
              <node concept="3TrcHB" id="3QwuWjHkY_G" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="l8MVK" id="3QwuWjHllTZ" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHkYE2" role="lcghm">
            <property role="lacIc" value="{" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="3QwuWjHlm59" role="lcghm" />
        </node>
        <node concept="3izx1p" id="23s$hiVSqmh" role="3cqZAp">
          <node concept="3clFbS" id="23s$hiVSqmj" role="3izTki">
            <node concept="lc7rE" id="3QwuWjHkYIc" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8JHY" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHkYJo" role="lcghm">
                <property role="lacIc" value="RESOURCEPROPERTY = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHkYKU" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHkYNK" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHkYLG" role="2Oq$k0" />
                  <node concept="3TrcHB" id="4osOqZkmkeK" role="2OqNvi">
                    <ref role="3TsBF5" to="bwbq:6g77ZYUpzCl" resolve="property" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHkYUh" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHkZkO" role="lcghm" />
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHlbOE" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlbWc" role="lcghm">
            <property role="lacIc" value="};" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="3QwuWjHloVP" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
</model>

