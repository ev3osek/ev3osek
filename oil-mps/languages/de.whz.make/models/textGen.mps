<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:3a3b482f-f0bc-4c5b-8614-02070f79b383(de.whz.make.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="4" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="i2y7" ref="r:098cbe90-1cfd-414a-b5e8-aca28752df17(com.mbeddr.core.make.structure)" />
    <import index="4vo2" ref="r:5212abd4-4a43-4236-b735-4bf4165f7444(de.whz.make.structure)" implicit="true" />
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
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen">
      <concept id="1237305334312" name="jetbrains.mps.lang.textGen.structure.NodeAppendPart" flags="ng" index="l9hG8">
        <child id="1237305790512" name="value" index="lb14g" />
      </concept>
      <concept id="1237305491868" name="jetbrains.mps.lang.textGen.structure.CollectionAppendPart" flags="ng" index="l9S2W">
        <child id="1237305945551" name="list" index="lbANJ" />
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
      </concept>
      <concept id="1233748055915" name="jetbrains.mps.lang.textGen.structure.NodeParameter" flags="nn" index="117lpO" />
      <concept id="1233749247888" name="jetbrains.mps.lang.textGen.structure.GenerateTextDeclaration" flags="in" index="11bSqf" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
  </registry>
  <node concept="WtQ9Q" id="1wzo07ApVbG">
    <ref role="WuzLi" to="4vo2:1wzo07AoCmx" resolve="ParameterCommandItem" />
    <node concept="11bSqf" id="1wzo07ApVbH" role="11c4hB">
      <node concept="3clFbS" id="1wzo07ApVbI" role="2VODD2">
        <node concept="lc7rE" id="1wzo07AoCob" role="3cqZAp">
          <node concept="la8eA" id="1wzo07AoCoI" role="lcghm">
            <property role="lacIc" value="-" />
          </node>
          <node concept="l9hG8" id="1wzo07AoCql" role="lcghm">
            <node concept="2OqwBi" id="1wzo07AoCtA" role="lb14g">
              <node concept="117lpO" id="1wzo07AoCr6" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07AoCBh" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="1I2SOvk9Ya6" role="lcghm">
            <property role="lacIc" value=" " />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="1wzo07Aq8Ob">
    <ref role="WuzLi" to="4vo2:1wzo07Aq8O0" resolve="CommandItem" />
    <node concept="11bSqf" id="1wzo07Aq8Oc" role="11c4hB">
      <node concept="3clFbS" id="1wzo07Aq8Od" role="2VODD2">
        <node concept="lc7rE" id="1wzo07Aq8Op" role="3cqZAp">
          <node concept="l9hG8" id="1wzo07Aq8OB" role="lcghm">
            <node concept="2OqwBi" id="1wzo07Aq8RM" role="lb14g">
              <node concept="117lpO" id="1wzo07Aq8Pn" role="2Oq$k0" />
              <node concept="3TrcHB" id="1wzo07Aq8X8" role="2OqNvi">
                <ref role="3TsBF5" to="i2y7:2Vizpn2Mx$$" resolve="text" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="1wzo07Aq8YK" role="lcghm">
            <property role="lacIc" value=" " />
          </node>
          <node concept="l9S2W" id="1I2SOvk9XW3" role="lcghm">
            <node concept="2OqwBi" id="1I2SOvk9XZm" role="lbANJ">
              <node concept="117lpO" id="1I2SOvk9XXi" role="2Oq$k0" />
              <node concept="3Tsc0h" id="1I2SOvk9Y44" role="2OqNvi">
                <ref role="3TtcxE" to="4vo2:1wzo07Aq9R4" resolve="arguments" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="1I2SOvk9Y7z" role="lcghm">
            <property role="lacIc" value=" " />
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

