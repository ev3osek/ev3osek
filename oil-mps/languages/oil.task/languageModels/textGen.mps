<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:c9293280-f877-4daa-acde-936fa12a4362(oil.task.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="0" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="qd6m" ref="r:c4c3f7d3-0acf-4671-a134-5fab66c4e637(com.mbeddr.core.modules.behavior)" />
    <import index="c4fa" ref="r:9f0e84b6-2ec7-4f9e-83e0-feedc77b63a3(com.mbeddr.core.statements.structure)" />
    <import index="sxb1" ref="r:e0f1041f-50c7-4cb6-be85-b08f97c50ebb(oil.task.structure)" implicit="true" />
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
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ng" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
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
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
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
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1176501494711" name="jetbrains.mps.baseLanguage.collections.structure.IsNotEmptyOperation" flags="nn" index="3GX2aA" />
    </language>
  </registry>
  <node concept="WtQ9Q" id="3QwuWjHlerh">
    <ref role="WuzLi" to="sxb1:1x4fgD956cc" resolve="Task" />
    <node concept="11bSqf" id="3QwuWjHleri" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlerj" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHkYtA" role="3cqZAp">
          <node concept="2BGw6n" id="7_fwX8D8JFa" role="lcghm" />
          <node concept="la8eA" id="3QwuWjHkYtO" role="lcghm">
            <property role="lacIc" value="TASK " />
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
                <property role="lacIc" value="PRIORITY   = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHkYKU" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHkYNK" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHkYLG" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3QwuWjHlmUj" role="2OqNvi">
                    <ref role="3Tt5mk" to="sxb1:78S7ngm5xPF" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHkYUh" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHkZkO" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHln5m" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8JKL" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHln5o" role="lcghm">
                <property role="lacIc" value="SCHEDULE   = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHln5p" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHln5q" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHln5r" role="2Oq$k0" />
                  <node concept="3TrcHB" id="3QwuWjHlnx$" role="2OqNvi">
                    <ref role="3TsBF5" to="sxb1:3QwuWjHllkV" resolve="schedule" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHln5t" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHln5u" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHln7q" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8JN$" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHln7s" role="lcghm">
                <property role="lacIc" value="ACTIVATION = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHln7t" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHln7u" role="lb14g">
                  <node concept="117lpO" id="3QwuWjHln7v" role="2Oq$k0" />
                  <node concept="3TrEf2" id="3QwuWjHlon6" role="2OqNvi">
                    <ref role="3Tt5mk" to="sxb1:78S7ngm5xPJ" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="3QwuWjHln7x" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="3QwuWjHln7y" role="lcghm" />
            </node>
            <node concept="3clFbJ" id="4B0n6H252VJ" role="3cqZAp">
              <node concept="3clFbS" id="4B0n6H252VL" role="3clFbx">
                <node concept="lc7rE" id="4B0n6H2550c" role="3cqZAp">
                  <node concept="2BGw6n" id="4B0n6H2550s" role="lcghm" />
                  <node concept="la8eA" id="4B0n6H2550Q" role="lcghm">
                    <property role="lacIc" value="AUTOSTART  = TRUE {" />
                  </node>
                  <node concept="l8MVK" id="4B0n6H2551X" role="lcghm" />
                </node>
                <node concept="3izx1p" id="4B0n6H27QrQ" role="3cqZAp">
                  <node concept="3clFbS" id="4B0n6H27QrS" role="3izTki">
                    <node concept="lc7rE" id="4B0n6H2552p" role="3cqZAp">
                      <node concept="l9S2W" id="4B0n6H2552H" role="lcghm">
                        <node concept="2OqwBi" id="4B0n6H255kE" role="lbANJ">
                          <node concept="117lpO" id="4B0n6H255ei" role="2Oq$k0" />
                          <node concept="3Tsc0h" id="4B0n6H255_4" role="2OqNvi">
                            <ref role="3TtcxE" to="sxb1:62xxBiE6fOz" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="lc7rE" id="4B0n6H255CV" role="3cqZAp">
                  <node concept="2BGw6n" id="4B0n6H255F0" role="lcghm" />
                  <node concept="la8eA" id="4B0n6H255Fq" role="lcghm">
                    <property role="lacIc" value="};" />
                  </node>
                  <node concept="l8MVK" id="4B0n6H255G4" role="lcghm" />
                </node>
              </node>
              <node concept="2OqwBi" id="4B0n6H2541g" role="3clFbw">
                <node concept="2OqwBi" id="4B0n6H2537I" role="2Oq$k0">
                  <node concept="117lpO" id="4B0n6H252ZZ" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4B0n6H253o9" role="2OqNvi">
                    <ref role="3TtcxE" to="sxb1:62xxBiE6fOz" />
                  </node>
                </node>
                <node concept="3GX2aA" id="4B0n6H254Jv" role="2OqNvi" />
              </node>
              <node concept="9aQIb" id="4B0n6H254VF" role="9aQIa">
                <node concept="3clFbS" id="4B0n6H254VG" role="9aQI4">
                  <node concept="lc7rE" id="4B0n6H254Y7" role="3cqZAp">
                    <node concept="2BGw6n" id="4B0n6H254Yl" role="lcghm" />
                    <node concept="la8eA" id="4B0n6H254YF" role="lcghm">
                      <property role="lacIc" value="AUTOSTART  = FALSE;" />
                    </node>
                    <node concept="l8MVK" id="4B0n6H254ZJ" role="lcghm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="3QwuWjHlnOd" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8JQ4" role="lcghm" />
              <node concept="l9S2W" id="3QwuWjHlnRE" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHlnTC" role="lbANJ">
                  <node concept="117lpO" id="3QwuWjHlnRV" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="3QwuWjHlnXs" role="2OqNvi">
                    <ref role="3TtcxE" to="sxb1:4F1Ib7ChyLh" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="62xxBiE6fYQ" role="3cqZAp">
              <node concept="l9S2W" id="62xxBiE6g1D" role="lcghm">
                <node concept="2OqwBi" id="62xxBiE6g3A" role="lbANJ">
                  <node concept="117lpO" id="62xxBiE6g1T" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="62xxBiE6gaL" role="2OqNvi">
                    <ref role="3TtcxE" to="sxb1:4F1Ib7ChyLB" />
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
          <node concept="l8MVK" id="3QwuWjHloVP" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="1Y5JHpRyOwK">
    <ref role="WuzLi" to="sxb1:1x4fgD956tm" resolve="TaskRef" />
    <node concept="11bSqf" id="1Y5JHpRyOwL" role="11c4hB">
      <node concept="3clFbS" id="1Y5JHpRyOwM" role="2VODD2">
        <node concept="lc7rE" id="1Y5JHpRyOwY" role="3cqZAp">
          <node concept="l9hG8" id="1Y5JHpRyOxc" role="lcghm">
            <node concept="2OqwBi" id="1Y5JHpRyP1e" role="lb14g">
              <node concept="2OqwBi" id="1Y5JHpRyOA7" role="2Oq$k0">
                <node concept="117lpO" id="1Y5JHpRyOxW" role="2Oq$k0" />
                <node concept="3TrEf2" id="1Y5JHpRyOKj" role="2OqNvi">
                  <ref role="3Tt5mk" to="sxb1:1x4fgD956tn" />
                </node>
              </node>
              <node concept="3TrcHB" id="1Y5JHpRyPjE" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="7_fwX8D8_nK">
    <ref role="WuzLi" to="sxb1:2ZNMQTB12lN" resolve="TaskMacro" />
    <node concept="11bSqf" id="7_fwX8D8_nL" role="11c4hB">
      <node concept="3clFbS" id="7_fwX8D8_nM" role="2VODD2">
        <node concept="lc7rE" id="7_fwX8D8_nY" role="3cqZAp">
          <node concept="2BGw6n" id="7_fwX8D8_oc" role="lcghm" />
          <node concept="la8eA" id="7_fwX8D8_oA" role="lcghm">
            <property role="lacIc" value="TASK(" />
          </node>
          <node concept="l9hG8" id="7_fwX8D8_pp" role="lcghm">
            <node concept="2OqwBi" id="7_fwX8D8_D7" role="lb14g">
              <node concept="117lpO" id="7_fwX8D8_qb" role="2Oq$k0" />
              <node concept="3TrcHB" id="7_fwX8D8Af$" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="7_fwX8D8Anv" role="lcghm">
            <property role="lacIc" value=") {" />
          </node>
          <node concept="l9S2W" id="7_fwX8D8BUm" role="lcghm">
            <node concept="2OqwBi" id="7_fwX8D8EKC" role="lbANJ">
              <node concept="2OqwBi" id="7_fwX8D8CcH" role="2Oq$k0">
                <node concept="117lpO" id="7_fwX8D8BYr" role="2Oq$k0" />
                <node concept="2qgKlT" id="7_fwX8D8CMA" role="2OqNvi">
                  <ref role="37wK5l" to="qd6m:71UKpntnl7S" resolve="getStatementList" />
                </node>
              </node>
              <node concept="3Tsc0h" id="7_fwX8D8F54" role="2OqNvi">
                <ref role="3TtcxE" to="c4fa:3CmSUB7Fp_m" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="7_fwX8D8Fd$" role="lcghm">
            <property role="lacIc" value="}" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="2ZNMQTB0FYE">
    <ref role="WuzLi" to="sxb1:4NwoSLUgvyg" resolve="TerminateTaskStatement" />
    <node concept="11bSqf" id="2ZNMQTB0FYF" role="11c4hB">
      <node concept="3clFbS" id="2ZNMQTB0FYG" role="2VODD2">
        <node concept="lc7rE" id="2ZNMQTB0HUi" role="3cqZAp">
          <node concept="la8eA" id="2ZNMQTB0HUw" role="lcghm">
            <property role="lacIc" value="TerminateTask();" />
          </node>
          <node concept="l8MVK" id="2ZNMQTB0HVu" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="4B0n6H27Ra6">
    <ref role="WuzLi" to="sxb1:4F1Ib7ChyL$" resolve="ExtendedTask" />
    <node concept="11bSqf" id="4B0n6H27Ra7" role="11c4hB">
      <node concept="3clFbS" id="4B0n6H27Ra8" role="2VODD2">
        <node concept="lc7rE" id="4B0n6H27Rak" role="3cqZAp">
          <node concept="2BGw6n" id="4B0n6H27Ral" role="lcghm" />
          <node concept="la8eA" id="4B0n6H27Ram" role="lcghm">
            <property role="lacIc" value="TASK " />
          </node>
          <node concept="l9hG8" id="4B0n6H27Ran" role="lcghm">
            <node concept="2OqwBi" id="4B0n6H27Rao" role="lb14g">
              <node concept="117lpO" id="4B0n6H27Rap" role="2Oq$k0" />
              <node concept="3TrcHB" id="4B0n6H27Raq" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="l8MVK" id="4B0n6H27Rar" role="lcghm" />
          <node concept="la8eA" id="4B0n6H27Ras" role="lcghm">
            <property role="lacIc" value="{" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="4B0n6H27Rat" role="lcghm" />
        </node>
        <node concept="3izx1p" id="4B0n6H27Rau" role="3cqZAp">
          <node concept="3clFbS" id="4B0n6H27Rav" role="3izTki">
            <node concept="lc7rE" id="4B0n6H27Raw" role="3cqZAp">
              <node concept="2BGw6n" id="4B0n6H27Rax" role="lcghm" />
              <node concept="la8eA" id="4B0n6H27Ray" role="lcghm">
                <property role="lacIc" value="PRIORITY   = " />
              </node>
              <node concept="l9hG8" id="4B0n6H27Raz" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H27Ra$" role="lb14g">
                  <node concept="117lpO" id="4B0n6H27Ra_" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4B0n6H27RaA" role="2OqNvi">
                    <ref role="3Tt5mk" to="sxb1:78S7ngm5xPF" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4B0n6H27RaB" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4B0n6H27RaC" role="lcghm" />
            </node>
            <node concept="lc7rE" id="4B0n6H27RaD" role="3cqZAp">
              <node concept="2BGw6n" id="4B0n6H27RaE" role="lcghm" />
              <node concept="la8eA" id="4B0n6H27RaF" role="lcghm">
                <property role="lacIc" value="SCHEDULE   = " />
              </node>
              <node concept="l9hG8" id="4B0n6H27RaG" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H27RaH" role="lb14g">
                  <node concept="117lpO" id="4B0n6H27RaI" role="2Oq$k0" />
                  <node concept="3TrcHB" id="4B0n6H27RaJ" role="2OqNvi">
                    <ref role="3TsBF5" to="sxb1:3QwuWjHllkV" resolve="schedule" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4B0n6H27RaK" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4B0n6H27RaL" role="lcghm" />
            </node>
            <node concept="lc7rE" id="4B0n6H27RaM" role="3cqZAp">
              <node concept="2BGw6n" id="4B0n6H27RaN" role="lcghm" />
              <node concept="la8eA" id="4B0n6H27RaO" role="lcghm">
                <property role="lacIc" value="ACTIVATION = " />
              </node>
              <node concept="l9hG8" id="4B0n6H27RaP" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H27RaQ" role="lb14g">
                  <node concept="117lpO" id="4B0n6H27RaR" role="2Oq$k0" />
                  <node concept="3TrEf2" id="4B0n6H27RaS" role="2OqNvi">
                    <ref role="3Tt5mk" to="sxb1:78S7ngm5xPJ" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4B0n6H27RaT" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4B0n6H27RaU" role="lcghm" />
            </node>
            <node concept="3clFbJ" id="4B0n6H27RaV" role="3cqZAp">
              <node concept="3clFbS" id="4B0n6H27RaW" role="3clFbx">
                <node concept="lc7rE" id="4B0n6H27RaX" role="3cqZAp">
                  <node concept="2BGw6n" id="4B0n6H27RaY" role="lcghm" />
                  <node concept="la8eA" id="4B0n6H27RaZ" role="lcghm">
                    <property role="lacIc" value="AUTOSTART  = TRUE {" />
                  </node>
                  <node concept="l8MVK" id="4B0n6H27Rb0" role="lcghm" />
                </node>
                <node concept="3izx1p" id="4B0n6H27Rb1" role="3cqZAp">
                  <node concept="3clFbS" id="4B0n6H27Rb2" role="3izTki">
                    <node concept="lc7rE" id="4B0n6H27Rb3" role="3cqZAp">
                      <node concept="l9S2W" id="4B0n6H27Rb4" role="lcghm">
                        <node concept="2OqwBi" id="4B0n6H27Rb5" role="lbANJ">
                          <node concept="117lpO" id="4B0n6H27Rb6" role="2Oq$k0" />
                          <node concept="3Tsc0h" id="4B0n6H27Rb7" role="2OqNvi">
                            <ref role="3TtcxE" to="sxb1:62xxBiE6fOz" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="lc7rE" id="4B0n6H27Rb8" role="3cqZAp">
                  <node concept="2BGw6n" id="4B0n6H27Rb9" role="lcghm" />
                  <node concept="la8eA" id="4B0n6H27Rba" role="lcghm">
                    <property role="lacIc" value="};" />
                  </node>
                  <node concept="l8MVK" id="4B0n6H27Rbb" role="lcghm" />
                </node>
              </node>
              <node concept="2OqwBi" id="4B0n6H27Rbc" role="3clFbw">
                <node concept="2OqwBi" id="4B0n6H27Rbd" role="2Oq$k0">
                  <node concept="117lpO" id="4B0n6H27Rbe" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4B0n6H27Rbf" role="2OqNvi">
                    <ref role="3TtcxE" to="sxb1:62xxBiE6fOz" />
                  </node>
                </node>
                <node concept="3GX2aA" id="4B0n6H27Rbg" role="2OqNvi" />
              </node>
              <node concept="9aQIb" id="4B0n6H27Rbh" role="9aQIa">
                <node concept="3clFbS" id="4B0n6H27Rbi" role="9aQI4">
                  <node concept="lc7rE" id="4B0n6H27Rbj" role="3cqZAp">
                    <node concept="2BGw6n" id="4B0n6H27Rbk" role="lcghm" />
                    <node concept="la8eA" id="4B0n6H27Rbl" role="lcghm">
                      <property role="lacIc" value="AUTOSTART  = FALSE;" />
                    </node>
                    <node concept="l8MVK" id="4B0n6H27Rbm" role="lcghm" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="4B0n6H27RoF" role="3cqZAp">
              <node concept="2BGw6n" id="4B0n6H27Ru4" role="lcghm" />
              <node concept="l9S2W" id="4B0n6H27Ruu" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H27R_u" role="lbANJ">
                  <node concept="117lpO" id="4B0n6H27RuJ" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4B0n6H27S7L" role="2OqNvi">
                    <ref role="3TtcxE" to="sxb1:4F1Ib7ChyL_" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="4B0n6H27Rbn" role="3cqZAp">
              <node concept="2BGw6n" id="4B0n6H27Rbo" role="lcghm" />
              <node concept="l9S2W" id="4B0n6H27Rbp" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H27Rbq" role="lbANJ">
                  <node concept="117lpO" id="4B0n6H27Rbr" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4B0n6H27Rbs" role="2OqNvi">
                    <ref role="3TtcxE" to="sxb1:4F1Ib7ChyLh" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="4B0n6H27Rbt" role="3cqZAp">
              <node concept="l9S2W" id="4B0n6H27Rbu" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H27Rbv" role="lbANJ">
                  <node concept="117lpO" id="4B0n6H27Rbw" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4B0n6H27Rbx" role="2OqNvi">
                    <ref role="3TtcxE" to="sxb1:4F1Ib7ChyLB" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="4B0n6H27Rby" role="3cqZAp">
          <node concept="la8eA" id="4B0n6H27Rbz" role="lcghm">
            <property role="lacIc" value="};" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="4B0n6H27Rb$" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
</model>

