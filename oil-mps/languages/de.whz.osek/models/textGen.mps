<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:a8da1015-2618-4b82-b7b3-7aab82d1ed5d(de.whz.osek.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="4" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="2" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="bwbq" ref="r:aa04fc7a-6e20-48c4-b6ac-7c1ce8638ec4(de.whz.osek.structure)" />
    <import index="x27k" ref="r:75ecab8a-8931-4140-afc6-4b46398710fc(com.mbeddr.core.modules.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="c4fa" ref="r:9f0e84b6-2ec7-4f9e-83e0-feedc77b63a3(com.mbeddr.core.statements.structure)" />
    <import index="qd6m" ref="r:c4c3f7d3-0acf-4671-a134-5fab66c4e637(com.mbeddr.core.modules.behavior)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="mj1l" ref="r:c371cf98-dcc8-4a43-8eb8-8a8096de18b2(com.mbeddr.core.expressions.structure)" />
    <import index="tpce" ref="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
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
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
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
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
    </language>
    <language id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen">
      <concept id="8931911391946696733" name="jetbrains.mps.lang.textGen.structure.ExtensionDeclaration" flags="in" index="9MYSb" />
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
        <child id="7991274449437422201" name="extension" index="33IsuW" />
      </concept>
      <concept id="1233748055915" name="jetbrains.mps.lang.textGen.structure.NodeParameter" flags="nn" index="117lpO" />
      <concept id="1233749247888" name="jetbrains.mps.lang.textGen.structure.GenerateTextDeclaration" flags="in" index="11bSqf" />
      <concept id="1236188139846" name="jetbrains.mps.lang.textGen.structure.WithIndentOperation" flags="nn" index="3izx1p">
        <child id="1236188238861" name="list" index="3izTki" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
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
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1176501494711" name="jetbrains.mps.baseLanguage.collections.structure.IsNotEmptyOperation" flags="nn" index="3GX2aA" />
    </language>
  </registry>
  <node concept="WtQ9Q" id="2UjW4IkI0bx">
    <property role="3GE5qa" value="Timer" />
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
  <node concept="WtQ9Q" id="58wCuMkZajS">
    <property role="3GE5qa" value="Resource" />
    <ref role="WuzLi" to="bwbq:6g77ZYUpC8T" resolve="ResourceDeclaration" />
    <node concept="11bSqf" id="58wCuMkZajT" role="11c4hB">
      <node concept="3clFbS" id="58wCuMkZajU" role="2VODD2">
        <node concept="lc7rE" id="58wCuMkZak6" role="3cqZAp">
          <node concept="l9hG8" id="58wCuMkZakk" role="lcghm">
            <node concept="2OqwBi" id="58wCuMkZatb" role="lb14g">
              <node concept="117lpO" id="58wCuMkZal4" role="2Oq$k0" />
              <node concept="3TrEf2" id="58wCuMkZbuV" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="58wCuMl03ya">
    <property role="3GE5qa" value="Resource" />
    <ref role="WuzLi" to="bwbq:1x4fgD956dR" resolve="ResourceRef" />
    <node concept="11bSqf" id="58wCuMl03yb" role="11c4hB">
      <node concept="3clFbS" id="58wCuMl03yc" role="2VODD2">
        <node concept="lc7rE" id="58wCuMl03yo" role="3cqZAp">
          <node concept="la8eA" id="58wCuMl03z0" role="lcghm">
            <property role="lacIc" value="RESOURCE  = " />
          </node>
          <node concept="l9hG8" id="58wCuMl03$a" role="lcghm">
            <node concept="2OqwBi" id="58wCuMl046z" role="lb14g">
              <node concept="2OqwBi" id="58wCuMl03Dy" role="2Oq$k0">
                <node concept="117lpO" id="58wCuMl03$W" role="2Oq$k0" />
                <node concept="3TrEf2" id="58wCuMl1VBh" role="2OqNvi">
                  <ref role="3Tt5mk" to="bwbq:58wCuMl1UJ2" />
                </node>
              </node>
              <node concept="3TrcHB" id="58wCuMl04_X" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="58wCuMl04GK" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
          <node concept="l8MVK" id="58wCuMl04NN" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="1Y5JHpRzrdh">
    <property role="3GE5qa" value="Event" />
    <ref role="WuzLi" to="bwbq:1x4fgD956ve" resolve="EventRef" />
    <node concept="11bSqf" id="1Y5JHpRzrdi" role="11c4hB">
      <node concept="3clFbS" id="1Y5JHpRzrdj" role="2VODD2">
        <node concept="lc7rE" id="1Y5JHpRzrdv" role="3cqZAp">
          <node concept="la8eA" id="4B0n6H27T1a" role="lcghm">
            <property role="lacIc" value="EVENT = " />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l9hG8" id="1Y5JHpRzrPc" role="lcghm">
            <node concept="2OqwBi" id="1Y5JHpRzsjL" role="lb14g">
              <node concept="2OqwBi" id="1Y5JHpRzrU6" role="2Oq$k0">
                <node concept="117lpO" id="1Y5JHpRzrPW" role="2Oq$k0" />
                <node concept="3TrEf2" id="5JhwNflEF7r" role="2OqNvi">
                  <ref role="3Tt5mk" to="bwbq:5JhwNflEF4y" />
                </node>
              </node>
              <node concept="3TrcHB" id="1Y5JHpRzsyh" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="4B0n6H27TcT" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
          <node concept="l8MVK" id="4B0n6H27Tgp" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="4B0n6H27mLj">
    <property role="3GE5qa" value="Event" />
    <ref role="WuzLi" to="bwbq:4B0n6H25BL_" resolve="EventDeclaration" />
    <node concept="11bSqf" id="4B0n6H27mLk" role="11c4hB">
      <node concept="3clFbS" id="4B0n6H27mLl" role="2VODD2">
        <node concept="lc7rE" id="1Bd1FdR0o_J" role="3cqZAp">
          <node concept="la8eA" id="1Bd1FdR0oAr" role="lcghm">
            <property role="lacIc" value="EVENT " />
          </node>
          <node concept="l9hG8" id="1Bd1FdR0oBf" role="lcghm">
            <node concept="2OqwBi" id="1Bd1FdR0oK7" role="lb14g">
              <node concept="117lpO" id="1Bd1FdR0oC1" role="2Oq$k0" />
              <node concept="3TrcHB" id="1Bd1FdR0pog" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="1Bd1FdR0puZ" role="lcghm">
            <property role="lacIc" value=" {" />
          </node>
          <node concept="l8MVK" id="1Bd1FdR0pAN" role="lcghm" />
        </node>
        <node concept="lc7rE" id="1Bd1FdR0pDi" role="3cqZAp">
          <node concept="2BGw6n" id="1Bd1FdR0pFQ" role="lcghm" />
          <node concept="l9hG8" id="1Bd1FdR0pJJ" role="lcghm">
            <node concept="2OqwBi" id="1Bd1FdR0pSA" role="lb14g">
              <node concept="117lpO" id="1Bd1FdR0pKw" role="2Oq$k0" />
              <node concept="3TrEf2" id="1Bd1FdR0qwJ" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="1Bd1FdR0qAM" role="3cqZAp">
          <node concept="la8eA" id="1Bd1FdR0qEb" role="lcghm">
            <property role="lacIc" value="};" />
          </node>
          <node concept="l8MVK" id="1Bd1FdR0qGJ" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="4osOqZkmveU">
    <property role="3GE5qa" value="Event" />
    <ref role="WuzLi" to="bwbq:1x4fgD956iF" resolve="EventLiteral" />
    <node concept="11bSqf" id="4osOqZkmveV" role="11c4hB">
      <node concept="3clFbS" id="4osOqZkmveW" role="2VODD2">
        <node concept="lc7rE" id="4ZphVsbEpOw" role="3cqZAp">
          <node concept="la8eA" id="4ZphVsbEpOB" role="lcghm">
            <property role="lacIc" value="MASK = " />
          </node>
        </node>
        <node concept="3clFbJ" id="1Bd1FdQZfVX" role="3cqZAp">
          <node concept="3clFbS" id="1Bd1FdQZfVZ" role="3clFbx">
            <node concept="lc7rE" id="1Bd1FdQZgTv" role="3cqZAp">
              <node concept="la8eA" id="1Bd1FdQZgTJ" role="lcghm">
                <property role="lacIc" value="AUTO" />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="1Bd1FdQZgHS" role="3clFbw">
            <node concept="2OqwBi" id="1Bd1FdQZg7D" role="2Oq$k0">
              <node concept="117lpO" id="1Bd1FdQZfZn" role="2Oq$k0" />
              <node concept="3TrEf2" id="1Bd1FdQZgph" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPO" />
              </node>
            </node>
            <node concept="3w_OXm" id="1Bd1FdQZgQL" role="2OqNvi" />
          </node>
          <node concept="9aQIb" id="1Bd1FdQZgUr" role="9aQIa">
            <node concept="3clFbS" id="1Bd1FdQZgUs" role="9aQI4">
              <node concept="lc7rE" id="1Bd1FdQZgX7" role="3cqZAp">
                <node concept="l9hG8" id="1Bd1FdQZgXl" role="lcghm">
                  <node concept="2OqwBi" id="1Bd1FdQZh5r" role="lb14g">
                    <node concept="117lpO" id="1Bd1FdQZgY5" role="2Oq$k0" />
                    <node concept="3TrEf2" id="1Bd1FdQZhny" role="2OqNvi">
                      <ref role="3Tt5mk" to="bwbq:78S7ngm5xPO" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="1Bd1FdQZhvr" role="3cqZAp">
          <node concept="la8eA" id="4osOqZkmvYN" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
          <node concept="l8MVK" id="1Bd1FdQZh$v" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="1Y5JHpRyOwK">
    <property role="3GE5qa" value="Task" />
    <ref role="WuzLi" to="bwbq:1x4fgD956tm" resolve="TaskRef" />
    <node concept="11bSqf" id="1Y5JHpRyOwL" role="11c4hB">
      <node concept="3clFbS" id="1Y5JHpRyOwM" role="2VODD2">
        <node concept="lc7rE" id="1Y5JHpRyOwY" role="3cqZAp">
          <node concept="l9hG8" id="1Y5JHpRyOxc" role="lcghm">
            <node concept="2OqwBi" id="1Y5JHpRyP1e" role="lb14g">
              <node concept="2OqwBi" id="1Y5JHpRyOA7" role="2Oq$k0">
                <node concept="117lpO" id="1Y5JHpRyOxW" role="2Oq$k0" />
                <node concept="3TrEf2" id="1Y5JHpRyOKj" role="2OqNvi">
                  <ref role="3Tt5mk" to="bwbq:1x4fgD956tn" />
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
    <property role="3GE5qa" value="Task" />
    <ref role="WuzLi" to="bwbq:2ZNMQTB12lN" resolve="TaskMacro" />
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
    <property role="3GE5qa" value="Task" />
    <ref role="WuzLi" to="bwbq:4NwoSLUgvyg" resolve="TerminateTaskStatement" />
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
    <property role="3GE5qa" value="Task" />
    <ref role="WuzLi" to="bwbq:4F1Ib7ChyL$" resolve="ExtendedTask" />
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
              <node concept="l9hG8" id="1Bd1FdQYKos" role="lcghm">
                <node concept="2YIFZM" id="1Bd1FdQYKot" role="lb14g">
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <ref role="37wK5l" to="wyt6:~String.valueOf(int):java.lang.String" resolve="valueOf" />
                  <node concept="2OqwBi" id="1Bd1FdQYKou" role="37wK5m">
                    <node concept="117lpO" id="1Bd1FdQYKov" role="2Oq$k0" />
                    <node concept="3TrcHB" id="1Bd1FdQYKow" role="2OqNvi">
                      <ref role="3TsBF5" to="bwbq:1Bd1FdQXRUz" resolve="priority" />
                    </node>
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
                    <ref role="3TsBF5" to="bwbq:3QwuWjHllkV" resolve="schedule" />
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
              <node concept="l9hG8" id="1Bd1FdQYKth" role="lcghm">
                <node concept="2YIFZM" id="1Bd1FdQYKti" role="lb14g">
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <ref role="37wK5l" to="wyt6:~String.valueOf(int):java.lang.String" resolve="valueOf" />
                  <node concept="2OqwBi" id="1Bd1FdQYKtj" role="37wK5m">
                    <node concept="117lpO" id="1Bd1FdQYKtk" role="2Oq$k0" />
                    <node concept="3TrcHB" id="1Bd1FdQYL7s" role="2OqNvi">
                      <ref role="3TsBF5" to="bwbq:1Bd1FdQXRUA" resolve="activationAmount" />
                    </node>
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
                            <ref role="3TtcxE" to="bwbq:62xxBiE6fOz" />
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
                    <ref role="3TtcxE" to="bwbq:62xxBiE6fOz" />
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
                    <ref role="3TtcxE" to="bwbq:4F1Ib7ChyL_" />
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
                    <ref role="3TtcxE" to="bwbq:4F1Ib7ChyLh" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="4B0n6H27Rbt" role="3cqZAp">
              <node concept="2BGw6n" id="58wCuMl0wv$" role="lcghm" />
              <node concept="l9S2W" id="4B0n6H27Rbu" role="lcghm">
                <node concept="2OqwBi" id="4B0n6H27Rbv" role="lbANJ">
                  <node concept="117lpO" id="4B0n6H27Rbw" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="4B0n6H27Rbx" role="2OqNvi">
                    <ref role="3TtcxE" to="bwbq:4F1Ib7ChyLB" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="58wCuMl0wEj" role="3cqZAp">
              <node concept="3clFbS" id="58wCuMl0wEk" role="3clFbx">
                <node concept="lc7rE" id="58wCuMl0wEl" role="3cqZAp">
                  <node concept="2BGw6n" id="58wCuMl0wEm" role="lcghm" />
                  <node concept="la8eA" id="58wCuMl0wEn" role="lcghm">
                    <property role="lacIc" value="STACKSIZE = " />
                  </node>
                  <node concept="l9hG8" id="58wCuMl0wEo" role="lcghm">
                    <node concept="2OqwBi" id="58wCuMl0wEp" role="lb14g">
                      <node concept="117lpO" id="58wCuMl0wEq" role="2Oq$k0" />
                      <node concept="3TrEf2" id="58wCuMl0wEr" role="2OqNvi">
                        <ref role="3Tt5mk" to="bwbq:58wCuMkZKxs" />
                      </node>
                    </node>
                  </node>
                  <node concept="la8eA" id="58wCuMl0wEs" role="lcghm">
                    <property role="lacIc" value=";" />
                  </node>
                  <node concept="l8MVK" id="58wCuMl0wEt" role="lcghm" />
                </node>
              </node>
              <node concept="2OqwBi" id="58wCuMl0wEu" role="3clFbw">
                <node concept="2OqwBi" id="58wCuMl0wEv" role="2Oq$k0">
                  <node concept="117lpO" id="58wCuMl0wEw" role="2Oq$k0" />
                  <node concept="3TrEf2" id="58wCuMl0wEx" role="2OqNvi">
                    <ref role="3Tt5mk" to="bwbq:58wCuMkZKxs" />
                  </node>
                </node>
                <node concept="3x8VRR" id="58wCuMl0wEy" role="2OqNvi" />
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
  <node concept="WtQ9Q" id="3QwuWjHlerh">
    <property role="3GE5qa" value="Task" />
    <ref role="WuzLi" to="bwbq:1x4fgD956cc" resolve="Task" />
    <node concept="11bSqf" id="3QwuWjHleri" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlerj" role="2VODD2">
        <node concept="lc7rE" id="4ZphVsbFECR" role="3cqZAp">
          <node concept="2BGw6n" id="4ZphVsbFECS" role="lcghm" />
          <node concept="la8eA" id="4ZphVsbFECT" role="lcghm">
            <property role="lacIc" value="TASK " />
          </node>
          <node concept="l9hG8" id="4ZphVsbFECU" role="lcghm">
            <node concept="2OqwBi" id="4ZphVsbFECV" role="lb14g">
              <node concept="117lpO" id="4ZphVsbFECW" role="2Oq$k0" />
              <node concept="3TrcHB" id="4ZphVsbFECX" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="l8MVK" id="4ZphVsbFECY" role="lcghm" />
          <node concept="la8eA" id="4ZphVsbFECZ" role="lcghm">
            <property role="lacIc" value="{" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="4ZphVsbFED0" role="lcghm" />
        </node>
        <node concept="3izx1p" id="4ZphVsbFED1" role="3cqZAp">
          <node concept="3clFbS" id="4ZphVsbFED2" role="3izTki">
            <node concept="lc7rE" id="4ZphVsbFED3" role="3cqZAp">
              <node concept="2BGw6n" id="4ZphVsbFED4" role="lcghm" />
              <node concept="la8eA" id="4ZphVsbFED5" role="lcghm">
                <property role="lacIc" value="PRIORITY   = " />
              </node>
              <node concept="l9hG8" id="1Bd1FdQYInh" role="lcghm">
                <node concept="2YIFZM" id="1Bd1FdQYIsS" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(int):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="1Bd1FdQYI_R" role="37wK5m">
                    <node concept="117lpO" id="1Bd1FdQYItP" role="2Oq$k0" />
                    <node concept="3TrcHB" id="1Bd1FdQYJ5t" role="2OqNvi">
                      <ref role="3TsBF5" to="bwbq:1Bd1FdQXRUz" resolve="priority" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4ZphVsbFED9" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4ZphVsbFEDa" role="lcghm" />
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
                    <ref role="3TsBF5" to="bwbq:3QwuWjHllkV" resolve="schedule" />
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
                <node concept="2YIFZM" id="1Bd1FdQYJhR" role="lb14g">
                  <ref role="37wK5l" to="wyt6:~String.valueOf(int):java.lang.String" resolve="valueOf" />
                  <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                  <node concept="2OqwBi" id="1Bd1FdQYJqQ" role="37wK5m">
                    <node concept="117lpO" id="1Bd1FdQYJiO" role="2Oq$k0" />
                    <node concept="3TrcHB" id="1Bd1FdQYJUw" role="2OqNvi">
                      <ref role="3TsBF5" to="bwbq:1Bd1FdQXRUA" resolve="activationAmount" />
                    </node>
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
                            <ref role="3TtcxE" to="bwbq:62xxBiE6fOz" />
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
                    <ref role="3TtcxE" to="bwbq:62xxBiE6fOz" />
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
                    <ref role="3TtcxE" to="bwbq:4F1Ib7ChyLh" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="lc7rE" id="62xxBiE6fYQ" role="3cqZAp">
              <node concept="2BGw6n" id="58wCuMl0rWC" role="lcghm" />
              <node concept="l9S2W" id="62xxBiE6g1D" role="lcghm">
                <node concept="2OqwBi" id="62xxBiE6g3A" role="lbANJ">
                  <node concept="117lpO" id="62xxBiE6g1T" role="2Oq$k0" />
                  <node concept="3Tsc0h" id="62xxBiE6gaL" role="2OqNvi">
                    <ref role="3TtcxE" to="bwbq:4F1Ib7ChyLB" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="58wCuMkZMwf" role="3cqZAp">
              <node concept="3clFbS" id="58wCuMkZMwh" role="3clFbx">
                <node concept="lc7rE" id="58wCuMkZN_o" role="3cqZAp">
                  <node concept="2BGw6n" id="58wCuMkZN_C" role="lcghm" />
                  <node concept="la8eA" id="58wCuMkZNA2" role="lcghm">
                    <property role="lacIc" value="STACKSIZE = " />
                  </node>
                  <node concept="l9hG8" id="58wCuMkZNB3" role="lcghm">
                    <node concept="2OqwBi" id="58wCuMkZNIF" role="lb14g">
                      <node concept="117lpO" id="58wCuMkZNBP" role="2Oq$k0" />
                      <node concept="3TrEf2" id="58wCuMkZOfA" role="2OqNvi">
                        <ref role="3Tt5mk" to="bwbq:58wCuMkZKxs" />
                      </node>
                    </node>
                  </node>
                  <node concept="la8eA" id="58wCuMkZOkJ" role="lcghm">
                    <property role="lacIc" value=";" />
                  </node>
                  <node concept="l8MVK" id="58wCuMkZOq6" role="lcghm" />
                </node>
              </node>
              <node concept="2OqwBi" id="58wCuMkZNjG" role="3clFbw">
                <node concept="2OqwBi" id="58wCuMkZMHq" role="2Oq$k0">
                  <node concept="117lpO" id="58wCuMkZM_F" role="2Oq$k0" />
                  <node concept="3TrEf2" id="58wCuMkZN0i" role="2OqNvi">
                    <ref role="3Tt5mk" to="bwbq:58wCuMkZKxs" />
                  </node>
                </node>
                <node concept="3x8VRR" id="58wCuMkZNyS" role="2OqNvi" />
              </node>
            </node>
          </node>
        </node>
        <node concept="lc7rE" id="4ZphVsbFEDb" role="3cqZAp">
          <node concept="la8eA" id="4ZphVsbFEDc" role="lcghm">
            <property role="lacIc" value="};" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="4ZphVsbFEDd" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="4B0n6H24d0f">
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:7FCpXS_WSTn" resolve="AlarmAutostart" />
    <node concept="11bSqf" id="4B0n6H24d0g" role="11c4hB">
      <node concept="3clFbS" id="4B0n6H24d0h" role="2VODD2">
        <node concept="lc7rE" id="4B0n6H24d4v" role="3cqZAp">
          <node concept="la8eA" id="4B0n6H24d4w" role="lcghm">
            <property role="lacIc" value="AUTOSTART = TRUE" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="58wCuMl0W2p" role="lcghm" />
          <node concept="2BGw6n" id="58wCuMl0Yxt" role="lcghm" />
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
                    <ref role="3Tt5mk" to="bwbq:78S7ngm5xPA" />
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
                    <ref role="3Tt5mk" to="bwbq:78S7ngm5xPC" />
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
                    <ref role="3TtcxE" to="bwbq:7FCpXS_WSQo" />
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
  <node concept="WtQ9Q" id="3QwuWjHles$">
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:5KtH1a6jX_3" resolve="CounterLiteral" />
    <node concept="11bSqf" id="3QwuWjHles_" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlesA" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHltbY" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHltc0" role="lcghm">
            <property role="lacIc" value="MINCYCLE        = " />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l9hG8" id="3QwuWjHltc1" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHltc2" role="lb14g">
              <node concept="117lpO" id="3QwuWjHltc3" role="2Oq$k0" />
              <node concept="3TrEf2" id="3QwuWjHltIR" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPy" />
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
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPc" />
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
                <ref role="3Tt5mk" to="bwbq:78S7ngm5xPv" />
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
  </node>
  <node concept="WtQ9Q" id="3QwuWjHlsGT">
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:7FCpXS_WYAv" resolve="AlarmActionCallback" />
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
                <ref role="3TsBF5" to="bwbq:7FCpXS_WYAw" resolve="callbackName" />
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
  <node concept="WtQ9Q" id="3QwuWjHlerT">
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:1x4fgD956fc" resolve="Alarm" />
    <node concept="11bSqf" id="3QwuWjHlerU" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHlerV" role="2VODD2">
        <node concept="lc7rE" id="4ZphVsbFX98" role="3cqZAp">
          <node concept="la8eA" id="4ZphVsbFX99" role="lcghm">
            <property role="lacIc" value="ALARM " />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l9hG8" id="4ZphVsbFX9a" role="lcghm">
            <node concept="2OqwBi" id="4ZphVsbFX9b" role="lb14g">
              <node concept="117lpO" id="4ZphVsbFX9c" role="2Oq$k0" />
              <node concept="3TrcHB" id="4ZphVsbFX9d" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="4ZphVsbFX9e" role="lcghm">
            <property role="lacIc" value="{" />
          </node>
          <node concept="l8MVK" id="3QwuWjHlmun" role="lcghm" />
        </node>
        <node concept="3izx1p" id="23s$hiVSqXk" role="3cqZAp">
          <node concept="3clFbS" id="23s$hiVSqXm" role="3izTki">
            <node concept="lc7rE" id="4ZphVsbFX9f" role="3cqZAp">
              <node concept="la8eA" id="4ZphVsbFX9g" role="lcghm">
                <property role="lacIc" value="COUNTER = " />
                <property role="ldcpH" value="true" />
              </node>
              <node concept="l9hG8" id="4ZphVsbFX9h" role="lcghm">
                <node concept="2OqwBi" id="3QwuWjHlqqc" role="lb14g">
                  <node concept="2OqwBi" id="4ZphVsbFX9i" role="2Oq$k0">
                    <node concept="117lpO" id="4ZphVsbFX9j" role="2Oq$k0" />
                    <node concept="3TrEf2" id="3QwuWjHlqk7" role="2OqNvi">
                      <ref role="3Tt5mk" to="bwbq:7FCpXS_WYu$" />
                    </node>
                  </node>
                  <node concept="3TrcHB" id="3QwuWjHlqyU" role="2OqNvi">
                    <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4ZphVsbFX9k" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4ZphVsbFX9l" role="lcghm" />
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
                    <ref role="3Tt5mk" to="bwbq:7FCpXS_WYQV" />
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
                        <ref role="3Tt5mk" to="bwbq:7FCpXS_WYwf" />
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
                    <ref role="3Tt5mk" to="bwbq:7FCpXS_WYwf" />
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
        <node concept="lc7rE" id="4ZphVsbFX9m" role="3cqZAp">
          <node concept="la8eA" id="4ZphVsbFX9n" role="lcghm">
            <property role="lacIc" value="};" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="3QwuWjHltTI" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHlri8">
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:7FCpXS_WYIB" resolve="AlarmActionSetEvent" />
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
                  <ref role="3Tt5mk" to="bwbq:7FCpXS_WYGX" />
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
            <node concept="2OqwBi" id="1Bd1FdR0Era" role="lb14g">
              <node concept="2OqwBi" id="3QwuWjHlsho" role="2Oq$k0">
                <node concept="2OqwBi" id="3QwuWjHls0A" role="2Oq$k0">
                  <node concept="117lpO" id="3QwuWjHlrYc" role="2Oq$k0" />
                  <node concept="3TrEf2" id="1Bd1FdR0Eak" role="2OqNvi">
                    <ref role="3Tt5mk" to="bwbq:1Bd1FdR0aYZ" />
                  </node>
                </node>
                <node concept="3TrEf2" id="1Bd1FdR0EfF" role="2OqNvi">
                  <ref role="3Tt5mk" to="bwbq:5JhwNflEF4y" />
                </node>
              </node>
              <node concept="3TrcHB" id="1Bd1FdR0ELt" role="2OqNvi">
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
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:7FCpXS_WYDG" resolve="AlarmActionActivateTask" />
    <node concept="11bSqf" id="3QwuWjHls$i" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHls$j" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHls$v" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHls$w" role="lcghm">
            <property role="lacIc" value="ACTIVATETASK {" />
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
                      <ref role="3Tt5mk" to="bwbq:7FCpXS_WYGX" />
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
  <node concept="WtQ9Q" id="3QwuWjHlook">
    <property role="3GE5qa" value="Message" />
    <ref role="WuzLi" to="bwbq:1x4fgD956$h" resolve="MessageType" />
    <node concept="11bSqf" id="3QwuWjHlool" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHloom" role="2VODD2">
        <node concept="lc7rE" id="3QwuWjHlooV" role="3cqZAp">
          <node concept="la8eA" id="3QwuWjHlop9" role="lcghm">
            <property role="lacIc" value="MESSAGE = " />
          </node>
          <node concept="l9hG8" id="3QwuWjHlopX" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHlo$P" role="lb14g">
              <node concept="2OqwBi" id="3QwuWjHlosq" role="2Oq$k0">
                <node concept="117lpO" id="3QwuWjHloqI" role="2Oq$k0" />
                <node concept="3TrEf2" id="3QwuWjHlovO" role="2OqNvi">
                  <ref role="3Tt5mk" to="bwbq:1x4fgD956$i" />
                </node>
              </node>
              <node concept="3TrcHB" id="3QwuWjHloDX" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="la8eA" id="3QwuWjHloGZ" role="lcghm">
            <property role="lacIc" value=";" />
          </node>
          <node concept="l8MVK" id="3QwuWjHloKg" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHlc4p">
    <property role="3GE5qa" value="Core" />
    <ref role="WuzLi" to="bwbq:1x4fgD956aP" resolve="AppMode" />
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
    <property role="3GE5qa" value="Core" />
    <ref role="WuzLi" to="bwbq:1x4fgD956_n" resolve="AppModeType" />
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
                  <ref role="3Tt5mk" to="bwbq:1x4fgD956_o" />
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
  <node concept="WtQ9Q" id="3QwuWjHkXKU">
    <property role="3GE5qa" value="Core" />
    <ref role="WuzLi" to="bwbq:1x4fgD94T$4" resolve="CPU" />
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
                    <ref role="3Tt5mk" to="bwbq:1x4fgD956aq" />
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
                    <ref role="3TtcxE" to="bwbq:1x4fgD956bG" />
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
                    <ref role="3TtcxE" to="bwbq:7FCpXS_W1Ko" />
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
                    <ref role="3TtcxE" to="bwbq:62xxBiE6sz5" />
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
                    <ref role="3TtcxE" to="bwbq:7FCpXS_W1Kk" />
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
                    <ref role="3TtcxE" to="bwbq:5KtH1a6kkoW" />
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
                    <ref role="3TtcxE" to="bwbq:7FCpXS_WSLS" />
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
    <property role="3GE5qa" value="Core" />
    <ref role="WuzLi" to="bwbq:1x4fgD94T$g" resolve="OS" />
    <node concept="11bSqf" id="3QwuWjHkYtp" role="11c4hB">
      <node concept="3clFbS" id="3QwuWjHkYtq" role="2VODD2">
        <node concept="lc7rE" id="4ZphVsbHI5t" role="3cqZAp">
          <node concept="2BGw6n" id="7_fwX8D8ulF" role="lcghm" />
          <node concept="la8eA" id="4ZphVsbHI5u" role="lcghm">
            <property role="lacIc" value="OS " />
          </node>
          <node concept="l9hG8" id="4ZphVsbHI5v" role="lcghm">
            <node concept="2OqwBi" id="4ZphVsbHI5w" role="lb14g">
              <node concept="117lpO" id="4ZphVsbHI5x" role="2Oq$k0" />
              <node concept="3TrcHB" id="4ZphVsbHI5y" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
          <node concept="l8MVK" id="3QwuWjHlmjd" role="lcghm" />
          <node concept="la8eA" id="4ZphVsbHI5z" role="lcghm">
            <property role="lacIc" value="{" />
            <property role="ldcpH" value="true" />
          </node>
          <node concept="l8MVK" id="4ZphVsbHI5$" role="lcghm" />
        </node>
        <node concept="3izx1p" id="23s$hiVSpqf" role="3cqZAp">
          <node concept="3clFbS" id="23s$hiVSpqh" role="3izTki">
            <node concept="lc7rE" id="4ZphVsbHI5_" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8tzb" role="lcghm" />
              <node concept="la8eA" id="4ZphVsbHI5A" role="lcghm">
                <property role="lacIc" value="STATUS             = " />
              </node>
              <node concept="l9hG8" id="4ZphVsbHI5B" role="lcghm">
                <node concept="2OqwBi" id="7UEdJ0VNeLD" role="lb14g">
                  <node concept="2OqwBi" id="4ZphVsbHI5C" role="2Oq$k0">
                    <node concept="117lpO" id="4ZphVsbHI5D" role="2Oq$k0" />
                    <node concept="3TrcHB" id="3QwuWjHkYS8" role="2OqNvi">
                      <ref role="3TsBF5" to="bwbq:1x4fgD94T$u" resolve="status" />
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VNeXO" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
                  </node>
                </node>
              </node>
              <node concept="la8eA" id="4ZphVsbHI5E" role="lcghm">
                <property role="lacIc" value=";" />
              </node>
              <node concept="l8MVK" id="4ZphVsbHI5F" role="lcghm" />
            </node>
            <node concept="lc7rE" id="3QwuWjHkYXi" role="3cqZAp">
              <node concept="2BGw6n" id="7_fwX8D8tDy" role="lcghm" />
              <node concept="la8eA" id="3QwuWjHkYZU" role="lcghm">
                <property role="lacIc" value="STARTUPHOOK        = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHkZ2s" role="lcghm">
                <node concept="2OqwBi" id="7UEdJ0VMY$p" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHkZLT" role="2Oq$k0">
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <node concept="2OqwBi" id="3QwuWjHkZPB" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHkZMP" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHkZY1" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T$w" resolve="startupHook" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMYLz" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
                <node concept="2OqwBi" id="7UEdJ0VMYkC" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHl0mp" role="2Oq$k0">
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <node concept="2OqwBi" id="3QwuWjHl0q7" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHl0nl" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHl0yx" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T$K" resolve="errorHook" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMYx9" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
                <node concept="2OqwBi" id="7UEdJ0VMY4i" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHl0Zs" role="2Oq$k0">
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <node concept="2OqwBi" id="3QwuWjHl139" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHl10o" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHl1bz" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T$O" resolve="shutdownHook" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMYgN" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
                <node concept="2OqwBi" id="7UEdJ0VMXNW" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHl96d" role="2Oq$k0">
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <node concept="2OqwBi" id="3QwuWjHl99U" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHl979" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHl9ik" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T$T" resolve="preTaskHook" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMY14" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
                <node concept="2OqwBi" id="7UEdJ0VMXzA" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHl9BV" role="2Oq$k0">
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <node concept="2OqwBi" id="3QwuWjHl9BW" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHl9BX" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHlaQx" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T$Z" resolve="postTaskHook" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMXKI" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
                <property role="lacIc" value="USEGETSERVICEID       = " />
              </node>
              <node concept="l9hG8" id="3QwuWjHl9JG" role="lcghm">
                <node concept="2OqwBi" id="7UEdJ0VMXjg" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHl9JH" role="2Oq$k0">
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <node concept="2OqwBi" id="3QwuWjHl9JI" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHl9JJ" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHlbyj" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T_n" resolve="useGetServiceID" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMXwo" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
                <node concept="2OqwBi" id="7UEdJ0VMX2U" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHlabq" role="2Oq$k0">
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <node concept="2OqwBi" id="3QwuWjHlabr" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHlabs" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHlbFD" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T_v" resolve="useParamterAccess" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMXg2" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
                <node concept="2OqwBi" id="7UEdJ0VMWts" role="lb14g">
                  <node concept="2YIFZM" id="3QwuWjHl9S8" role="2Oq$k0">
                    <ref role="1Pybhc" to="wyt6:~String" resolve="String" />
                    <ref role="37wK5l" to="wyt6:~String.valueOf(boolean):java.lang.String" resolve="valueOf" />
                    <node concept="2OqwBi" id="3QwuWjHl9S9" role="37wK5m">
                      <node concept="117lpO" id="3QwuWjHl9Sa" role="2Oq$k0" />
                      <node concept="3TrcHB" id="3QwuWjHla_3" role="2OqNvi">
                        <ref role="3TsBF5" to="bwbq:1x4fgD94T_C" resolve="useResScheduler" />
                      </node>
                    </node>
                  </node>
                  <node concept="liA8E" id="7UEdJ0VMWZG" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.toUpperCase():java.lang.String" resolve="toUpperCase" />
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
        <node concept="lc7rE" id="4ZphVsbHI5G" role="3cqZAp">
          <node concept="2BGw6n" id="7_fwX8D8uwc" role="lcghm" />
          <node concept="la8eA" id="4ZphVsbHI5H" role="lcghm">
            <property role="lacIc" value="};" />
          </node>
          <node concept="l8MVK" id="4osOqZkmfzo" role="lcghm" />
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3QwuWjHkWRX">
    <ref role="WuzLi" to="bwbq:1x4fgD93Cjb" resolve="OilFile" />
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
          <node concept="la8eA" id="58wCuMkZ6m_" role="lcghm">
            <property role="lacIc" value="#include &quot;implementation.oil&quot;" />
          </node>
          <node concept="l8MVK" id="58wCuMkZ6JM" role="lcghm" />
        </node>
        <node concept="lc7rE" id="3QwuWjHkXIB" role="3cqZAp">
          <node concept="l8MVK" id="3QwuWjHkXJ2" role="lcghm" />
        </node>
        <node concept="lc7rE" id="3QwuWjHl7OI" role="3cqZAp">
          <node concept="l9hG8" id="3QwuWjHl7PE" role="lcghm">
            <node concept="2OqwBi" id="3QwuWjHl7Su" role="lb14g">
              <node concept="117lpO" id="3QwuWjHl7Qq" role="2Oq$k0" />
              <node concept="3TrEf2" id="3QwuWjHl7WQ" role="2OqNvi">
                <ref role="3Tt5mk" to="bwbq:7FCpXS_VYUZ" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="58wCuMl1k58">
    <property role="3GE5qa" value="Event" />
    <ref role="WuzLi" to="bwbq:1JmJJmp3CpZ" resolve="EventMaskType" />
    <node concept="11bSqf" id="58wCuMl1k59" role="11c4hB">
      <node concept="3clFbS" id="58wCuMl1k5a" role="2VODD2">
        <node concept="lc7rE" id="58wCuMl1k8t" role="3cqZAp">
          <node concept="la8eA" id="58wCuMl1k8F" role="lcghm">
            <property role="lacIc" value="EventMaskType" />
          </node>
        </node>
        <node concept="3clFbJ" id="5iVHc7E942X" role="3cqZAp">
          <node concept="3clFbS" id="5iVHc7E942Y" role="3clFbx">
            <node concept="lc7rE" id="5iVHc7E942Z" role="3cqZAp">
              <node concept="la8eA" id="5iVHc7E9430" role="lcghm">
                <property role="lacIc" value=" volatile " />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="5iVHc7E9431" role="3clFbw">
            <node concept="117lpO" id="5iVHc7E9432" role="2Oq$k0" />
            <node concept="3TrcHB" id="5iVHc7E9433" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$YI0J" resolve="volatile" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="5iVHc7E9434" role="3cqZAp">
          <node concept="3clFbS" id="5iVHc7E9435" role="3clFbx">
            <node concept="lc7rE" id="5iVHc7E9436" role="3cqZAp">
              <node concept="la8eA" id="5iVHc7E9437" role="lcghm">
                <property role="lacIc" value=" const " />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="5iVHc7E9438" role="3clFbw">
            <node concept="117lpO" id="5iVHc7E9439" role="2Oq$k0" />
            <node concept="3TrcHB" id="5iVHc7E943a" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$N7QC" resolve="const" />
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="58wCuMl1kac" role="3cqZAp" />
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="GqrtFIa6wu">
    <property role="3GE5qa" value="Resource" />
    <ref role="WuzLi" to="bwbq:v5qeus8Gck" resolve="ResourceType" />
    <node concept="11bSqf" id="GqrtFIa6wv" role="11c4hB">
      <node concept="3clFbS" id="GqrtFIa6ww" role="2VODD2">
        <node concept="lc7rE" id="5iVHc7E942S" role="3cqZAp">
          <node concept="la8eA" id="5iVHc7E943g" role="lcghm">
            <property role="lacIc" value="ResourceType" />
          </node>
        </node>
        <node concept="3clFbJ" id="GqrtFIa6wG" role="3cqZAp">
          <node concept="3clFbS" id="GqrtFIa6wH" role="3clFbx">
            <node concept="lc7rE" id="GqrtFIa6wI" role="3cqZAp">
              <node concept="la8eA" id="GqrtFIa6wJ" role="lcghm">
                <property role="lacIc" value=" volatile " />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="GqrtFIa6wK" role="3clFbw">
            <node concept="117lpO" id="GqrtFIa6wL" role="2Oq$k0" />
            <node concept="3TrcHB" id="GqrtFIa6wM" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$YI0J" resolve="volatile" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="GqrtFIa6wN" role="3cqZAp">
          <node concept="3clFbS" id="GqrtFIa6wO" role="3clFbx">
            <node concept="lc7rE" id="GqrtFIa6wP" role="3cqZAp">
              <node concept="la8eA" id="GqrtFIa6wQ" role="lcghm">
                <property role="lacIc" value=" const " />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="GqrtFIa6wR" role="3clFbw">
            <node concept="117lpO" id="GqrtFIa6wS" role="2Oq$k0" />
            <node concept="3TrcHB" id="GqrtFIa6wT" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$N7QC" resolve="const" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="3WvbRq1Rycz">
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:3WvbRq1R3ja" resolve="CounterDeclaration" />
    <node concept="11bSqf" id="3WvbRq1Ryc$" role="11c4hB">
      <node concept="3clFbS" id="3WvbRq1Ryc_" role="2VODD2">
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
        <node concept="lc7rE" id="3WvbRq1Rywz" role="3cqZAp">
          <node concept="2BGw6n" id="3WvbRq1Ryza" role="lcghm" />
          <node concept="l9hG8" id="3WvbRq1RyTw" role="lcghm">
            <node concept="2OqwBi" id="3WvbRq1Rz2j" role="lb14g">
              <node concept="117lpO" id="3WvbRq1RyUd" role="2Oq$k0" />
              <node concept="3TrEf2" id="3WvbRq1RzmO" role="2OqNvi">
                <ref role="3Tt5mk" to="x27k:2VsHNE717Q8" />
              </node>
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
  <node concept="WtQ9Q" id="7JdyDzjqOLn">
    <property role="3GE5qa" value="Timer" />
    <ref role="WuzLi" to="bwbq:7JdyDzjqbBp" resolve="CounterType" />
    <node concept="11bSqf" id="7JdyDzjqOLo" role="11c4hB">
      <node concept="3clFbS" id="7JdyDzjqOLp" role="2VODD2">
        <node concept="lc7rE" id="7JdyDzjqOL_" role="3cqZAp">
          <node concept="la8eA" id="7JdyDzjqOLA" role="lcghm">
            <property role="lacIc" value="CounterType" />
          </node>
        </node>
        <node concept="3clFbJ" id="7JdyDzjqOLB" role="3cqZAp">
          <node concept="3clFbS" id="7JdyDzjqOLC" role="3clFbx">
            <node concept="lc7rE" id="7JdyDzjqOLD" role="3cqZAp">
              <node concept="la8eA" id="7JdyDzjqOLE" role="lcghm">
                <property role="lacIc" value=" volatile " />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="7JdyDzjqOLF" role="3clFbw">
            <node concept="117lpO" id="7JdyDzjqOLG" role="2Oq$k0" />
            <node concept="3TrcHB" id="7JdyDzjqOLH" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$YI0J" resolve="volatile" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="7JdyDzjqOLI" role="3cqZAp">
          <node concept="3clFbS" id="7JdyDzjqOLJ" role="3clFbx">
            <node concept="lc7rE" id="7JdyDzjqOLK" role="3cqZAp">
              <node concept="la8eA" id="7JdyDzjqOLL" role="lcghm">
                <property role="lacIc" value=" const " />
              </node>
            </node>
          </node>
          <node concept="2OqwBi" id="7JdyDzjqOLM" role="3clFbw">
            <node concept="117lpO" id="7JdyDzjqOLN" role="2Oq$k0" />
            <node concept="3TrcHB" id="7JdyDzjqOLO" role="2OqNvi">
              <ref role="3TsBF5" to="mj1l:2zhwXA$N7QC" resolve="const" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

