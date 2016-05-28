<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:fa178cd5-7770-4225-a7f4-b5688c4e00ea(oil.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="scpz" ref="r:dcec6791-9de2-4c75-82ab-f19ead96211d(oil.structure)" implicit="true" />
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
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen">
      <concept id="8931911391946696733" name="jetbrains.mps.lang.textGen.structure.ExtensionDeclaration" flags="in" index="9MYSb" />
      <concept id="1237305208784" name="jetbrains.mps.lang.textGen.structure.NewLineAppendPart" flags="ng" index="l8MVK" />
      <concept id="1237305334312" name="jetbrains.mps.lang.textGen.structure.NodeAppendPart" flags="ng" index="l9hG8">
        <child id="1237305790512" name="value" index="lb14g" />
      </concept>
      <concept id="1237305557638" name="jetbrains.mps.lang.textGen.structure.ConstantStringAppendPart" flags="ng" index="la8eA">
        <property id="1237305576108" name="value" index="lacIc" />
      </concept>
      <concept id="1237306079178" name="jetbrains.mps.lang.textGen.structure.AppendOperation" flags="nn" index="lc7rE">
        <child id="1237306115446" name="part" index="lcghm" />
      </concept>
      <concept id="1233670071145" name="jetbrains.mps.lang.textGen.structure.ConceptTextGenDeclaration" flags="ig" index="WtQ9Q">
        <reference id="1233670257997" name="conceptDeclaration" index="WuzLi" />
        <child id="1233749296504" name="textGenBlock" index="11c4hB" />
        <child id="7991274449437422201" name="extension" index="33IsuW" />
      </concept>
      <concept id="1233748055915" name="jetbrains.mps.lang.textGen.structure.NodeParameter" flags="nn" index="117lpO" />
      <concept id="1233749247888" name="jetbrains.mps.lang.textGen.structure.GenerateTextDeclaration" flags="in" index="11bSqf" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
  </registry>
  <node concept="WtQ9Q" id="3QwuWjHkWRX">
    <ref role="WuzLi" to="scpz:1x4fgD93Cjb" resolve="OilFile" />
    <node concept="9MYSb" id="3QwuWjHkWRZ" role="33IsuW">
      <node concept="3clFbS" id="3QwuWjHkWS0" role="2VODD2">
        <node concept="3clFbF" id="23s$hiVSvAU" role="3cqZAp">
          <node concept="Xl_RD" id="3QwuWjHkWWo" role="3clFbG">
            <property role="Xl_RC" value="oil" />
          </node>
        </node>
      </node>
    </node>
    <node concept="11bSqf" id="3QwuWjHkXcP" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHkXcQ" role="2VODD2">
        <node concept="lc7rE" id="5YkaFUJVm0M" role="3cqZAp">
          <node concept="l9hG8" id="5YkaFUJVm22" role="lcghm">
            <node concept="2OqwBi" id="5YkaFUJVmbU" role="lb14g">
              <node concept="117lpO" id="5YkaFUJVm2I" role="2Oq$k0" />
              <node concept="3TrcHB" id="5YkaFUJVmSl" role="2OqNvi">
                <ref role="3TsBF5" to="scpz:1x4fgD93NIt" resolve="oilVersion" />
              </node>
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHkXIB" role="3cqZAp">
          <node concept="l8MVK" id="3QwuWjHkXJ2" role="lcghm" />
        </node>
        <node concept="lc7rE" id="3QwuWjHl7OI" role="3cqZAp">
          <node concept="l9hG8" id="3QwuWjHl7PE" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHl7Su" role="lb14g">
              <node concept="117lpO" id="3QwuWjHl7Qq" role="2Oq$k0" />
              <node concept="3TrEf2" id="3QwuWjHl7WQ" role="2OqNvi">
                <ref role="3Tt5mk" to="scpz:7FCpXS_VYUZ" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="1Y5JHpRzvbA">
    <ref role="WuzLi" to="scpz:1x4fgD93NJv" resolve="OilFileInclude" />
    <node concept="11bSqf" id="1Y5JHpRzvbB" role="11c4hB">
      <node concept="3clFbS" id="1Y5JHpRzvbC" role="2VODD2">
        <node concept="lc7rE" id="1Y5JHpRzvbO" role="3cqZAp">
          <node concept="la8eA" id="1Y5JHpRzvxC" role="lcghm">
            <property role="lacIc" value="&quot;" />
          </node>
          <node concept="l9hG8" id="1Y5JHpRzvnI" role="lcghm">
            <node concept="2OqwBi" id="1Y5JHpRzvq4" role="lb14g">
              <node concept="117lpO" id="1Y5JHpRzvos" role="2Oq$k0" />
              <node concept="3TrcHB" id="1Y5JHpRzvvN" role="2OqNvi">
                <ref role="3TsBF5" to="scpz:1x4fgD93NYC" resolve="path" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="1Y5JHpRzv_t" role="lcghm">
            <property role="lacIc" value="&quot;" />
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

