<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:7516bc34-b33d-4c4a-8ae1-0f5e9d6c038c(oil.core.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="u1z9" ref="r:bd641933-ad1e-436e-ae92-247a9a3b4aa2(oil.core.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
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
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
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
  <node concept="WtQ9Q" id="3QwuWjHkXKU">
    <ref role="WuzLi" to="u1z9:1x4fgD94T$4" resolve="CPU" />
    <node concept="11bSqf" id="3QwuWjHkXKV" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHkXKW" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHkXMb" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHkXMp" role="lcghm">
            <property role="lacIc" value="CPU " />
          </node>
          <node concept="l9hG8" id="3QwuWjHkXN3" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHkXPS" role="lb14g">
              <node concept="117lpO" id="3QwuWjHkXNO" role="2Oq$k0" />
              <node concept="3TrcHB" id="3QwuWjHkXZt" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="l8MVK" id="3QwuWjHkY1_" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHkYjK" role="lcghm">
            <property role="lacIc" value="{" />
          </node>
          <node concept="l8MVK" id="3QwuWjHkYgs" role="lcghm" />
        </node>
        <node concept="3izx1p" id="23s$hiVSpZd" role="3cqZAp">
          <node concept="3clFbS" id="23s$hiVSpZf" role="3izTki">
            <node concept="lc7rE" id="3QwuWjHkYdX" role="3cqZAp">
              <node concept="l9hG8" id="3QwuWjHkYl0" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHkYnO" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHkYlK" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3QwuWjHkYsc" role="2OqNvi">
                    <ref role="3Tt5mk" to="u1z9:1x4fgD956aq" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="3QwuWjHl88f" role="3cqZAp">
              <node concept="l8MVK" id="3QwuWjHl8bc" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl8dd" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHl8ht" role="lcghm">
                <property role="lacIc" value="/* Definition of application mode */" />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l8MVK" id="3QwuWjHl8i0" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl8jQ" role="3cqZAp">
              <node concept="l9S2W" id="3QwuWjHl8rq" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHl8to" role="lbANJ">
                  <node concept="117lpO" id="3QwuWjHl8rF" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="3QwuWjHl8xc" role="2OqNvi">
                    <ref role="3TtcxE" to="u1z9:1x4fgD956bG" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="3QwuWjHlclk" role="3cqZAp">
              <node concept="l8MVK" id="3QwuWjHlcns" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlcZQ" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHld5$" role="lcghm">
                <property role="lacIc" value="/* Definition of resources */" />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l8MVK" id="3QwuWjHld74" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlda6" role="3cqZAp">
              <node concept="l9S2W" id="3QwuWjHldd1" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHldeZ" role="lbANJ">
                  <node concept="117lpO" id="3QwuWjHlddi" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="3QwuWjHldma" role="2OqNvi">
                    <ref role="3TtcxE" to="u1z9:7FCpXS_W1Ko" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="4osOqZkmjz0" role="3cqZAp">
              <node concept="l8MVK" id="4osOqZkmjz1" role="lcghm" />
            </node>
            <node concept="lc7rE" id="4osOqZkmjz2" role="3cqZAp">
              <node concept="la8eA" id="4osOqZkmjz3" role="lcghm">
                <property role="lacIc" value="/* Definition of events */" />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l8MVK" id="4osOqZkmjz4" role="lcghm" />
            </node>
            <node concept="lc7rE" id="4osOqZkmjz5" role="3cqZAp">
              <node concept="l9S2W" id="4osOqZkmjz6" role="lcghm">
                <node concept="2OqwBi" id="4osOqZkmjz7" role="lbANJ">
                  <node concept="117lpO" id="4osOqZkmjz8" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4osOqZkmjFc" role="2OqNvi">
                    <ref role="3TtcxE" to="u1z9:62xxBiE6sz5" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="3QwuWjHldpz" role="3cqZAp">
              <node concept="l8MVK" id="3QwuWjHldsQ" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlcu7" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHlcwB" role="lcghm">
                <property role="lacIc" value="/* Definition of tasks */" />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l8MVK" id="3QwuWjHlcxV" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlc$h" role="3cqZAp">
              <node concept="l9S2W" id="3QwuWjHlcAT" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHlcCR" role="lbANJ">
                  <node concept="117lpO" id="3QwuWjHlcBa" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="3QwuWjHlcRM" role="2OqNvi">
                    <ref role="3TtcxE" to="u1z9:7FCpXS_W1Kk" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="3QwuWjHldDq" role="3cqZAp">
              <node concept="l8MVK" id="3QwuWjHldDr" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHldGG" role="3cqZAp">
              <node concept="la8eA" id="3QwuWjHldGI" role="lcghm">
                <property role="lacIc" value="/* Definition of counters and alarms */" />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l8MVK" id="3QwuWjHldGJ" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHldGK" role="3cqZAp">
              <node concept="l9S2W" id="3QwuWjHldGM" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHldGN" role="lbANJ">
                  <node concept="117lpO" id="3QwuWjHldGO" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="3QwuWjHle6a" role="2OqNvi">
                    <ref role="3TtcxE" to="u1z9:5KtH1a6kkoW" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="3QwuWjHlcUS" role="3cqZAp">
              <node concept="l8MVK" id="3QwuWjHlcXj" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHldDk" role="3cqZAp">
              <node concept="l9S2W" id="3QwuWjHldDm" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHldDn" role="lbANJ">
                  <node concept="117lpO" id="3QwuWjHldDo" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="3QwuWjHldYm" role="2OqNvi">
                    <ref role="3TtcxE" to="u1z9:7FCpXS_WSLS" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHleeb" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlehv" role="lcghm">
            <property role="lacIc" value="};" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHkYto">
    <ref role="WuzLi" to="u1z9:1x4fgD94T$g" resolve="OS" />
    <node concept="11bSqf" id="3QwuWjHkYtp" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHkYtq" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHkYtA" role="3cqZAp">
          <node concept="2BGw6n" id="7_fwX8D8ulF" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHkYtO" role="lcghm">
            <property role="lacIc" value="OS " />
          </node>
          <node concept="l9hG8" id="3QwuWjHkYuv" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHkYxk" role="lb14g">
              <node concept="117lpO" id="3QwuWjHkYvg" role="2Oq$k0" />
              <node concept="3TrcHB" id="3QwuWjHkY_G" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="l8MVK" id="3QwuWjHlmjd" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHkYE2" role="lcghm">
            <property role="lacIc" value="{" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="3QwuWjHlmun" role="lcghm" />
        </node>
        <node concept="3izx1p" id="23s$hiVSpqf" role="3cqZAp">
          <node concept="3clFbS" id="23s$hiVSpqh" role="3izTki">
            <node concept="lc7rE" id="3QwuWjHkYIc" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8tzb" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHkYJo" role="lcghm">
                <property role="lacIc" value="STATUS             = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHkYKU" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHkYNK" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHkYLG" role="2Oq$k0" />
                  <node concept="3TrcHB" id="3QwuWjHkYS8" role="2OqNvi">
                    <ref role="3TsBF5" to="u1z9:1x4fgD94T$u" resolve="status" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHkYUh" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHkZkO" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHkYXi" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8tDy" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHkYZU" role="lcghm">
                <property role="lacIc" value="STARTUPHOOK        = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHkZ2s" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHkZLT" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="3QwuWjHkZPB" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHkZMP" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHkZY1" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T$w" resolve="startupHook" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHkZgM" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHkZnT" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl09Z" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8tH3" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHl0fU" role="lcghm">
                <property role="lacIc" value="ERRORHOOK          = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHl0jI" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHl0mp" role="lb14g">
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <node concept="2OqwBi" id="3QwuWjHl0q7" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHl0nl" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHl0yx" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T$K" resolve="errorHook" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHl0Ai" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHl0E7" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl0JC" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8tXt" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHl0Rb" role="lcghm">
                <property role="lacIc" value="SHUTDOWNHOOK       = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHl0Wi" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHl0Zs" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="3QwuWjHl139" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHl10o" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHl1bz" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T$O" resolve="shutdownHook" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHl1g9" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHl1lW" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl8ID" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8u0Y" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHl8WP" role="lcghm">
                <property role="lacIc" value="PRETASKHOOK        = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHl92$" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHl96d" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="3QwuWjHl99U" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHl979" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHl9ik" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T$T" resolve="preTaskHook" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHl9np" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHl9ua" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl9BR" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8u3S" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHl9BT" role="lcghm">
                <property role="lacIc" value="POSTTASKHOOK       = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHl9BU" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHl9BV" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="3QwuWjHl9BW" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHl9BX" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHlaQx" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T$Z" resolve="postTaskHook" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHl9BZ" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHl9C0" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl9JD" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8u7p" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHl9JF" role="lcghm">
                <property role="lacIc" value="USESERVICEID       = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHl9JG" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHl9JH" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="3QwuWjHl9JI" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHl9JJ" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHlbyj" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T_n" resolve="useServiceID" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHl9JL" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHl9JM" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHlabm" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8uaU" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHlabo" role="lcghm">
                <property role="lacIc" value="USEPARAMETERACCESS = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHlabp" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHlabq" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="3QwuWjHlabr" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHlabs" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHlbFD" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T_v" resolve="useParamterAccess" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHlabu" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHlabv" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHl9S4" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8uer" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHl9S6" role="lcghm">
                <property role="lacIc" value="USERESSCHEDULER    = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHl9S7" role="lcghm">
                <node concept="2YIFZM" id="3QwuWjHl9S8" role="lb14g">
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                  <node concept="2OqwBi" id="3QwuWjHl9S9" role="37wK5m">
                    <node concept="117lpO" id="3QwuWjHl9Sa" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHla_3" role="2OqNvi">
                      <ref role="3TsBF5" to="u1z9:1x4fgD94T_C" resolve="useResScheduler" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHl9Sc" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHl9Sd" role="lcghm" />
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="3QwuWjHlbOE" role="3cqZAp">
          <node concept="2BGw6n" id="7_fwX8D8uwc" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHlbWc" role="lcghm">
            <property role="lacIc" value="};" />
          </node>
          <node concept="l8MVK" id="4osOqZkmfzo" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHlc4p">
    <ref role="WuzLi" to="u1z9:1x4fgD956aP" resolve="AppMode" />
    <node concept="11bSqf" id="3QwuWjHlc4q" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlc4r" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHlc4B" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlc4P" role="lcghm">
            <property role="lacIc" value="APPMODE " />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l9hG8" id="3QwuWjHlc66" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHlc8V" role="lb14g">
              <node concept="117lpO" id="3QwuWjHlc6R" role="2Oq$k0" />
              <node concept="3TrcHB" id="3QwuWjHlcdj" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="3QwuWjHlcfr" role="lcghm">
            <property role="lacIc" value="{};" />
          </node>
          <node concept="l8MVK" id="4osOqZkmfZl" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="4B0n6H24dYv">
    <ref role="WuzLi" to="u1z9:1x4fgD956_n" resolve="AppModeType" />
    <node concept="11bSqf" id="4B0n6H24dYw" role="11c4hB">
      <node concept="3clFbS" id="4B0n6H24dYx" role="2VODD2">
        <node concept="lc7rE" id="4B0n6H24dYH" role="3cqZAp">
          <node concept="la8eA" id="4B0n6H24dYV" role="lcghm">
            <property role="lacIc" value="APPMODE = " />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l9hG8" id="4B0n6H24$3U" role="lcghm">
            <node concept="2OqwBi" id="4B0n6H24$ew" role="lb14g">
              <node concept="2OqwBi" id="4B0n6H24$6s" role="2Oq$k0">
                <node concept="117lpO" id="4B0n6H24$4H" role="2Oq$k0" />
                <node concept="3TrEf2" id="4B0n6H24$9Q" role="2OqNvi">
                  <ref role="3Tt5mk" to="u1z9:1x4fgD956_o" />
                </node>
              </node>
              <node concept="3TrcHB" id="4B0n6H24$jC" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="4B0n6H24el4" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
          <node concept="l8MVK" id="4B0n6H24enm" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
</model>

