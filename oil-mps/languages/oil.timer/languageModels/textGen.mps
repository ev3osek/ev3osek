<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:d8257dfe-0001-412b-9651-7fb453d911d6(oil.timer.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="u1z9" ref="r:bd641933-ad1e-436e-ae92-247a9a3b4aa2(oil.core.structure)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="oo9t" ref="r:418b8b47-9721-4050-9bc9-93530e3b68a5(oil.timer.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1082485599094" name="ifFalseStatement" index="9aQIa" />
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen">
      <concept id="1237305208784" name="jetbrains.mps.lang.textGen.structure.NewLineAppendPart" flags="ng" index="l8MVK" />
      <concept id="1237305334312" name="jetbrains.mps.lang.textGen.structure.NodeAppendPart" flags="ng" index="l9hG8">
        <child id="1237305790512" name="value" index="lb14g" />
      </concept>
      <concept id="1237305491868" name="jetbrains.mps.lang.textGen.structure.CollectionAppendPart" flags="ng" index="l9S2W">
        <child id="1237305945551" name="list" index="lbANJ" />
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
      <concept id="1172008320231" name="jetbrains.mps.lang.smodel.structure.Node_IsNotNullOperation" flags="nn" index="3x8VRR" />
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
  </registry>
  <node concept="WtQ9Q" id="3QwuWjHlerT">
    <ref role="WuzLi" to="oo9t:1x4fgD956fc" resolve="Alarm" />
    <node concept="11bSqf" id="3QwuWjHlerU" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlerV" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHkYtA" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHkYtO" role="lcghm">
            <property role="lacIc" value="ALARM " />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l9hG8" id="3QwuWjHkYuv" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHkYxk" role="lb14g">
              <node concept="117lpO" id="3QwuWjHkYvg" role="2Oq$k0" />
              <node concept="3TrcHB" id="3QwuWjHkY_G" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="3QwuWjHkYE2" role="lcghm">
            <property role="lacIc" value="{" />
          </node>
          <node concept="l8MVK" id="3QwuWjHlmun" role="lcghm" />
        </node>
        <node concept="3izx1p" id="23s$hiVSqXk" role="3cqZAp">
          <node concept="3clFbS" id="23s$hiVSqXm" role="3izTki">
            <node concept="lc7rE" id="3QwuWjHkYIc" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHkYJo" role="lcghm">
                <property role="lacIc" value="COUNTER = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="3QwuWjHkYKU" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHlqqc" role="lb14g">
                  <node concept="2OqwBi" id="3QwuWjHkYNK" role="2Oq$k0">
                    <node concept="117lpO" id="3QwuWjHkYLG" role="2Oq$k0" />
                    <node concept="3TrEf2" id="3QwuWjHlqk7" role="2OqNvi">
                      <ref role="3Tt5mk" to="oo9t:7FCpXS_WYu$" />
                    </node>
                  </node>
                  <node concept="3TrcHB" id="3QwuWjHlqyU" role="2OqNvi">
                    <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHkYUh" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHkZkO" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlqAE" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHlqDn" role="lcghm">
                <property role="lacIc" value="ACTION  = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="3QwuWjHlqEk" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHlqHa" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHlqF6" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3QwuWjHlrbK" role="2OqNvi">
                    <ref role="3Tt5mk" to="oo9t:7FCpXS_WYQV" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHlre9" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHlrgK" role="lcghm" />
            </node>
            <node concept="3clFbJ" id="4B0n6H24cBl" role="3cqZAp">
              <node concept="3clFbS" id="4B0n6H24cBn" role="3clFbx">
                <node concept="lc7rE" id="4B0n6H24cXP" role="3cqZAp">
                  <node concept="l9hG8" id="4B0n6H24kC0" role="lcghm">
                    <node concept="2OqwBi" id="4B0n6H24kET" role="lb14g">
                      <node concept="117lpO" id="4B0n6H24kCI" role="2Oq$k0" />
                      <node concept="3TrEf2" id="4B0n6H24kMC" role="2OqNvi">
                        <ref role="3Tt5mk" to="oo9t:7FCpXS_WYwf" />
                      </node>
                    </node>
                  </node>
                  <node concept="l8MVK" id="4B0n6H24kPd" role="lcghm" />
                </node>
              </node>
              <node concept="2OqwBi" id="4B0n6H24cSM" role="3clFbw">
                <node concept="2OqwBi" id="4B0n6H24cFV" role="2Oq$k0">
                  <node concept="117lpO" id="4B0n6H24cDS" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4B0n6H24cN7" role="2OqNvi">
                    <ref role="3Tt5mk" to="oo9t:7FCpXS_WYwf" />
                  </node>
                </node>
                <node concept="3x8VRR" id="4B0n6H24cWx" role="2OqNvi" />
              </node>
              <node concept="9aQIb" id="4B0n6H24l1$" role="9aQIa">
                <node concept="3clFbS" id="4B0n6H24l1_" role="9aQI4">
                  <node concept="lc7rE" id="4B0n6H24l3p" role="3cqZAp">
                    <node concept="la8eA" id="4B0n6H24l42" role="lcghm">
                      <property role="lacIc" value="AUTOSTART = FALSE;" />
                      <property role="ldcpH" value="true" />
                    </node>
                    <node concept="l8MVK" id="4B0n6H24pcd" role="lcghm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHlbOE" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlbWc" role="lcghm">
            <property role="lacIc" value="};" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="3QwuWjHltTI" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHles$">
    <ref role="WuzLi" to="oo9t:5KtH1a6jX_3" resolve="Counter" />
    <node concept="11bSqf" id="3QwuWjHles_" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlesA" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHlt7j" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlt7k" role="lcghm">
            <property role="lacIc" value="COUNTER " />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l9hG8" id="3QwuWjHlt7l" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHlt7m" role="lb14g">
              <node concept="117lpO" id="3QwuWjHlt7n" role="2Oq$k0" />
              <node concept="3TrcHB" id="3QwuWjHlt7o" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="l8MVK" id="4osOqZkmJit" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHlt7p" role="lcghm">
            <property role="lacIc" value="{" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="3QwuWjHlt7q" role="lcghm" />
        </node>
        <node concept="3izx1p" id="23s$hiVSqKJ" role="3cqZAp">
          <node concept="3clFbS" id="23s$hiVSqKL" role="3izTki">
            <node concept="lc7rE" id="3QwuWjHltbY" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHltc0" role="lcghm">
                <property role="lacIc" value="MINCYCLE        = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="3QwuWjHltc1" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHltc2" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHltc3" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3QwuWjHltIR" role="2OqNvi">
                    <ref role="3Tt5mk" to="oo9t:78S7ngm5xPy" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHltc5" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHltc6" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlt7r" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHlt7t" role="lcghm">
                <property role="lacIc" value="MAXALLOWEDVALUE = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="3QwuWjHlt7u" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHltly" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHltju" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3QwuWjHltth" role="2OqNvi">
                    <ref role="3Tt5mk" to="oo9t:78S7ngm5xPc" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHlt7$" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHlt7_" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlt7A" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHlt7C" role="lcghm">
                <property role="lacIc" value="TICKSPERBASE    = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="3QwuWjHlt7D" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHlt7E" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHlt7F" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3QwuWjHltA4" role="2OqNvi">
                    <ref role="3Tt5mk" to="oo9t:78S7ngm5xPv" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHlt7H" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHlt7I" role="lcghm" />
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHlt7J" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlt7K" role="lcghm">
            <property role="lacIc" value="};" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="3QwuWjHltQ9" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHlri8">
    <ref role="WuzLi" to="oo9t:7FCpXS_WYIB" resolve="AlarmActionSetEvent" />
    <node concept="11bSqf" id="3QwuWjHlri9" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlria" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHlrim" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlri$" role="lcghm">
            <property role="lacIc" value="SETEVENT {" />
          </node>
          <node concept="l8MVK" id="3QwuWjHlrjO" role="lcghm" />
        </node>
        <node concept="lc7rE" id="3QwuWjHlrke" role="3cqZAp">
          <node concept="2BGw6n" id="3QwuWjHlrkx" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHlrkV" role="lcghm">
            <property role="lacIc" value="TASK  = " />
          </node>
          <node concept="l9hG8" id="3QwuWjHlrm2" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHlr_3" role="lb14g">
              <node concept="2OqwBi" id="3QwuWjHlrpe" role="2Oq$k0">
                <node concept="117lpO" id="3QwuWjHlrmO" role="2Oq$k0" />
                <node concept="3TrEf2" id="3QwuWjHlru$" role="2OqNvi">
                  <ref role="3Tt5mk" to="oo9t:7FCpXS_WYGX" />
                </node>
              </node>
              <node concept="3TrcHB" id="3QwuWjHlrHP" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="3QwuWjHlrSp" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHlrOA" role="3cqZAp">
          <node concept="2BGw6n" id="3QwuWjHlrQt" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHlrWp" role="lcghm">
            <property role="lacIc" value="EVENT = " />
          </node>
          <node concept="l9hG8" id="3QwuWjHlrXq" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHlsho" role="lb14g">
              <node concept="2OqwBi" id="3QwuWjHls0A" role="2Oq$k0">
                <node concept="117lpO" id="3QwuWjHlrYc" role="2Oq$k0" />
                <node concept="3TrEf2" id="3QwuWjHlsah" role="2OqNvi">
                  <ref role="3Tt5mk" to="oo9t:7FCpXS_WYKh" />
                </node>
              </node>
              <node concept="3TrcHB" id="3QwuWjHlsqa" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="3QwuWjHlstx" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHlsvo" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlsyj" role="lcghm">
            <property role="lacIc" value="}" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHls$h">
    <ref role="WuzLi" to="oo9t:7FCpXS_WYDG" resolve="AlarmActionActivateTask" />
    <node concept="11bSqf" id="3QwuWjHls$i" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHls$j" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHls$v" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHls$w" role="lcghm">
            <property role="lacIc" value="ACTIVATETASK" />
          </node>
          <node concept="la8eA" id="4osOqZkmLYS" role="lcghm">
            <property role="lacIc" value="{" />
          </node>
          <node concept="l8MVK" id="3QwuWjHls$x" role="lcghm" />
        </node>
        <node concept="3izx1p" id="4osOqZkmS6W" role="3cqZAp">
          <node concept="3clFbS" id="4osOqZkmS6Y" role="3izTki">
            <node concept="lc7rE" id="3QwuWjHls$y" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHls$$" role="lcghm">
                <property role="lacIc" value="TASK  = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="3QwuWjHls$_" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHls$A" role="lb14g">
                  <node concept="2OqwBi" id="3QwuWjHls$B" role="2Oq$k0">
                    <node concept="117lpO" id="3QwuWjHls$C" role="2Oq$k0" />
                    <node concept="3TrEf2" id="3QwuWjHls$D" role="2OqNvi">
                      <ref role="3Tt5mk" to="oo9t:7FCpXS_WYGX" />
                    </node>
                  </node>
                  <node concept="3TrcHB" id="3QwuWjHls$E" role="2OqNvi">
                    <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHls$F" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4osOqZkmM2j" role="lcghm" />
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHls$Q" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHls$R" role="lcghm">
            <property role="lacIc" value="}" />
            <property role="ldcpH" value="true" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHlsGT">
    <ref role="WuzLi" to="oo9t:7FCpXS_WYAv" resolve="AlarmActionCallback" />
    <node concept="11bSqf" id="3QwuWjHlsGU" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlsGV" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHlsH7" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlsH8" role="lcghm">
            <property role="lacIc" value="ALARMCALLBACK {" />
          </node>
          <node concept="l8MVK" id="3QwuWjHlsH9" role="lcghm" />
        </node>
        <node concept="lc7rE" id="3QwuWjHlsHk" role="3cqZAp">
          <node concept="2BGw6n" id="3QwuWjHlsHl" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHlsHm" role="lcghm">
            <property role="lacIc" value="ALARMCALLBACKNAME = " />
          </node>
          <node concept="l9hG8" id="3QwuWjHlsHn" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHlsHp" role="lb14g">
              <node concept="117lpO" id="3QwuWjHlsHq" role="2Oq$k0" />
              <node concept="3TrcHB" id="3QwuWjHlsUV" role="2OqNvi">
                <ref role="3TsBF5" to="oo9t:7FCpXS_WYAw" resolve="callbackName" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="3QwuWjHlsHt" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHlsHu" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlsHv" role="lcghm">
            <property role="lacIc" value="}" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="4B0n6H24d0f">
    <ref role="WuzLi" to="oo9t:7FCpXS_WSTn" resolve="AlarmAutostart" />
    <node concept="11bSqf" id="4B0n6H24d0g" role="11c4hB">
      <node concept="3clFbS" id="4B0n6H24d0h" role="2VODD2">
        <node concept="lc7rE" id="4B0n6H24d4v" role="3cqZAp">
          <node concept="la8eA" id="4B0n6H24d4w" role="lcghm">
            <property role="lacIc" value="AUTOSTART = TRUE" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="la8eA" id="4B0n6H24d4y" role="lcghm">
            <property role="lacIc" value="{" />
          </node>
          <node concept="l8MVK" id="4B0n6H24d56" role="lcghm" />
        </node>
        <node concept="3izx1p" id="4B0n6H24d5Z" role="3cqZAp">
          <node concept="3clFbS" id="4B0n6H24d61" role="3izTki">
            <node concept="lc7rE" id="4B0n6H24din" role="3cqZAp">
              <node concept="la8eA" id="4B0n6H24di_" role="lcghm">
                <property role="lacIc" value="ALARMTIME = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="4B0n6H24djF" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H24dmb" role="lb14g">
                  <node concept="117lpO" id="4B0n6H24dks" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4B0n6H24dp_" role="2OqNvi">
                    <ref role="3Tt5mk" to="oo9t:78S7ngm5xPA" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4B0n6H24dsp" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4B0n6H24dvq" role="lcghm" />
            </node>
            <node concept="lc7rE" id="4B0n6H24dyr" role="3cqZAp">
              <node concept="la8eA" id="4B0n6H24dzY" role="lcghm">
                <property role="lacIc" value="CYCLETIME = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="4B0n6H24d$P" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H24dBl" role="lb14g">
                  <node concept="117lpO" id="4B0n6H24d_A" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4B0n6H24dH8" role="2OqNvi">
                    <ref role="3Tt5mk" to="oo9t:78S7ngm5xPC" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4B0n6H24dJW" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4B0n6H24dMr" role="lcghm" />
            </node>
            <node concept="lc7rE" id="4B0n6H24dV4" role="3cqZAp">
              <node concept="l9S2W" id="4B0n6H24erj" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H24esU" role="lbANJ">
                  <node concept="117lpO" id="4B0n6H24erz" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4B0n6H24evK" role="2OqNvi">
                    <ref role="3TtcxE" to="oo9t:7FCpXS_WSQo" />
                  </node>
                </node>
              </node>
              <node concept="l8MVK" id="4B0n6H24exb" role="lcghm" />
            </node>
            <node concept="lc7rE" id="4B0n6H24e$3" role="3cqZAp">
              <node concept="la8eA" id="4B0n6H24eAi" role="lcghm">
                <property role="lacIc" value="};" />
                <property role="ldcpH" value="true" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

